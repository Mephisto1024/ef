#ifndef AINPR_NPR_HAIR_DEBUG_INCLUDED
#define AINPR_NPR_HAIR_DEBUG_INCLUDED

#define NPR_HAIR_DEBUG_NONE 0
#define NPR_HAIR_DEBUG_BASE_COLOR 1
#define NPR_HAIR_DEBUG_MATERIAL_ALPHA 2
#define NPR_HAIR_DEBUG_FLOW_BLEND_MASK 3
#define NPR_HAIR_DEBUG_PRIMARY_SPEC_MASK 4
#define NPR_HAIR_DEBUG_LIGHT_OCCLUSION_MASK 5
#define NPR_HAIR_DEBUG_STRAND_MASK_SAMPLE 6
#define NPR_HAIR_DEBUG_NORMAL_WS 7
#define NPR_HAIR_DEBUG_SECONDARY_NORMAL_WS 8
#define NPR_HAIR_DEBUG_TANGENT_WS 9
#define NPR_HAIR_DEBUG_HAIR_TANGENT_WS 10
#define NPR_HAIR_DEBUG_SCENE_SHADOW 11
#define NPR_HAIR_DEBUG_CHARACTER_SELF_SHADOW 12
#define NPR_HAIR_DEBUG_DIFFUSE_HAIR 13
#define NPR_HAIR_DEBUG_PRIMARY_SPEC_RESULT 14
#define NPR_HAIR_DEBUG_SECONDARY_SPEC 15

float3 NprHairDebugDirectionToColor(float3 value)
{
    return saturate(value * 0.5 + 0.5);
}

float4 NprHairDebugScalarToColor(float value)
{
    return float4(value.xxx, 1.0);
}

bool TryGetNprHairDebugColor(
    bool debugEnabled,
    int debugMode,
    float3 baseColor,
    float materialAlpha,
    float flowBlendMask,
    float primarySpecMask,
    float lightOcclusionMask,
    float3 strandMaskSampleXXX,
    float3 normalWS,
    float3 secondaryNormalWS,
    float3 tangentWS,
    float3 hairTangentWS,
    float sceneShadow,
    float characterSelfShadow,
    float3 diffuseHair,
    float3 primarySpecResult,
    float3 secondarySpec,
    out float4 debugColor)
{
    debugColor = float4(0.0, 0.0, 0.0, 1.0);

    if (!debugEnabled)
        return false;

    switch (debugMode)
    {
        case NPR_HAIR_DEBUG_BASE_COLOR:
            debugColor = float4(baseColor, 1.0);
            return true;
        case NPR_HAIR_DEBUG_MATERIAL_ALPHA:
            debugColor = NprHairDebugScalarToColor(materialAlpha);
            return true;
        case NPR_HAIR_DEBUG_FLOW_BLEND_MASK:
            debugColor = NprHairDebugScalarToColor(flowBlendMask);
            return true;
        case NPR_HAIR_DEBUG_PRIMARY_SPEC_MASK:
            debugColor = NprHairDebugScalarToColor(primarySpecMask);
            return true;
        case NPR_HAIR_DEBUG_LIGHT_OCCLUSION_MASK:
            debugColor = NprHairDebugScalarToColor(lightOcclusionMask);
            return true;
        case NPR_HAIR_DEBUG_STRAND_MASK_SAMPLE:
            debugColor = float4(strandMaskSampleXXX, 1.0);
            return true;
        case NPR_HAIR_DEBUG_NORMAL_WS:
            debugColor = float4(NprHairDebugDirectionToColor(normalWS), 1.0);
            return true;
        case NPR_HAIR_DEBUG_SECONDARY_NORMAL_WS:
            debugColor = float4(NprHairDebugDirectionToColor(secondaryNormalWS), 1.0);
            return true;
        case NPR_HAIR_DEBUG_TANGENT_WS:
            debugColor = float4(NprHairDebugDirectionToColor(tangentWS), 1.0);
            return true;
        case NPR_HAIR_DEBUG_HAIR_TANGENT_WS:
            debugColor = float4(NprHairDebugDirectionToColor(hairTangentWS), 1.0);
            return true;
        case NPR_HAIR_DEBUG_SCENE_SHADOW:
            debugColor = NprHairDebugScalarToColor(sceneShadow);
            return true;
        case NPR_HAIR_DEBUG_CHARACTER_SELF_SHADOW:
            debugColor = NprHairDebugScalarToColor(characterSelfShadow);
            return true;
        case NPR_HAIR_DEBUG_DIFFUSE_HAIR:
            debugColor = float4(diffuseHair, 1.0);
            return true;
        case NPR_HAIR_DEBUG_PRIMARY_SPEC_RESULT:
            debugColor = float4(primarySpecResult, 1.0);
            return true;
        case NPR_HAIR_DEBUG_SECONDARY_SPEC:
            debugColor = float4(secondarySpec, 1.0);
            return true;
    }

    return false;
}

#endif
