#ifndef AINPR_NPR_LIT_DEBUG_INCLUDED
#define AINPR_NPR_LIT_DEBUG_INCLUDED

#define NPR_LIT_DEBUG_NONE 0
#define NPR_LIT_DEBUG_BASE_COLOR 1
#define NPR_LIT_DEBUG_ALPHA 2
#define NPR_LIT_DEBUG_METALLIC_MASK 3
#define NPR_LIT_DEBUG_AO_MASK 4
#define NPR_LIT_DEBUG_SMOOTHNESS 5
#define NPR_LIT_DEBUG_PERCEPTUAL_ROUGHNESS 6
#define NPR_LIT_DEBUG_NORMAL_MAP_SAMPLE 7
#define NPR_LIT_DEBUG_EMISSION 8
#define NPR_LIT_DEBUG_CHARACTER_SHADOW 9
#define NPR_LIT_DEBUG_SCENE_SHADOW_AND_RAW_SHADOW 10
#define NPR_LIT_DEBUG_MAIN_RAMP_SAMPLE 11
#define NPR_LIT_DEBUG_FINAL_DIFFUSE_TERM 12
#define NPR_LIT_DEBUG_F0_LUT_TINT 13
#define NPR_LIT_DEBUG_IBL_REFLECTION_LIGHTING 14
#define NPR_LIT_DEBUG_RIM_LIGHTING 15
#define NPR_LIT_DEBUG_AMBIENT_BACK_LIGHTING 16

float4 NprLitDebugScalarToColor(float value)
{
    return float4(value.xxx, 1.0);
}

bool TryGetNprLitDebugColor(
    bool debugEnabled,
    int debugMode,
    float3 baseColor,
    float alpha,
    float metallicMask,
    float aoMask,
    float smoothness,
    float perceptualRoughness,
    float4 normalMapSample,
    float3 emission,
    float characterShadow,
    float2 sceneShadowAndRawShadow,
    float4 mainRampSample,
    float3 finalDiffuseTerm,
    float3 f0LutTint,
    float3 iblReflectionLighting,
    float3 rimLighting,
    float3 ambientBackLighting,
    out float4 debugColor)
{
    debugColor = float4(0.0, 0.0, 0.0, 1.0);

    if (!debugEnabled)
        return false;

    switch (debugMode)
    {
        case NPR_LIT_DEBUG_BASE_COLOR:
            debugColor = float4(baseColor, 1.0);
            return true;
        case NPR_LIT_DEBUG_ALPHA:
            debugColor = NprLitDebugScalarToColor(alpha);
            return true;
        case NPR_LIT_DEBUG_METALLIC_MASK:
            debugColor = NprLitDebugScalarToColor(metallicMask);
            return true;
        case NPR_LIT_DEBUG_AO_MASK:
            debugColor = NprLitDebugScalarToColor(aoMask);
            return true;
        case NPR_LIT_DEBUG_SMOOTHNESS:
            debugColor = NprLitDebugScalarToColor(smoothness);
            return true;
        case NPR_LIT_DEBUG_PERCEPTUAL_ROUGHNESS:
            debugColor = NprLitDebugScalarToColor(perceptualRoughness);
            return true;
        case NPR_LIT_DEBUG_NORMAL_MAP_SAMPLE:
            debugColor = normalMapSample;
            return true;
        case NPR_LIT_DEBUG_EMISSION:
            debugColor = float4(emission, 1.0);
            return true;
        case NPR_LIT_DEBUG_CHARACTER_SHADOW:
            debugColor = NprLitDebugScalarToColor(characterShadow);
            return true;
        case NPR_LIT_DEBUG_SCENE_SHADOW_AND_RAW_SHADOW:
            debugColor = float4(sceneShadowAndRawShadow, 0.0, 1.0);
            return true;
        case NPR_LIT_DEBUG_MAIN_RAMP_SAMPLE:
            debugColor = mainRampSample;
            return true;
        case NPR_LIT_DEBUG_FINAL_DIFFUSE_TERM:
            debugColor = float4(finalDiffuseTerm, 1.0);
            return true;
        case NPR_LIT_DEBUG_F0_LUT_TINT:
            debugColor = float4(f0LutTint, 1.0);
            return true;
        case NPR_LIT_DEBUG_IBL_REFLECTION_LIGHTING:
            debugColor = float4(iblReflectionLighting, 1.0);
            return true;
        case NPR_LIT_DEBUG_RIM_LIGHTING:
            debugColor = float4(rimLighting, 1.0);
            return true;
        case NPR_LIT_DEBUG_AMBIENT_BACK_LIGHTING:
            debugColor = float4(ambientBackLighting, 1.0);
            return true;
    }

    return false;
}

#endif
