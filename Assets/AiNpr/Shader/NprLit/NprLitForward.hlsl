#if SHADERPASS != SHADERPASS_FORWARD
#error SHADERPASS_is_not_correctly_define
#endif


#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/MotionVectorVertexShaderCommon.hlsl"

PackedVaryingsType Vert(AttributesMesh inputMesh, AttributesPass inputPass)
{
    VaryingsType varyingsType;
#ifdef HAVE_VFX_MODIFICATION
    AttributesElement inputElement;
    varyingsType.vmesh = VertMesh(inputMesh, inputElement);
    return MotionVectorVS(varyingsType, inputMesh, inputPass, inputElement);
#else
    varyingsType.vmesh = VertMesh(inputMesh);
    return MotionVectorVS(varyingsType, inputMesh, inputPass);
#endif
}

#ifdef TESSELLATION_ON

PackedVaryingsToPS VertTesselation(VaryingsToDS input)
{
    VaryingsToPS output;
    output.vmesh = VertMeshTesselation(input.vmesh);
    return MotionVectorTessellation(output, input);
}

#endif // TESSELLATION_ON

#else // _WRITE_TRANSPARENT_MOTION_VECTOR

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/VertMesh.hlsl"

PackedVaryingsType Vert(AttributesMesh inputMesh)
{
    VaryingsType varyingsType;

#if defined(HAVE_RECURSIVE_RENDERING)
    // If we have a recursive raytrace object, we will not render it.
    // As we don't want to rely on renderqueue to exclude the object from the list,
    // we cull it by settings position to NaN value.
    // TODO: provide a solution to filter dyanmically recursive raytrace object in the DrawRenderer
    if (_EnableRecursiveRayTracing && _RayTracing > 0.0)
    {
        ZERO_INITIALIZE(VaryingsType, varyingsType); // Divide by 0 should produce a NaN and thus cull the primitive.
    }
    else
#endif
    {
        varyingsType.vmesh = VertMesh(inputMesh);
    }

    return PackVaryingsType(varyingsType);
}

#ifdef TESSELLATION_ON

PackedVaryingsToPS VertTesselation(VaryingsToDS input)
{
    VaryingsToPS output;
    output.vmesh = VertMeshTesselation(input.vmesh);

    return PackVaryingsToPS(output);
}

#endif // TESSELLATION_ON

#endif // _WRITE_TRANSPARENT_MOTION_VECTOR


#ifdef TESSELLATION_ON
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/TessellationShare.hlsl"
#endif

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplayMaterial.hlsl"

#if defined(_TRANSPARENT_REFRACTIVE_SORT) || defined(_ENABLE_FOG_ON_TRANSPARENT)
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Water/Shaders/UnderWaterUtilities.hlsl"
#endif

//NOTE: some shaders set target1 to be
//   Blend 1 One OneMinusSrcAlpha
//The reason for this blend mode is to let virtual texturing alpha dither work.
//Anything using Target1 should write 1.0 or 0.0 in alpha to write / not write into the target.

#ifdef UNITY_VIRTUAL_TEXTURING
    #ifdef OUTPUT_SPLIT_LIGHTING
        #define DIFFUSE_LIGHTING_TARGET SV_Target2
        #define SSS_BUFFER_TARGET SV_Target3
    #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
        #define MOTION_VECTOR_TARGET SV_Target2
        #ifdef _TRANSPARENT_REFRACTIVE_SORT
            #define BEFORE_REFRACTION_TARGET SV_Target3
            #define BEFORE_REFRACTION_ALPHA_TARGET SV_Target4
        #endif
    #endif
    #if defined(SHADER_API_PSSL)
        //For exact packing on pssl, we want to write exact 16 bit unorm (respect exact bit packing).
        //In some sony platforms, the default is FMT_16_ABGR, which would incur in loss of precision.
        //Thus, when VT is enabled, we force FMT_32_ABGR
        #pragma PSSL_target_output_format(target 1 FMT_32_ABGR)
    #endif
