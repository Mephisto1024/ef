#if SHADERPASS != SHADERPASS_FORWARD
#error SHADERPASS_is_not_correctly_define
#endif
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GlobalSamplers.hlsl"
#include "Assets/AiNpr/Shader/NprLit/NprLitDebug.hlsl"
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

/*#if defined(_TRANSPARENT_REFRACTIVE_SORT) || defined(_ENABLE_FOG_ON_TRANSPARENT)
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Water/Shaders/UnderWaterUtilities.hlsl"
#endif*/

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
            float3 viewDirWS = V;
            LayerTexCoord layerTexCoord;
            ZERO_INITIALIZE(LayerTexCoord, layerTexCoord);
            GetLayerTexCoord(input, layerTexCoord);
        
            float4 baseSample = SAMPLE_UVMAPPING_TEXTURE2D(_BaseColorMap, sampler_BaseColorMap, layerTexCoord.base).rgba * _BaseColor.rgba;
            float3 baseColor = baseSample.xyz;
            
            float4 pbrMaskSample = SAMPLE_UVMAPPING_TEXTURE2D(_MaskMap, sampler_MaskMap, layerTexCoord.base).rgba;
            float metallicMask = pbrMaskSample.x;
            float aoMask = pbrMaskSample.z;
            float perceptualRoughness = 1.0 - pbrMaskSample.w;
            float alpha = baseSample.w;
        
            float _51_m18 = 0.50;
            float3 diffuseTintedForSaturation = baseColor * _51_m18;    //_51._m18 = 0.50
            float3 _51_m19 = 1.00;
            float3 diffuseColorSaturated = lerp(Luminance(diffuseTintedForSaturation), diffuseTintedForSaturation, _51_m19);    //_51._m19 = 1.00
            
            // 3. 法线贴图解码。该打包方式将 X 存在 w*x 中，将 Y 存在 y 中，并在单位半球上重建 Z。
            float4 normalMapSample = SAMPLE_UVMAPPING_TEXTURE2D(_NormalMap, sampler_NormalMap, layerTexCoord.base).rgba;
            normalMapSample.w = normalMapSample.w * normalMapSample.x;
            float2 normalMapXY = (normalMapSample.wy * 2.0) - 1.0;
            float3 tangentSpaceNormal = float3(normalMapXY.x, normalMapXY.y, 1);
            float2 normalXYForReconstruct = normalMapXY.xy;
            tangentSpaceNormal.z = max(1e-16, sqrt(1.0 - clamp(dot(normalXYForReconstruct, normalXYForReconstruct), 0.0, 1.0)));
            float2 scaledNormalXY = tangentSpaceNormal.xy * _NormalScale;    //_51._m3 = 1.00
        
            float4 emissionSample = SAMPLE_UVMAPPING_TEXTURE2D(_EmissiveColorMap, sampler_EmissiveColorMap, layerTexCoord.base);
        
            float3 rootToPixelVector = posInput.positionWS - TransformObjectToWorld(0);
            rootToPixelVector.y = 6.103515625e-05;
            float3 rootToPixelDir = normalize(rootToPixelVector);
        
            // 4. TBN 变换。tangent.xyz、normal 和 tangent.w 的副切线符号将法线变换到世界空间。
            float3x3 tbnMatrix = input.tangentToWorld;
            float3 worldNormalUnnormalized = mul(float3(scaledNormalXY.x, scaledNormalXY.y, tangentSpaceNormal.z), tbnMatrix);
            float frontFaceNormalSign = input.isFrontFace? 1.0 : GetDoubleSidedConstants().z;
            float3 shadingNormal = SafeNormalize(worldNormalUnnormalized) * frontFaceNormalSign;
            float3 geometryNormal = normalize(surfaceData.geomNormalWS) * frontFaceNormalSign;
            
            uint2 pixelCoord = uint2(posInput.positionSS.xy);
            float3 worldCameraForward = TransformViewToWorldDir(float3(0,0,1));    //_17._m1[0].xyz = -1.00, -1.25638E-12, 8.65910E-08; _17._m1[1].xyz = -1.79375E-09, 0.99979, -0.0207; _17._m1[2].xyz = 8.65724E-08, 0.0207, 0.99979
            float _17_m44x = 0.28772;
            float _17_m113w = 0.00;
            float _17_m42x = 1.00;
            float sceneLightingScale = lerp(_17_m44x, 1.0, _17_m113w) * _17_m42x;    //_17._m44.x = 0.28772; _17._m113.w = 0.00; _17._m42.x = 1.00
            float4 probeDominantDirAndWeight;
            float3 probeRgbIrradiance;
            float3 probeColorTint;
            float probeIntensity;
        
            
            // 5. 环境探针。体积探针系数或全局常量构建主方向、RGB 辐照度和染色。
            float _17_m102y = 1.0;
            float3 _17_m103xyz = float3(0.87831, 0.93023, 1.12169);
            if (_17_m102y < 0.5)    //_17._m102.y = 1.00
            {
                
            }
            else
            {
                probeDominantDirAndWeight = 0.0;
                probeRgbIrradiance = 1.0;
                probeColorTint = _17_m103xyz;
                probeIntensity = sceneLightingScale;
            }
    
            //float objectWetness = mix(_20._m0[vObjectIndex]._m6.x, _17._m111.y, _17._m111.x);    //_17._m111.y = 1.00; _17._m111.x = 0.00
            float objectWetness = 0;
            //float heightWetness = spvNMax(_20._m0[vObjectIndex]._m6.w, smoothstep(-0.2, 0.15, mix(_20._m0[vObjectIndex]._m6.z, _17._m111.w, _17._m111.x) - vWorldPos.y) * mix(_20._m0[vObjectIndex]._m6.y, 1.0, _17._m111.x));    //_17._m111.w = -100.00; _17._m111.x = 0.00
            float heightWetness = 0;
            float3 normalForLighting;
            float wetMinimumRoughness;
            float wetCoverage;
            float finalPerceptualRoughness;
            float3 diffuseColorForLighting;
            float3 baseColorAfterWetness;
    
            if ((objectWetness + heightWetness) > 1e-16)
            {
            }
            else
            {
                normalForLighting = shadingNormal;
                wetMinimumRoughness = 1e-16;
                wetCoverage = 0.0;
                finalPerceptualRoughness = perceptualRoughness;
                diffuseColorForLighting = diffuseColorSaturated;
                baseColorAfterWetness = baseColor;
            }
    
            float dielectricDiffuseScale = 0.96 - (metallicMask * 0.96);
            float3 diffuseAlbedo = baseColorAfterWetness * dielectricDiffuseScale;
            float3 specularF0 = lerp(0.04 * pbrMaskSample.y, baseColorAfterWetness, metallicMask);
            float3 diffuseLightingAlbedo = diffuseColorForLighting * dielectricDiffuseScale;
            float roughness2Clamped = max(finalPerceptualRoughness * finalPerceptualRoughness, 0.0078125);
            float roughness4 = roughness2Clamped * roughness2Clamped;
            //vec2 screenVelocity = (vClipNow.xy / vec2(spvNMax(vClipNow.z, 9.9999999392252902907785028219223e-09))) - (vClipPrev.xy / vec2(spvNMax(vClipPrev.z, 9.9999999392252902907785028219223e-09)));
            //screenVelocity.y = -screenVelocity.y;
            //vec2 encodedVelocity = ((sqrt(sqrt(abs(screenVelocity * 0.5))) * vec2(ivec2(sign(screenVelocity)))) * 0.5) + vec2(0.5);
            //vec4 auxOutput = vec4(encodedVelocity.x, encodedVelocity.y, vec4(0.0).z, vec4(0.0).w);
            //auxOutput.z = 1.0;
            //auxOutput.w = (wetCoverage > 0.5) ? 0.699999988079071044921875 : 0.4000000059604644775390625;
            DirectionalLightData light = _DirectionalLightDatas[_DirectionalShadowIndex];
            float3 L = -light.forward;
            float3 mainLightDirMixed = lerp(-light.forward, float3(-0.26, 0.58, 0.76), 1);    //_17._m112.xyz = -0.26339, 0.58779, 0.76494; _17._m102.w = 1.00
            float3 mainLightPlanarDir = normalize(float3(mainLightDirMixed.x, 6.103515625e-05, mainLightDirMixed.z));
            float _17_m113y = 1;
            float3 mainLightColor = lerp(light.color, 1, _17_m113y);    //_17._m106.xyz = 1.00, 1.00, 1.00; _17._m113.y = 1.00
            float3 scaledMainLightColor = mainLightColor * lerp(1.62, 1.0, _17_m113w);    //_17._m113.w = 0.00
        
            // 7. 角色阴影。选择逐物体阴影图块，并用 16 次软采样评估 texCharacterShadowDepth。
            float characterShadow;
            {
                characterShadow = 1;
            }
            // 8. 场景阴影。混合 CSM/虚拟阴影，并可选择用云/雨遮挡对其进行调制。
            float2 sceneShadowAndRawShadow;
            {
                sceneShadowAndRawShadow = 1;
            }
            //float characterShadowMix = lerp(1.0, characterShadow, _37._m6.x);
            float characterShadowMix = 1.0;
            float mainShadow = lerp(lerp(1.0, sceneShadowAndRawShadow.x, 1.0), 1.0, 1);    //_17._m102.z = 1.00
            float ndotlMain = dot(shadingNormal, mainLightDirMixed);
            float _17_m101z = 0.70;    //shadowedLightingScale
            float3 diffuseAlbedoScaled = diffuseLightingAlbedo * _17_m101z;    //_17._m101.z = 0.70
            float3 diffuseAlbedoSoft = diffuseAlbedoScaled * 0.65;
            float diffuseLuma = Luminance(diffuseAlbedo);
            float sunCameraOpposition = clamp(-dot(mainLightPlanarDir.xz, normalize(worldCameraForward.xz)), 0.0, 1.0);
            float _17_m113x = 1.00;     // ndotl随着相机转动
            float globalLightBlendInverse = 1.0 - _17_m113x;    //_17._m113.x = 1.00
            
            // 9. Ramp 光照。texLightRampLut 将主光 NdotL 和法线方向映射到风格化布料/金属过渡。

            float remappedNdotMainLight =((-ndotlMain) * ((ndotlMain * 0.5) - 1.0)) + 0.5;
            float cameraBackWeight = sunCameraOpposition;
            float cameraPitchWeight =smoothstep(0.25, 0.75, 1.0 - abs(worldCameraForward.y));
            float rampBlendWeight = cameraBackWeight * cameraPitchWeight * globalLightBlendInverse;
            float rampLightTerm = lerp(ndotlMain, remappedNdotMainLight, rampBlendWeight);
            float rampManualOffset = _DiffuseRampOffset * _17_m113x;
            float rampCoordSigned = clamp(rampLightTerm + rampManualOffset, -1.0, 1.0);
            float2 rampUV = float2((rampCoordSigned * 0.5) + 0.5, 0.5);
            float4 mainRampSample = SAMPLE_TEXTURE2D(_DiffuseRampMap, sampler_LinearClamp , rampUV);
            
            float mainRampAlpha = mainRampSample.w;
            float mainRampR = mainRampSample.x;
            float mainRampG = mainRampSample.y;
            float mainRampB = mainRampSample.z;
            float mainRampChroma = max(max(mainRampR, mainRampG), mainRampB) - min(min(mainRampR, mainRampG), mainRampB);
            float4 ambientRampSample = SAMPLE_TEXTURE2D(_DiffuseRampMap, sampler_LinearClamp, float2((dot(shadingNormal, worldCameraForward) * 0.5) + 0.5, 0.5));
            float ambientRampAlpha = ambientRampSample.w;
            float aoTimesCharacterShadow = aoMask * characterShadowMix;
            float combinedDirectOcclusion = min(min(characterShadowMix, aoMask), mainRampAlpha);
            float ambientOcclusionRamp = ambientRampAlpha * aoTimesCharacterShadow;
    
            float3 probeRampColor = ((clamp(dot(shadingNormal, float3(0,1,0)) + 0.15, 0.0, 1.0) * 1.5) + 0.5) * lerp(probeColorTint, 1.0, _17_m102y * combinedDirectOcclusion);    //_17._m107.xyz = 0.00, 1.00, 4.37114E-08; _17._m108.x = 0.15; _17._m108.y = 1.50; _17._m108.z = 0.50; _17._m102.y = 1.00
            float3 directOcclusionVec = combinedDirectOcclusion;
            float3 mainShadowVec = mainShadow;
        
            float mainLightLuma = Luminance(scaledMainLightColor);
            float3 mainLightDiffuse = lerp(mainLightLuma.xxx, scaledMainLightColor, combinedDirectOcclusion);
            float ambientProbeBoostA = min(lerp(0.65, 1.0, probeIntensity), 1.5);
            float ambientProbeBoostB = clamp(probeIntensity, 1.25, 1.75);
            float ambientProbeBoost = lerp(ambientProbeBoostA, ambientProbeBoostB, 0 );
        
            float3 ambientOnlyDiffuse = probeRampColor * ambientProbeBoost * 0.9 ;
        
            float3 probeLightTint = lerp(1.0, mainLightColor, _17_m113y);
            float3 probeDiffuse = probeRampColor * clamp(probeIntensity, 0.0, 1.5) * probeLightTint;
        
            float3 sceneDiffuse = (mainLightDiffuse + probeDiffuse) * 1.1;
        
            float3 directLightColor = lerp(ambientOnlyDiffuse, sceneDiffuse, mainShadowVec);
    
            float diffuseAlbedoSoftLuma = Luminance(diffuseAlbedoSoft);
    
            float3 diffuseAlbedoSoftSaturated = lerp(diffuseAlbedoSoftLuma,diffuseAlbedoSoft,1.2);
    
            float diffuseRampBlend = clamp((aoTimesCharacterShadow * ambientRampAlpha) + mainRampAlpha,0.0,1.0);
    
            float3 diffuseRampBase = lerp(diffuseAlbedoSoftSaturated,diffuseAlbedoScaled,diffuseRampBlend);
    
            float3 rampedDiffuseBase = lerp(diffuseRampBase,diffuseAlbedo,directOcclusionVec);
            //float3 rampedDiffuseBase = mix(mix(mix(vec3(dot(diffuseAlbedoSoft, kLumaRec709)), diffuseAlbedoSoft, vec3(1.2)), diffuseAlbedoScaled, vec3(clamp((aoTimesCharacterShadow * ambientRampAlpha) + mainRampAlpha, 0.0, 1.0))), diffuseAlbedo, directOcclusionVec);
    
            float3 rampedDiffuseColored = rampedDiffuseBase * (1.0 - mainRampChroma + (mainRampSample.xyz * mainRampChroma));
            float3 brightDiffuse = lerp(diffuseLuma, diffuseAlbedo, 1.2);
        
            float3 directSide = lerp(diffuseAlbedoScaled,brightDiffuse,ambientOcclusionRamp);
        
            float lumaBase = Luminance(rampedDiffuseBase);
            float lumaRamp = Luminance(rampedDiffuseColored);
        
            float3 rampSide = rampedDiffuseColored  * clamp(lumaBase / max(lumaRamp, 0.001), 0.0, 1.5);
        
            float3 finalDiffuseTerm = lerp(directSide,rampSide,mainShadowVec);
            
            // finalDiffuseTerm = mix(mix(diffuseAlbedoScaled, mix(vec3(diffuseLuma), diffuseAlbedo, vec3(1.2)), vec3(ambientOcclusionRamp)), rampedDiffuseColored * clamp(dot(rampedDiffuseBase, kLumaRec709) * (1.0 / spvNMax(dot(rampedDiffuseColored, kLumaRec709), 0.001000000047497451305389404296875)), 0.0, 1.5), mainShadowVec);
    

            float4 diffuseAndShadow = float4(finalDiffuseTerm, mainShadow);
            float directVisibility = lerp(ambientOcclusionRamp, combinedDirectOcclusion, mainShadow);
            float directIntensityScale = lerp(_17_m101z, 1.0, directVisibility);    //_17._m101.z = 0.70
            
            float3 halfVectorBiasDir = float3(worldCameraForward.x, lerp(0.5, mainLightDirMixed.y, mainShadow), worldCameraForward.z);
            float ndotv = clamp(dot(normalForLighting, V), 0.0, 1.0);
            float3 normalizedHalfVectorBiasDir = SafeNormalize(halfVectorBiasDir);
    
            float3 biasedHalfVector = normalize(mainLightDirMixed * mainShadow +
                normalizedHalfVectorBiasDir * 2.0 +
                V * (2.0 + mainShadow));

            float ndothBiased = dot(normalForLighting, biasedHalfVector);
            //float ndothBiased = dot(normalForLighting, normalize(((mainLightDirMixed * mainShadow) + ((halfVectorBiasDir * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(halfVectorBiasDir, halfVectorBiasDir)))) * 2.0)) + (viewDir * (2.0 + mainShadow))));
            float ggxDenom = (((ndothBiased * roughness4) - ndothBiased) * ndothBiased) + 1.0;
            float ggxDenom2 = ggxDenom * ggxDenom;
            float ggxDistribution = (roughness4 != ggxDenom2) ? (roughness4 / ggxDenom2) : 1.0;
            float smithViewTermA = 2.0 * ndotv;
            float smithViewTermB = (1.0 + ndotv) - ndotv;
            float ndotv2 = ndotv * ndotv;
            // 10. F0 LUT。GGX 分布和粗糙度选择布料/金属高光使用的 F0 染色。
            //vec3 f0TintedByLut = specularF0 * textureLod(sampler2D(texF0TintLut, smpLinearClamp), vec2(mix(ggxDistribution / spvNMin(1.0 / (roughness4 + 9.9999997473787516355514526367188e-05), 65504.0), ndotv2, _51._m4), finalPerceptualRoughness * (1.0 - metallicMask)), 0.0).xyz;    //_51._m4 = 1.00
            float ggxLutCoord = ggxDistribution / min(1.0 / (roughness4 + 0.0001),65504.0);
    
            float viewLutCoord = ndotv2;
            float _51_m4 = 1.00;//F0 Tint LUT 的启用/混合权重
            float f0LutU = lerp(ggxLutCoord, viewLutCoord, _51_m4);
    
            float f0LutV = finalPerceptualRoughness * (1.0 - metallicMask);
    
            float3 f0LutTint = SAMPLE_TEXTURE2D(_F0TintLutMap, sampler_LinearClamp ,float2(f0LutU, f0LutV)).xyz;
    
            float3 f0TintedByLut = specularF0 * f0LutTint;
            
            float3 finalSpecularF0 = lerp(specularF0, f0TintedByLut, _51_m4);    //_51._m4 = 1.00
            float alphaLightingScale = (1.0 - 1/*_51._m6*/) + (alpha * 1/*_51._m6*/);    //_51._m6 = 1.00

            float _mainLightSpecularIntensity = 1.0;
            float3 mainDirectLighting = ((directLightColor * finalDiffuseTerm) * alphaLightingScale) +
                (((f0TintedByLut * clamp((ggxDistribution * (0.5 / ((smithViewTermA + (roughness2Clamped * smithViewTermB)) + 9.9999997473787516355514526367188e-05))) - 6.103515625e-05, 0.0, 20.0)) * ((directLightColor * (((directVisibility * 0.5) + 0.5) * directIntensityScale)) * 1.0)) * _mainLightSpecularIntensity);    //_17._m114.w = 1.00

            float mainDirectLuma = Luminance(mainDirectLighting);
            float mainDirectLumaOverHalf = clamp(mainDirectLuma - 0.5, 0.0, 0.5);
            //vec3 rimLightDir = normalize(cross(worldCameraForward, vec3(_17._m110.xy, 0.0)));    //_17._m110.xy = 8.74228E-08, -1.00
            float vdotn = dot(V, shadingNormal);
            float viewEdgeFactor = 1.0 - abs(vdotn);
            float flatLightNdotL = dot(mainLightPlanarDir, shadingNormal);
            float shadowedAmount = 1.0 - mainShadow;
            float iblPerceptualRoughness = lerp(finalPerceptualRoughness, wetMinimumRoughness, wetCoverage);
            float iblRoughness2 = iblPerceptualRoughness * iblPerceptualRoughness;
            float iblNdotV3 = ndotv2 * ndotv;
            float2 iblFitInput0 = float2(1.0, ndotv);
            float2 iblFitInput1 = float2(1.0, iblRoughness2);
            float3 iblFitInput2 = float3(1.0, iblRoughness2, (iblRoughness2 * iblRoughness2) * iblRoughness2);

            //    float iblScale = dot(mat2(vec2(0.0365463010966777801513671875, 9.0631999969482421875), vec2(3.3270699977874755859375, -9.0475597381591796875)) * iblFitInput0, iblFitInput1) / dot(mat3(vec3(1.0, 9.044010162353515625, 5.565889835357666015625), vec3(3.596849918365478515625, -16.3173999786376953125, 19.788600921630859375), vec3(-1.36772000789642333984375, 9.2294902801513671875, -20.212299346923828125)) * vec3(1.0, ndotv2, iblNdotV3), iblFitInput2);
            //float iblBias = dot(mat2(vec2(0.99044001102447509765625, 1.29677999019622802734375), vec2(-1.28514003753662109375, -0.755906999111175537109375)) * iblFitInput0, iblFitInput1) / dot(mat3(vec3(1.0, 20.3225002288818359375, 121.5630035400390625), vec3(2.9233798980712890625, -27.0301990509033203125, 626.1300048828125), vec3(59.41880035400390625, 222.5919952392578125, 316.62701416015625)) * vec3(1.0, ndotv, iblNdotV3), iblFitInput2);
            //vec3 iblSpecularScaleBias = (finalSpecularF0 * iblScale) + vec3(iblBias);
            //float iblScaleBiasSum = iblScale + iblBias;
            //vec3 viewDirFromSurface = -viewDir;
            //vec3 directAndRimLighting = mix(vec3(mainDirectLuma), mainDirectLighting, vec3((mainDirectLumaOverHalf * mainDirectLumaOverHalf) + 1.0)) + (((((_17._m109.xyz * smoothstep(mix(0.800000011920928955078125, 0.20000000298023223876953125, _17._m110.w), mix(0.89999997615814208984375, 0.5, _17._m110.w), viewEdgeFactor)) * _17._m109.w) * spvNMin(spvNMin(clamp(dot(rootToPixelDir, rimLightDir) + 1.0, 0.0, 1.0), aoMask), characterShadowMix)) * (mix(vec3(0.25), diffuseAlbedo, vec3(_17._m110.z)) * clamp(dot(rimLightDir, shadingNormal), 0.0, 1.0))) + ((((((mix(probeRgbIrradiance * (1.0 / spvNMax(spvNMax(spvNMax(probeRgbIrradiance.x, probeRgbIrradiance.y), probeRgbIrradiance.z) * 0.5, 1.0)), scaledMainLightColor, mainShadowVec) * clamp(mix(dot(probeDominantDirAndWeight.xyz, shadingNormal) * probeDominantDirAndWeight.w, ((-flatLightNdotL) * ((flatLightNdotL * 0.5) - 1.0)) + 0.5, mainShadow), 0.0, 1.0)) * ((shadowedAmount + (sunCameraOpposition * mainShadow)) * globalLightBlendInverse)) * smoothstep(0.60000002384185791015625, 0.800000011920928955078125, viewEdgeFactor)) * spvNMin(aoMask, characterShadowMix)) * (shadowedAmount + (smoothstep(0.100000001490116119384765625, 0.039999999105930328369140625, diffuseLuma) * mainShadow))) * spvNMax(vec3(0.1500000059604644775390625), diffuseAlbedo)));    //_17._m109.xyz = 0.00, 0.00, 0.00; _17._m110.w = 0.40; _17._m109.w = 1.00; _17._m110.z = 0.00
            //vec2 pixelCoordFloat = vec2(pixelCoord);
            //vec2 lightTileCoord = floor(pixelCoordFloat * 0.03125);
            //int lightTileBaseIndex = int((lightTileCoord.x + (lightTileCoord.y * _31._m5)) * 8.0);
            //float depthSliceFloat = floor(linearEyeDepth - (_17._m25.y * _31._m11));    //_17._m25.y = 0.10
            //float depthSliceClamped = clamp(depthSliceFloat, 0.0, _31._m7 - 1.0);
            //int depthSliceBaseIndex = int(depthSliceClamped * 8.0);
            //vec3 lightingAccumulator;
            //// 11. 初始光照累加器：直接光、边缘光、自发光和 cubemap IBL 反射。
            //lightingAccumulator = (directAndRimLighting + (((emissionSample.xyz * _51._m21.xyz) * _51._m7) * alphaLightingScale)) + (((textureLod(samplerCube(texReflectionCube, smpLinearClamp), reflect(viewDirFromSurface, normalForLighting), (1.2000000476837158203125 * log2(spvNMax(iblPerceptualRoughness, 0.001000000047497451305389404296875))) + 5.0).xyz * ((iblSpecularScaleBias + ((finalSpecularF0 * ((1.0 - iblScaleBiasSum) / iblScaleBiasSum)) * iblSpecularScaleBias)) * 1.0)) * ((clamp(probeIntensity, 0.5, 1.5) * _17._m101.w) * directIntensityScale)) * probeColorTint);    //_51._m21.xyz = 0.34793, 0.68676, 1.00; _51._m7 = 0.75; _17._m101.w = 0.90
            //vec3 lightingAccumulatorAfterOneLight;
    // 12. Clustered/Forward+ 动态光循环。屏幕图块和深度切片遮罩选择光源，然后累加漫反射和高光。
        
            // 6. 可选角色/材质变色。用于特殊状态下增亮、染色，并提高高光响应。
            //float instanceColorOverride = mix(_18._m0[instanceIndex]._m6.x, _15._m111.y, _15._m111.x);
            //float heightColorOverride = spvNMax(_18._m0[instanceIndex]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_18._m0[instanceIndex]._m6.z, _15._m111.w, _15._m111.x) - worldPos.y) * mix(_18._m0[instanceIndex]._m6.y, 1.0, _15._m111.x));
            float overrideSpecBoost;
            float3 baseForLightness;
            float3 baseForDiffuse;
        
            outColor = float4(mainDirectLighting.xyz,alpha);
                
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
