#if SHADERPASS != SHADERPASS_FORWARD
#error SHADERPASS_is_not_correctly_define
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GlobalSamplers.hlsl"


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

//#if defined(_TRANSPARENT_REFRACTIVE_SORT) || defined(_ENABLE_FOG_ON_TRANSPARENT)
//#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Water/Shaders/UnderWaterUtilities.hlsl"
//#endif

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
            float4 controlMask = SAMPLE_UVMAPPING_TEXTURE2D(_MaskMap, sampler_MaskMap, layerTexCoord.base).rgba;
            float flowBlendMask = controlMask.x;
            float primarySpecMask = controlMask.y;
            float lightOcclusionMask = controlMask.z;
            float materialAlpha = baseSample.w;
            float _46_m18 = 0.5;    //找了好久的关键压低亮度操作
            float3 tintedBaseColor = baseColor * _46_m18;
            float _46_m19 = 1.1;
            float3 readableBaseColor = lerp(dot(tintedBaseColor, float3(0.21, 0.71, 0.07)), tintedBaseColor, _46_m19);
            
            // RG is used as lighting normal, BA is reserved for hair direction/specular normal.
            float4 dualNormalSample = SAMPLE_UVMAPPING_TEXTURE2D(_NormalMap, sampler_NormalMap, layerTexCoord.base).rgba;
            float2 normalPackedA = (dualNormalSample.xy * 2.0) - (1.0);
            float3 normalTSA = float3(normalPackedA.x, normalPackedA.y, 1);
            float2 normalXYA = normalPackedA.xy;
            normalTSA.z = max(1e-16, sqrt(1.0 - clamp(dot(normalXYA, normalXYA), 0.0, 1.0)));
            float2 normalXYAScaled = normalTSA.xy * _NormalScale;   //光照、漫反射、Ramp、边缘光法线

            UVMapping hairStrandMapping = layerTexCoord.base;
            hairStrandMapping.uv = hairStrandMapping.uv * _HairStrandMap_ST.xy + _HairStrandMap_ST.zw;
            float4 strandMaskSample = SAMPLE_UVMAPPING_TEXTURE2D(_HairStrandMap, sampler_HairStrandMap, hairStrandMapping);
        
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
            float _46_m35 = 0.0;    // 发流横向偏移
            float3 hairFlowSeedWS = TransformObjectToWorldDir(float3(_46_m35, 1.0, 0.0));   //骨骼动画留坑
            
            float3 tangentWS = normalize(tbnMatrix[0]);
            float3 hairTangentWS = cross(secondaryNormalWS, lerp(cross(secondaryNormalWS, SafeNormalize(hairFlowSeedWS)), tangentWS, flowBlendMask).xyz);
            float3 viewDirObjectBasis = TransformWorldToObjectDir(viewDirWS);
            float _46_m33 = 3.0;    //菲涅尔衰减
            float anisoViewFactor = pow(clamp(dot(normalize( TransformObjectToWorldNormal(secondaryNormalWS).xz), normalize(viewDirObjectBasis.xz)), 0.0, 1.0), _46_m33);
        
            // 4. 准备屏幕/相机状态，供深度、分块灯光和雾效路径使用。
            float2 screenUV = posInput.positionSS.xy / _ScreenParams.xy;;
            float2 pixelCoordU = float2(posInput.positionSS.xy);
            float3 cameraForwardWS = TransformViewToWorldDir(float3(0,0,1));
            float _15_m113w = 0.0;
            float _15_m42x = 1.0;
            float probeLightingScale = lerp(0.28, 1.0, _15_m113w) * _15_m42x;
            float4 probeDominantDir;
            float3 probeDiffuseColor;
            float3 probeHueColor;
            float probeIntensity;
            
            // *5. Probe/SH 风格的体积光照。fine/mid/coarse 三层 3D 体积混合出漫反射颜色和主方向。
            float _15_m102y = 1.0;
            float3 _15_m103xyz = float3(0.87, 0.93, 1.12);
            if (_15_m102y < 0.5)
            {
                
            }
            else
            {
                probeDominantDir = 0.0;
                probeDiffuseColor = 1.0;
                probeHueColor = _15_m103xyz;
                probeIntensity = probeLightingScale;
            }
            // *6. 可选角色/材质变色。用于特殊状态下增亮、染色，并提高高光响应。
            float instanceColorOverride =0;
            //float instanceColorOverride = mix(_18._m0[instanceIndex]._m6.x, _15._m111.y, _15._m111.x);
            float heightColorOverride = 0;
            //float heightColorOverride = spvNMax(_18._m0[instanceIndex]._m6.w, smoothstep(-0.2, 0.15, mix(_18._m0[instanceIndex]._m6.z, _15._m111.w, _15._m111.x) - worldPos.y) * mix(_18._m0[instanceIndex]._m6.y, 1.0, _15._m111.x));
            float overrideSpecBoost;
            float3 baseForLightness;
            float3 baseForDiffuse;
            if ((instanceColorOverride + heightColorOverride) > 0.0)
            {
                float overrideAmount  = max(instanceColorOverride, heightColorOverride);
                float colorScale = lerp(1.0, 0.8, overrideAmount);
                overrideSpecBoost = lerp(1.0, 2.0, overrideAmount);
                baseForLightness = readableBaseColor * colorScale;
                baseForDiffuse   = baseColor * colorScale;
            }
            else
            {
                overrideSpecBoost = 1.0;
                baseForLightness = readableBaseColor;
                baseForDiffuse = baseColor;
            }
            float3 diffuseAlbedo = baseForDiffuse * 0.96;
            float3 specularTintMask = 0.04 * primarySpecMask;
            float3 rampAlbedo = baseForLightness * 0.96;
        
            // 8. 主光与屏幕遮蔽数据准备。
            DirectionalLightData light = _DirectionalLightDatas[_DirectionalShadowIndex];
            float3 L = -light.forward;
            
            float3 mainLightDirWS = lerp(-light.forward, float3(-0.26, 0.58, 0.76), 1);     // 覆盖主光方向//?
            float3 mainLightDirFlatWS = normalize(float3(mainLightDirWS.x, 1e-16, mainLightDirWS.z));
            float _15_m113y = 1.0;
            float3 mainLightColor = lerp(light.color, 1, _15_m113y);    // 覆盖主光颜色//?
            float3 mainLightColorScaled = mainLightColor * lerp(1.62, 1.0, _15_m113w);    // 增强漫反射和边缘光//?
            
            int _1197 = int(pixelCoordU.x);
            int _1198 = int(pixelCoordU.y);
            //float4 screenOcclusionSample = texelFetch(screenOcclusionTex, ivec3(_1197, _1198, 0).xy, 0);
            //float screenOcclusion = screenOcclusionSample.y;      //screenOcclusionSample.x 系角色自投影
            //float screenOcclusion = 1.0;
            float sceneShadow = 1.0;
            float characterSelfShadow = 1.0;
            float lightingSceneBlend = lerp( lerp( 1.0, sceneShadow, 1.0 ), 1.0, 1 );     //? 
            float nDotMainLight = dot(normalWS, mainLightDirWS);
            float _15_m101z = 0.7;
            float3 directAlbedo = rampAlbedo * _15_m101z;     //?
            float3 softDirectAlbedo = directAlbedo * 0.65;
            float diffuseLuma = dot(diffuseAlbedo, float3(0.2, 0.7, 0.07));
            float cameraBackLightFactor = clamp(-dot(mainLightDirFlatWS.xz, normalize(cameraForwardWS.xz)), 0.0, 1.0);
            float _15_m113x = 1.0;      //?
            float mainRampBlend = 1.0 - _15_m113x;
            // hairRampTex 作为 1D ramp 使用：y 固定 0.5，x 来自 N dot L/视角偏置光照；RGB 改色，A 是权重/mask。
            float remappedNdotMainLight =((-nDotMainLight) * ((nDotMainLight * 0.5) - 1.0)) + 0.5;
    
            float cameraBackWeight = cameraBackLightFactor;
            // 相机俯仰角修正：相机越接近水平看角色，权重越大；越从上/下看，权重越小
            float cameraPitchWeight =smoothstep(0.25, 0.75, 1.0 - abs(cameraForwardWS.y));
            // 5. 最终用于 mix 的 ramp 混合权重
            float rampBlendWeight = cameraBackWeight * cameraPitchWeight * mainRampBlend;
            // 6. 在普通 NdotL 和改造 NdotL 之间混合
            float rampLightTerm = lerp(nDotMainLight, remappedNdotMainLight, rampBlendWeight);
            // 7. 手动 ramp 偏移/覆写
            float rampManualOffset = _DiffuseRampOffset * _15_m113x;
            // 8. 加上偏移，并限制到 [-1, 1]
            float rampCoordSigned = clamp(rampLightTerm + rampManualOffset, -1.0, 1.0);
    
            float2 rampUV = float2((rampCoordSigned * 0.5) + 0.5, 0.5);
            float4 rampSampleMain = SAMPLE_TEXTURE2D(_DiffuseRampMap, sampler_LinearClamp , rampUV);
            // rampSampleMain.w 后续会与 controlMask.z 和屏幕遮蔽取交集。
            float rampMainWeight = rampSampleMain.w;
            float3 rampColor = rampSampleMain.rgb;
            float rampColorChroma = max(max(rampColor.r, rampColor.g), rampColor.b)
                                  - min(min(rampColor.r, rampColor.g), rampColor.b);
            float4 rampSampleView = SAMPLE_TEXTURE2D(_DiffuseRampMap, sampler_LinearClamp, float2((dot(normalWS, cameraForwardWS) * 0.5) + 0.5, 0.5));
            float rampNormalWeight = rampSampleView.w;
            float shadowedMask = lightOcclusionMask * characterSelfShadow;
            float sharedLightMask = min(min(characterSelfShadow, lightOcclusionMask), rampMainWeight);
            float directRampWeight = rampNormalWeight * shadowedMask;
            
            float3 probeAmbientTint = ( (clamp(dot(normalWS, float3(0,1,0)) + 0.15, 0.0, 1.0) * 1.5) + 0.5) * lerp(probeHueColor, 1.0, _15_m102y * sharedLightMask);
            float3 _1288 = float3(sharedLightMask.xxx);
            float3 sceneBlendVec = (lightingSceneBlend);
            float mainLightLuma = Luminance(mainLightColorScaled);
            float3 mainLightDiffuse = lerp(mainLightLuma.xxx, mainLightColorScaled, sharedLightMask);
            float ambientProbeBoostA = min(lerp(0.65, 1.0, probeIntensity), 1.5);
            float ambientProbeBoostB = clamp(probeIntensity, 1.25, 1.75);
            float ambientProbeBoost = lerp(ambientProbeBoostA, ambientProbeBoostB, 0 );
    
            float3 ambientOnlyDiffuse = probeAmbientTint * ambientProbeBoost * 0.9 ;
    
            float3 probeLightTint = lerp(1.0, mainLightColor, _15_m113y);
            float3 probeDiffuse = probeAmbientTint * clamp(probeIntensity, 0.0, 1.5) * probeLightTint;
    
            float3 sceneDiffuse = (mainLightDiffuse + probeDiffuse) * 1.1;
    
            float3 diffuseLightColor = lerp(ambientOnlyDiffuse, sceneDiffuse, lightingSceneBlend);
            
            float graySoft = Luminance(softDirectAlbedo);
            float3 boostedSoft = lerp(graySoft, softDirectAlbedo, 1.2);
    
            float3 directWeight = clamp(shadowedMask * rampNormalWeight + rampMainWeight, 0.0, 1.0);
            float3 rampedDirect = lerp(boostedSoft, directAlbedo, directWeight);
    
            float3 rampedBaseColor = lerp(rampedDirect, diffuseAlbedo, sharedLightMask);
            //float3 rampedBaseColor = mix(mix(mix(vec3(dot(softDirectAlbedo, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), softDirectAlbedo, vec3(1.2000000476837158203125)), directAlbedo, vec3(clamp((occludedMask * rampNormalWeight) + rampMainWeight, 0.0, 1.0))), diffuseAlbedo, _1288);
            float3 rampColoredBase = rampedBaseColor * (1.0 - rampColorChroma + (rampSampleMain.xyz * rampColorChroma));
        
            float3 brightDiffuse = lerp(diffuseLuma, diffuseAlbedo, 1.2);
    
            float3 directSide = lerp(directAlbedo,brightDiffuse,directRampWeight);
    
            float lumaBase = Luminance(rampedBaseColor);
            float lumaRamp = Luminance(rampColoredBase);
    
            float3 rampSide = rampColoredBase * clamp(lumaBase / max(lumaRamp, 0.001), 0.0, 1.5);
    
            float3 shadedBaseColor = lerp(directSide,rampSide,sceneBlendVec);
        
            //float3 shadedBaseColor = lerp(lerp(directAlbedo, lerp(diffuseLuma, diffuseAlbedo, 1.2), directRampWeight), rampColoredBase * clamp(dot(rampedBaseColor, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)) * (1.0 / spvNMax(dot(rampColoredBase, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)), 0.001000000047497451305389404296875)), 0.0, 1.5), sceneBlendVec);
            float4 shadedBaseAndBlend = float4(shadedBaseColor, lightingSceneBlend);
            float specLightWeight = lerp(directRampWeight, sharedLightMask, lightingSceneBlend);

            // 9. 头发 BRDF：两个各向异性高光 lobe，再叠加发丝破碎项；hairSpecularLutTex 提供高光 LUT/ramp。
            float3 objectBasisLightVector = TransformObjectToWorldDir(float3(viewDirObjectBasis.x, lerp(0.5, mainLightDirWS.y, lightingSceneBlend), viewDirObjectBasis.z));
            float _46_m30 = 0.7;    //高光纵向偏移
            float3 primarySpecTangent = normalize(hairTangentWS + (secondaryNormalWS * ((_46_m30 * 2.0) - 1.0)));
            float3 halfVectorRaw = normalize((mainLightDirWS * lightingSceneBlend) + (float3(objectBasisLightVector.x, objectBasisLightVector.y, objectBasisLightVector.z) * 2.0)) + viewDirWS;
            float3 halfVectorWS = SafeNormalize(halfVectorRaw);
            float primaryTangentDotHalf = dot(primarySpecTangent, halfVectorWS);
            float sinTH = sqrt(max(1.0 - primaryTangentDotHalf * primaryTangentDotHalf, 0.0));
            sinTH = max(sinTH, 1e-4);
    
            float primarySpec = pow(sinTH, 200.0);
    
            float3 primarySpecLobe = saturate(primarySpec.xxx * primarySpecMask);
            float specLutY = anisoViewFactor * anisoViewFactor;
            float lutU = primarySpecLobe.x;
            float lutV = primaryTangentDotHalf > 0.0 ? specLutY : 0.0;
    
            float3 specLut = SAMPLE_TEXTURE2D_LOD(
                _HairSpecularLutMap,
                sampler_LinearClamp,
                float2(lutU, lutV),
                0.0
            ).rgb;
    
            float3 primarySpecular = primarySpecLobe * specLut * anisoViewFactor;
            // hairSpecularLutTex 调制很窄的主高光 lobe；anisoViewFactor 根据视线与发丝方向关系衰减高光。
            float primarySpecularMax = max(max(primarySpecular.x, primarySpecular.y), primarySpecular.z);
            float _46_m31 = 0.7;
            float secondaryTangentDotHalf = dot(normalize(hairTangentWS + (secondaryNormalWS * ((_46_m31 * 2.0) - 1.0))), halfVectorWS);
            float _46_m40 = 0.58;
            float strandTangentDotHalf = dot(normalize(hairTangentWS + (secondaryNormalWS * ((2.0 * _46_m40) - 1.0))), halfVectorWS);
            // 将 UV.x 程序条纹、hairStrandMaskTex.x 和当前高光强度混合，打散连续高光。
            float _46_m39 = 300.0;
            float proceduralStripe = ceil(saturate(frac(layerTexCoord.base.uv.x * _46_m39) - 0.5));
    
            float textureStripe = 1.0 - strandMaskSample.r;
    
            float _46_m44 = 1.0;
            float strandMask = lerp(proceduralStripe, textureStripe, _46_m44);
            float _46_m42 = 0.3;
            float breakupBase = lerp(1.0 - _46_m42, 1.0, strandMask);
    
            // 强主高光区域减少打散
            breakupBase = lerp(breakupBase, 1.0, primarySpecularMax);
    
            float strandSinTH = sqrt(max(1.0 - strandTangentDotHalf * strandTangentDotHalf, 0.0));
    
            strandSinTH = max(strandSinTH, 1e-4);
            float _46_m41 = 0.93;
            float strandPower = (float)((int)(200.0 * max(1.0 - _46_m41, 0.0)));
    
            float strandAngleMask = saturate(pow(strandSinTH, strandPower));
    
            float breakupWithAngle = lerp(1.0, breakupBase, strandAngleMask);
    
            float strandBreakup = lerp(1.0, breakupWithAngle, primarySpecMask);
    
    
            float3 diffuseResult = (diffuseLightColor * shadedBaseColor) * strandBreakup;
    
            float _46_m6 = 0.0;     //_46._m6 越大，materialAlpha 对颜色影响越明显
            float alphaColorScale = (1.0 - _46_m6) + (materialAlpha * _46_m6);
            float grayDiffuse = Luminance(diffuseResult);
    
            //strandBreakup 越低，越受 _46._m43 影响，颜色更容易变灰/去饱和。
            float _46_m43 = 1.7;
            float colorKeep = lerp(_46_m43, 1.0, strandBreakup);
            float3 diffuseHair = lerp(grayDiffuse, diffuseResult, colorKeep) * alphaColorScale;
    
            float _46_m32 = 2.0;    //主高光强度
            float3 primarySpec1 =
                primarySpecular *
                specularTintMask *
                _46_m32 *
                5.0 *
                overrideSpecBoost;
    
            float secondarySinTH =
                sqrt(max(1.0 - secondaryTangentDotHalf * secondaryTangentDotHalf, 0.0));
    
            secondarySinTH = max(secondarySinTH, 1e-4);
            float _46_m34 = 0.5;    //次级高光强度
            float secondaryPower = (float)((int)(200.0 * max(1.0 - _46_m34, 0.0)));
            
            float3 _46_m38 = float3(0.277,0.06,0.0);    //次级高光颜色
            float3 secondarySpec =
                pow(secondarySinTH, secondaryPower).xxx *
                anisoViewFactor *
                _46_m38.rgb *
                controlMask.a *
                overrideSpecBoost;
    
            // 主高光强时压制次级高光
            secondarySpec = lerp(secondarySpec, 0.0, primarySpecularMax);
    
            //高光阴影下衰减
            float specLight = ((specLightWeight * 0.5) + 0.5) * lerp(_15_m101z, 1.0, specLightWeight);
    
            float3 specLighting = diffuseLightColor * specLight;
    
            float _15_m114w = 1.0;    //总高光强度
            float3 hairColorBeforeRim = diffuseHair + (primarySpec1 + secondarySpec) * specLighting * _15_m114w;
            float hairColorLuma = Luminance(hairColorBeforeRim);
        
            
        
            outColor = float4(hairColorBeforeRim.xyz,1);
            //outColor = float4(primarySpecularMax.xxx,1);
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