#else
    #ifdef OUTPUT_SPLIT_LIGHTING
        #define DIFFUSE_LIGHTING_TARGET SV_Target1
        #define SSS_BUFFER_TARGET SV_Target2
    #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
        #define MOTION_VECTOR_TARGET SV_Target1
        #ifdef _TRANSPARENT_REFRACTIVE_SORT
            #define BEFORE_REFRACTION_TARGET SV_Target2
            #define BEFORE_REFRACTION_ALPHA_TARGET SV_Target3
        #endif
    #endif
#endif

void Frag(PackedVaryingsToPS packedInput
    , out float4 outColor : SV_Target0  // outSpecularLighting when outputting split lighting
    #ifdef UNITY_VIRTUAL_TEXTURING
        , out float4 outVTFeedback : SV_Target1
    #endif
    #ifdef OUTPUT_SPLIT_LIGHTING
        , out float4 outDiffuseLighting : DIFFUSE_LIGHTING_TARGET
        , OUTPUT_SSSBUFFER(outSSSBuffer) : SSS_BUFFER_TARGET
    #elif defined(_WRITE_TRANSPARENT_MOTION_VECTOR)
          , out float4 outMotionVec : MOTION_VECTOR_TARGET
        #ifdef _TRANSPARENT_REFRACTIVE_SORT
          , out float4 outBeforeRefractionColor : BEFORE_REFRACTION_TARGET
          , out float4 outBeforeRefractionAlpha : BEFORE_REFRACTION_ALPHA_TARGET
        #endif
    #endif
    #ifdef _DEPTHOFFSET_ON
        , out float outputDepth : DEPTH_OFFSET_SEMANTIC
    #endif
)
{
#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
    // Init outMotionVector here to solve compiler warning (potentially unitialized variable)
    // It is init to the value of forceNoMotion (with 2.0)
    // Always write 1.0 in alpha since blend mode could be active on this target as a side effect of VT feedback buffer
    // motion vector expected output format is RG16
    outMotionVec = float4(2.0, 0.0, 0.0, 1.0);
#endif

    UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(packedInput);
    FragInputs input = UnpackVaryingsToFragInputs(packedInput);

    AdjustFragInputsToOffScreenRendering(input, _OffScreenRendering > 0, _OffScreenDownsampleFactor);

    uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize();

    // input.positionSS is SV_Position
    PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex);

#ifdef VARYINGS_NEED_POSITION_WS
    float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
#else
    // Unused
    float3 V = float3(1.0, 1.0, 1.0); // Avoid the division by 0
#endif

    SurfaceData surfaceData;
    BuiltinData builtinData;
    GetSurfaceAndBuiltinData(input, V, posInput, surfaceData, builtinData);

    BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

    PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

    outColor = float4(0.0, 0.0, 0.0, 0.0);

    // We need to skip lighting when doing debug pass because the debug pass is done before lighting so some buffers may not be properly initialized potentially causing crashes on PS4.

/*#ifdef DEBUG_DISPLAY
    // Init in debug display mode to quiet warning
#ifdef OUTPUT_SPLIT_LIGHTING
    // Always write 1.0 in alpha since blend mode could be active on this target as a side effect of VT feedback buffer
    // Diffuse output is expected to be RGB10, so alpha must always be 1 to ensure it is written.
    outDiffuseLighting = float4(0, 0, 0, 1);
    ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
#endif

    bool viewMaterial = GetMaterialDebugColor(outColor, input, builtinData, posInput, surfaceData, bsdfData);

    if (!viewMaterial)
    {
        if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
        {
            float3 result = float3(0.0, 0.0, 0.0);

            GetPBRValidatorDebug(surfaceData, result);

            outColor = float4(result, 1.0f);
        }
        else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
        {
            float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
            outColor = result;
        }
        else
#endif*/
        {
#ifdef _SURFACE_TYPE_TRANSPARENT
            uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
#else
            uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
#endif
            LightLoopOutput lightLoopOutput;
            LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

            // Alias
            float3 diffuseLighting = lightLoopOutput.diffuseLighting;
            float3 specularLighting = lightLoopOutput.specularLighting;

            diffuseLighting *= GetCurrentExposureMultiplier();
            specularLighting *= GetCurrentExposureMultiplier();

#ifdef OUTPUT_SPLIT_LIGHTING
            if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
            {
                outColor = float4(specularLighting, 1.0);
                // Always write 1.0 in alpha since blend mode could be active on this target as a side effect of VT feedback buffer
                // Diffuse output is expected to be RGB10, so alpha must always be 1 to ensure it is written.
                outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
            }
            else
            {
                outColor = float4(diffuseLighting + specularLighting, 1.0);
                // Always write 1.0 in alpha since blend mode could be active on this target as a side effect of VT feedback buffer
                // Diffuse output is expected to be RGB10, so alpha must always be 1 to ensure it is written.
                outDiffuseLighting = float4(0, 0, 0, 1);
            }
            ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
#else
            outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);

            //my
            LayerTexCoord layerTexCoord;
            ZERO_INITIALIZE(LayerTexCoord, layerTexCoord);
            GetLayerTexCoord(input, layerTexCoord);
        
            float4 baseSample = SAMPLE_UVMAPPING_TEXTURE2D(_BaseColorMap, sampler_BaseColorMap, layerTexCoord.base).rgba * _BaseColor.rgba;
            float3 baseColor = baseSample.xyz;
            float4 controlMask = SAMPLE_UVMAPPING_TEXTURE2D(_MaskMap, sampler_MaskMap, layerTexCoord.base).rgba;
            float flowBlendMask = controlMask.x;
            float primarySpecMask = controlMask.y;
            float lightOcclusionMask = controlMask.z;

            float3 tintedBaseColor = baseColor * 1;
            float3 readableBaseColor = lerp(dot(tintedBaseColor, float3(0.21, 0.71, 0.07)), tintedBaseColor, float3(1, 1, 1));
            
            // RG is used as lighting normal, BA is reserved for hair direction/specular normal.
            float4 dualNormalSample = SAMPLE_UVMAPPING_TEXTURE2D(_NormalMap, sampler_NormalMap, layerTexCoord.base).rgba;
            float2 normalPackedA = (dualNormalSample.xy * 2.0) - (1.0);
            float3 normalTSA = float3(normalPackedA.x, normalPackedA.y, 1);
            float2 normalXYA = normalPackedA.xy;
            normalTSA.z = max(1e-16, sqrt(1.0 - clamp(dot(normalXYA, normalXYA), 0.0, 1.0)));
            float2 normalXYAScaled = normalTSA.xy * _NormalScale;   //光照、漫反射、Ramp、边缘光法线

            //UVMapping hairStrandMapping = layerTexCoord.base;
            //hairStrandMapping.uv = hairStrandMapping.uv * _HairStrandMap_ST.xy + _HairStrandMap_ST.zw;
            //float4 strandMaskSample = SAMPLE_UVMAPPING_TEXTURE2D(_HairStrandMap, sampler_HairStrandMap, hairStrandMapping);
        
            // 3. 由 TBN、实例基矩阵和控制 mask 生成世界空间法线与各向异性发丝切线。
            float3 rootToPixelVector = posInput.positionWS - TransformObjectToWorld(0);
            rootToPixelVector.y = 1e-16;
            float3 rootToPixelDir = normalize(rootToPixelVector);
            float3x3 tbnMatrix = input.tangentToWorld;
            float3 normalWSRaw = mul(float3(normalXYAScaled.x, normalXYAScaled.y, normalTSA.z), tbnMatrix);
            float frontFaceSign = input.isFrontFace? 1.0 : GetDoubleSidedConstants().z;
            float3 normalWS = SafeNormalize(normalWSRaw) * frontFaceSign;
            float3 geometricNormalWS = normalize(surfaceData.geomNormalWS) * frontFaceSign;
            float2 normalPackedB = (dualNormalSample.zw * 2.0) - 1.0;
            float3 normalTSB = float3(normalPackedB.x, normalPackedB.y, 1);
            float2 normalXYB = normalPackedB.xy;
            normalTSB.z = max(1e-16,sqrt(1.0 - saturate(dot(normalXYB, normalXYB))));
            float2 normalXYBScaled = normalTSB.xy * 1;  //头发方向、各向异性高光法线
            float3 secondaryNormalWS = normalize(TransformTangentToWorldDir(float3(normalXYBScaled.x, normalXYBScaled.y, normalTSB.z),tbnMatrix));
            float3x3 objectToWorld3x3 = (float3x3)GetObjectToWorldMatrix();
            //float3 hairFlowSeedWS = float3(_46._m35, 1.0, 0.0) * objectToWorld3x3;
            //float3 hairTangentWS = cross(secondaryNormalWS, mix(cross(secondaryNormalWS, (hairFlowSeedWS * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(hairFlowSeedWS, hairFlowSeedWS)))).xyz), tangentWSAndSign.xyz, vec3(flowBlendMask)).xyz) * mix(1.0, tangentWSAndSign.w, flowBlendMask);
            //float3 viewDirObjectBasis = objectToWorld3x3 * viewDirWS;
            //float anisoViewFactor = pow(clamp(dot(normalize((objectToWorld3x3 * secondaryNormalWS).xz), normalize(viewDirObjectBasis.xz)), 0.0, 1.0), _46._m33);
        
            // 4. 准备屏幕/相机状态，供深度、分块灯光和雾效路径使用。
            float2 screenUV = posInput.positionSS.xy / _ScreenParams.xy;;
            float2 pixelCoordU = float2(posInput.positionSS.xy);
            float3 cameraForwardWS = TransformViewToWorldDir(float3(0,0,1));
            //float probeLightingScale = mix(_15._m44.x, 1.0, _15._m113.w) * _15._m42.x;
            float4 probeDominantDir;
            float3 probeDiffuseColor;
            float3 probeHueColor;
            float probeIntensity;
            
            // 5. Probe/SH 风格的体积光照。fine/mid/coarse 三层 3D 体积混合出漫反射颜色和主方向。
            
            // 6. 可选角色/材质变色。用于特殊状态下增亮、染色，并提高高光响应。
            //float instanceColorOverride = mix(_18._m0[instanceIndex]._m6.x, _15._m111.y, _15._m111.x);
            //float heightColorOverride = spvNMax(_18._m0[instanceIndex]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_18._m0[instanceIndex]._m6.z, _15._m111.w, _15._m111.x) - worldPos.y) * mix(_18._m0[instanceIndex]._m6.y, 1.0, _15._m111.x));
            float overrideSpecBoost;
            float3 baseForLightness;
            float3 baseForDiffuse;
        
            //outColor = float4(secondaryNormalWS.xyz,1);
                
            #ifdef _ENABLE_FOG_ON_TRANSPARENT
            outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
            #endif

            #ifdef _TRANSPARENT_REFRACTIVE_SORT
            ComputeRefractionSplitColor(posInput, outColor, outBeforeRefractionColor, outBeforeRefractionAlpha);
            #endif
#endif

#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
            VaryingsPassToPS inputPass = UnpackVaryingsPassToPS(packedInput.vpass);
            bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
            // outMotionVec is already initialize at the value of forceNoMotion (see above)

             //Motion vector is enabled in SG but not active in VFX
#if defined(HAVE_VFX_MODIFICATION) && !VFX_FEATURE_MOTION_VECTORS
            forceNoMotion = true;
#endif

            if (!forceNoMotion)
            {
                float2 motionVec = CalculateMotionVector(inputPass.positionCS, inputPass.previousPositionCS);
                EncodeMotionVector(motionVec * 0.5, outMotionVec);

                // Always write 1.0 in alpha since blend mode could be active on this target as a side effect of VT feedback buffer
                // motion vector expected output format is RG16
                outMotionVec.zw = 1.0;
            }
#endif
        }

#ifdef DEBUG_DISPLAY
    }
#endif

#ifdef _DEPTHOFFSET_ON
    outputDepth = posInput.deviceDepth;
#endif

#ifdef UNITY_VIRTUAL_TEXTURING
    float vtAlphaValue = builtinData.opacity;
    #if defined(HAS_REFRACTION) && HAS_REFRACTION
        vtAlphaValue = 1.0f - bsdfData.transmittanceMask;
    #endif
    outVTFeedback = PackVTFeedbackWithAlpha(builtinData.vtPackedFeedback, input.positionSS.xy, vtAlphaValue);
    outVTFeedback.rgb *= outVTFeedback.a; // premuliplied alpha
#endif
}
