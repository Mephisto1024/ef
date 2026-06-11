#version 460
#extension GL_EXT_spirv_intrinsics : require

struct _24
{
    mat4 _m0;
    vec4 _m1;
    vec4 _m2;
    mat4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
};

vec4 unusedDecodedTangentSeed;

layout(set = 0, binding = 14, std140) uniform _21_22
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;
    layout(row_major) mat4 _m3;
    layout(row_major) mat4 _m4;
    layout(row_major) mat4 _m5;
    layout(row_major) mat4 _m6;
    layout(row_major) mat4 _m7;
    layout(row_major) mat4 _m8;
    layout(row_major) mat4 _m9;
    layout(row_major) mat4 _m10;
    vec4 _m11;
    layout(row_major) mat4 _m12;
    layout(row_major) mat4 _m13;
    layout(row_major) mat4 _m14;
    layout(row_major) mat4 _m15;
    layout(row_major) mat4 _m16;
    layout(row_major) mat4 _m17;
    layout(row_major) mat4 _m18;
    layout(row_major) mat4 _m19;
    layout(row_major) mat4 _m20;
    vec4 _m21;
    vec4 _m22;
    vec4 _m23;
    vec4 _m24;
    vec4 _m25;
    vec4 _m26;
    vec4 _m27;
    vec4 _m28[6];
    vec4 _m29[6];
    vec4 _m30;
    vec4 _m31;
    vec4 _m32;
    vec4 _m33;
    vec4 _m34;
    vec4 _m35;
    vec4 _m36;
    vec4 _m37;
    float _m38;
    float _m39;
    float _m40;
    uint _m41;
    vec4 _m42;
    ivec4 _m43;
    vec4 _m44;
    vec4 _m45;
    vec4 _m46;
    vec4 _m47;
    vec4 _m48;
    vec4 _m49;
    vec4 _m50;
    vec4 _m51;
    vec4 _m52;
    vec4 _m53;
    vec4 _m54[4];
    vec4 _m55[4];
    vec4 _m56[4];
    vec4 _m57[4];
    vec4 _m58;
    vec4 _m59;
    vec4 _m60[4];
    vec4 _m61[4];
    vec4 _m62[4];
    vec4 _m63;
    vec4 _m64;
    vec4 _m65;
    vec4 _m66;
    vec4 _m67;
    vec4 _m68;
    vec4 _m69;
    vec4 _m70;
    vec4 _m71;
    vec4 _m72;
    vec4 _m73;
    vec4 _m74;
    vec4 _m75;
    vec4 _m76;
    vec4 _m77;
    vec4 _m78;
    vec4 _m79;
    vec4 _m80;
    vec4 _m81;
    vec4 _m82;
    vec4 _m83;
    vec4 _m84;
    vec4 _m85;
    vec4 _m86;
    vec4 _m87;
    vec4 _m88;
    vec4 _m89;
    vec4 _m90;
    vec4 _m91;
    vec4 _m92;
    vec4 _m93;
    vec4 _m94;
    vec4 _m95;
    vec4 _m96;
    vec4 _m97;
    vec4 _m98;
    vec4 _m99;
    vec4 _m100;
    vec4 _m101;
    vec4 _m102;
    vec4 _m103;
    vec4 _m104;
    vec4 _m105;
    vec4 _m106;
    vec4 _m107;
    vec4 _m108;
    vec4 _m109;
    vec4 _m110;
    vec4 _m111;
    vec4 _m112;
    vec4 _m113;
    vec4 _m114;
    vec4 _m115;
    vec4 _m116;
    vec4 _m117;
    vec4 _m118;
    vec4 _m119;
    vec4 _m120[2];
    vec4 _m121[2];
    float _m122;
    float _m123;
    float _m124;
    float _m125;
    vec4 _m126;
    vec4 _m127;
    vec4 _m128;
    vec4 _m129;
    vec4 _m130;
    vec4 _m131;
    vec4 _m132;
    vec4 _m133;
    vec4 _m134;
    vec4 _m135;
    vec4 _m136;
    vec4 _m137;
    vec4 _m138;
    vec4 _m139;
    vec4 _m140;
    vec4 _m141;
    vec4 _m142;
    vec4 _m143;
    vec4 _m144;
    vec4 _m145;
    vec4 _m146;
    vec4 _m147;
    vec4 _m148;
    vec4 _m149;
    vec4 _m150;
    vec4 _m151;
    vec4 _m152;
    vec4 _m153;
    vec4 _m154;
    vec4 _m155;
    layout(row_major) mat4 _m156;
    vec4 _m157;
    vec4 _m158;
    vec4 _m159[32];
} _22;

layout(set = 2, binding = 0, std140) uniform _23_25
{
    layout(row_major) _24 _m0[256];
} _25;

layout(set = 0, binding = 16, std430) readonly buffer _29_30
{
    vec4 _m0[];
} _30;

layout(set = 1, binding = 1, std140) uniform _31_32
{
    float _m0;
    float _m1;
    float _m2;
    float _m3;
    float _m4;
    float _m5;
    float _m6;
    float _m7;
    float _m8;
    float _m9;
    float _m10;
    float _m11;
    float _m12;
    float _m13;
    float _m14;
    float _m15;
    float _m16;
    float _m17;
    float _m18;
    float _m19;
    vec4 _m20;
    vec4 _m21;
    vec4 _m22;
    vec4 _m23;
    vec4 _m24;
    vec4 _m25;
    float _m26;
    float _m27;
    float _m28;
    float _m29;
    float _m30;
    float _m31;
    float _m32;
    float _m33;
    float _m34;
    float _m35;
    float _m36;
    float _m37;
    vec4 _m38;
    vec4 _m39;
    vec4 _m40;
    float _m41;
    float _m42;
    float _m43;
    float _m44;
    vec4 _m45;
    vec4 _m46;
    vec4 _m47;
    vec4 _m48;
    vec4 _m49;
    vec4 _m50;
    float _m51;
    float _m52;
    float _m53;
    float _m54;
    float _m55;
    float _m56;
    float _m57;
    float _m58;
} _32;

layout(set = 0, binding = 4) uniform sampler linearSampler;
layout(set = 1, binding = 0) uniform texture2D furMaskTexture;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec2 inUv0;
layout(location = 2) in vec3 inNormalOrPackedFrame;
layout(location = 3) in vec4 inTangent;
layout(location = 4) in vec2 inFurUv;
layout(location = 5) in vec4 inPosition1;
layout(location = 6) in vec4 inBlendWeights;
layout(location = 7) in uvec4 inBlendIndices;
layout(location = 0) out vec2 outUv0;
layout(location = 1) out vec3 outWorldPosition;
layout(location = 2) out vec3 outWorldNormal;
layout(location = 3) out vec4 outWorldTangent;
layout(location = 4) out vec2 outFurUv;
layout(location = 5) out vec3 outFurClipPosition;
layout(location = 6) out vec3 outShadowClipPosition;
layout(location = 7) flat out uint outInstanceIndex;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    uint packedFrameBits = floatBitsToUint(inNormalOrPackedFrame.x);
    bool hasPackedFrame = (packedFrameBits & 1073741824u) > 0u;
    vec3 objectNormal;
    vec4 objectTangent;
    if (hasPackedFrame)
    {
        // The normal is octahedron encoded in three 10-bit signed fields stored in the normal input.
        float packedNormalX = float((packedFrameBits << 22u) >> 22u);
        float packedNormalY = float((packedFrameBits << 12u) >> 22u);
        float packedTangentAngle = float((packedFrameBits << 2u) >> 22u);
        vec3 octNormalXY = vec3((packedNormalX >= 512.0) ? (packedNormalX - 1024.0) : packedNormalX, (packedNormalY >= 512.0) ? (packedNormalY - 1024.0) : packedNormalY, 0.0) * 0.001956947147846221923828125;
        float octNormalZ = (1.0 - abs(octNormalXY.x)) - abs(octNormalXY.y);
        vec3 foldedNormal = octNormalXY;
        foldedNormal.z = octNormalZ;
        vec2 unfoldedNormalXY = mix(foldedNormal.xy, (vec2(1.0) - abs(foldedNormal.yx)) * ((step(vec2(0.0), foldedNormal.xy) * 2.0) - vec2(1.0)), bvec2(octNormalZ < 0.0));
        vec3 decodedNormal = normalize(vec3(unfoldedNormalXY.x, unfoldedNormalXY.y, foldedNormal.z));
        float decodedTangentAngle = ((packedTangentAngle >= 512.0) ? (packedTangentAngle - 1024.0) : packedTangentAngle) * 0.001956947147846221923828125;
        vec3 tangentSeed = decodedNormal.yzx - decodedNormal.zxy;
        vec3 tangentAxis = normalize(tangentSeed - vec3(dot(tangentSeed, decodedNormal)));
        float tangentAngleSign = (decodedTangentAngle < 0.0) ? (-1.0) : 1.0;
        float tangentAngleCosLike = 1.0 - ((decodedTangentAngle * tangentAngleSign) * 2.0);
        vec3 decodedTangentXYZ = mat2x3(tangentAxis, normalize(cross(decodedNormal, tangentAxis))) * normalize(vec2(tangentAngleCosLike, tangentAngleSign * (1.0 - abs(tangentAngleCosLike))));
        vec4 decodedTangent = vec4(decodedTangentXYZ.x, decodedTangentXYZ.y, decodedTangentXYZ.z, unusedDecodedTangentSeed.w);
        decodedTangent.w = (float((packedFrameBits >> 31u) & 1u) * 2.0) - 1.0;
        objectNormal = decodedNormal;
        objectTangent = decodedTangent;
    }
    else
    {
        objectNormal = inNormalOrPackedFrame;
        objectTangent = vec4(0.0);
    }
    vec4 selectedObjectTangent = mix(inTangent, objectTangent, bvec4(hasPackedFrame));
    vec4 skinnedTangent;
    vec3 skinnedNormal;
    vec3 skinnedPosition0;
    vec3 skinnedPosition1;
    do
    {
        vec4 objectPosition4 = vec4(inPosition, 1.0);
        uint instanceSkinFlags = floatBitsToUint(_25._m0[uint(gl_InstanceIndex)]._m1.w);
        uint activeBoneCount = instanceSkinFlags & 4294967247u;
        if (((instanceSkinFlags & 32u) == 0u) || (activeBoneCount == 0u))
        {
            skinnedTangent = selectedObjectTangent;
            skinnedNormal = objectNormal;
            skinnedPosition0 = inPosition;
            skinnedPosition1 = inPosition1.xyz;
            break;
        }
        uvec4 boneIndexTriples = inBlendIndices * uvec4(3u);
        uvec4 normalMatrixRowBase = uvec4(floatBitsToUint(_25._m0[uint(gl_InstanceIndex)]._m2.x) + 3u) + boneIndexTriples;
        uvec4 positionMatrixRowBase = uvec4(floatBitsToUint(_25._m0[uint(gl_InstanceIndex)]._m2.y) + 3u) + boneIndexTriples;
        uint positionBone0Row0 = positionMatrixRowBase.x;
        uint positionBone0Row1 = positionBone0Row0 + 1u;
        uint positionBone0Row2 = positionBone0Row0 + 2u;
        uint normalBone0Row0 = normalMatrixRowBase.x;
        uint normalBone0Row1 = normalBone0Row0 + 1u;
        uint normalBone0Row2 = normalBone0Row0 + 2u;
        vec4 normalRow2Partial;
        vec4 normalRow1Partial;
        vec4 normalRow0Partial;
        vec4 positionRow2Partial;
        vec4 positionRow1Partial;
        vec4 positionRow0Partial;
        if (activeBoneCount >= 2u)
        {
            uint positionBone1Row0 = positionMatrixRowBase.y;
            uint normalBone1Row0 = normalMatrixRowBase.y;
            normalRow2Partial = (_30._m0[normalBone0Row2] * inBlendWeights.x) + (_30._m0[normalBone1Row0 + 2u] * inBlendWeights.y);
            normalRow1Partial = (_30._m0[normalBone0Row1] * inBlendWeights.x) + (_30._m0[normalBone1Row0 + 1u] * inBlendWeights.y);
            normalRow0Partial = (_30._m0[normalBone0Row0] * inBlendWeights.x) + (_30._m0[normalBone1Row0] * inBlendWeights.y);
            positionRow2Partial = (_30._m0[positionBone0Row2] * inBlendWeights.x) + (_30._m0[positionBone1Row0 + 2u] * inBlendWeights.y);
            positionRow1Partial = (_30._m0[positionBone0Row1] * inBlendWeights.x) + (_30._m0[positionBone1Row0 + 1u] * inBlendWeights.y);
            positionRow0Partial = (_30._m0[positionBone0Row0] * inBlendWeights.x) + (_30._m0[positionBone1Row0] * inBlendWeights.y);
        }
        else
        {
            normalRow2Partial = _30._m0[normalBone0Row2];
            normalRow1Partial = _30._m0[normalBone0Row1];
            normalRow0Partial = _30._m0[normalBone0Row0];
            positionRow2Partial = _30._m0[positionBone0Row2];
            positionRow1Partial = _30._m0[positionBone0Row1];
            positionRow0Partial = _30._m0[positionBone0Row0];
        }
        vec4 normalRow2;
        vec4 normalRow1;
        vec4 normalRow0;
        vec4 positionRow2;
        vec4 positionRow1;
        vec4 positionRow0;
        if (activeBoneCount >= 4u)
        {
            uint positionBone2Row0 = positionMatrixRowBase.z;
            uint positionBone3Row0 = positionMatrixRowBase.w;
            uint normalBone2Row0 = normalMatrixRowBase.z;
            uint normalBone3Row0 = normalMatrixRowBase.w;
            normalRow2 = normalRow2Partial + ((_30._m0[normalBone2Row0 + 2u] * inBlendWeights.z) + (_30._m0[normalBone3Row0 + 2u] * inBlendWeights.w));
            normalRow1 = normalRow1Partial + ((_30._m0[normalBone2Row0 + 1u] * inBlendWeights.z) + (_30._m0[normalBone3Row0 + 1u] * inBlendWeights.w));
            normalRow0 = normalRow0Partial + ((_30._m0[normalBone2Row0] * inBlendWeights.z) + (_30._m0[normalBone3Row0] * inBlendWeights.w));
            positionRow2 = positionRow2Partial + ((_30._m0[positionBone2Row0 + 2u] * inBlendWeights.z) + (_30._m0[positionBone3Row0 + 2u] * inBlendWeights.w));
            positionRow1 = positionRow1Partial + ((_30._m0[positionBone2Row0 + 1u] * inBlendWeights.z) + (_30._m0[positionBone3Row0 + 1u] * inBlendWeights.w));
            positionRow0 = positionRow0Partial + ((_30._m0[positionBone2Row0] * inBlendWeights.z) + (_30._m0[positionBone3Row0] * inBlendWeights.w));
        }
        else
        {
            normalRow2 = normalRow2Partial;
            normalRow1 = normalRow1Partial;
            normalRow0 = normalRow0Partial;
            positionRow2 = positionRow2Partial;
            positionRow1 = positionRow1Partial;
            positionRow0 = positionRow0Partial;
        }
        // Two skinned positions are carried: the main vertex and a secondary position used for shadow/alternate projection.
        vec3 objectTangentXYZ = selectedObjectTangent.xyz;
        vec3 skinnedTangentXYZ = vec3(dot(positionRow0.xyz, objectTangentXYZ), dot(positionRow1.xyz, objectTangentXYZ), dot(positionRow2.xyz, objectTangentXYZ));
        skinnedTangent = vec4(skinnedTangentXYZ.x, skinnedTangentXYZ.y, skinnedTangentXYZ.z, selectedObjectTangent.w);
        skinnedNormal = vec3(dot(positionRow0.xyz, objectNormal), dot(positionRow1.xyz, objectNormal), dot(positionRow2.xyz, objectNormal));
        skinnedPosition0 = vec3(dot(positionRow0, objectPosition4), dot(positionRow1, objectPosition4), dot(positionRow2, objectPosition4));
        skinnedPosition1 = vec3(dot(normalRow0, objectPosition4), dot(normalRow1, objectPosition4), dot(normalRow2, objectPosition4));
        break;
    } while(false);
    mat3 objectToWorld3x3 = mat3(_25._m0[uint(gl_InstanceIndex)]._m0[0].xyz, _25._m0[uint(gl_InstanceIndex)]._m0[1].xyz, _25._m0[uint(gl_InstanceIndex)]._m0[2].xyz);
    vec3 cameraRelativeWorldPosition = (skinnedPosition0 * objectToWorld3x3) + (vec3(_25._m0[uint(gl_InstanceIndex)]._m0[0].w, _25._m0[uint(gl_InstanceIndex)]._m0[1].w, _25._m0[uint(gl_InstanceIndex)]._m0[2].w) - _22._m11.xyz);
    vec3 worldPosition = cameraRelativeWorldPosition + _22._m11.xyz;
    vec4 baseClipPosition = vec4(cameraRelativeWorldPosition, 1.0) * _22._m8;
    vec2 jitteredClipXY = baseClipPosition.xy - ((_22._m31.zw * vec2(2.0, -2.0)) * baseClipPosition.w);
    vec3 worldNormalUnnormalized = skinnedNormal * objectToWorld3x3;
    vec3 worldNormal = worldNormalUnnormalized * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(worldNormalUnnormalized, worldNormalUnnormalized)));
    vec3 worldTangentUnnormalized = skinnedTangent.xyz * objectToWorld3x3;
    vec4 secondaryClipPosition = vec4((mix(skinnedPosition1.xyz, skinnedPosition0, bvec3(_25._m0[uint(gl_InstanceIndex)]._m4.x < 1.0)) * mat3(_25._m0[uint(gl_InstanceIndex)]._m3[0].xyz, _25._m0[uint(gl_InstanceIndex)]._m3[1].xyz, _25._m0[uint(gl_InstanceIndex)]._m3[2].xyz)) + (vec3(_25._m0[uint(gl_InstanceIndex)]._m3[0].w, _25._m0[uint(gl_InstanceIndex)]._m3[1].w, _25._m0[uint(gl_InstanceIndex)]._m3[2].w) - _22._m21.xyz), 1.0) * _22._m15;
    mat3 viewProjection3x3 = mat3(_22._m8[0].xyz, _22._m8[1].xyz, _22._m8[2].xyz);
    vec3 normalClipDirection = worldNormal * viewProjection3x3;
    float gravityBlend = mix(_32._m31, spvNMax(0.800000011920928955078125, _32._m31), spvNMax(mix(_25._m0[uint(gl_InstanceIndex)]._m6.x, _22._m111.y, _22._m111.x), spvNMax(_25._m0[uint(gl_InstanceIndex)]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_25._m0[uint(gl_InstanceIndex)]._m6.z, _22._m111.w, _22._m111.x) - worldPosition.y) * mix(_25._m0[uint(gl_InstanceIndex)]._m6.y, 1.0, _22._m111.x))));
    // Fur shells slide in clip space along the normal, then bend downward with the gravity blend.
    vec3 furClipOffset = mix(normalClipDirection, ((vec3(0.0, -1.0, 0.0) * viewProjection3x3) * gravityBlend) + (normalClipDirection * (1.0 - gravityBlend)), vec3(inFurUv.x * (0.5 - (worldNormal.y * 0.5)))) * (((_32._m26 * inFurUv.x) * 0.00999999977648258209228515625) * textureLod(sampler2D(furMaskTexture, linearSampler), inUv0, 0.0).w);
    vec3 offsetClipXYZ = vec4(jitteredClipXY.x, jitteredClipXY.y, baseClipPosition.z, baseClipPosition.w).xyz + furClipOffset;
    vec4 finalClipPosition = vec4(offsetClipXYZ.x, offsetClipXYZ.y, offsetClipXYZ.z, baseClipPosition.w);
    vec2 furClipOffsetXY = furClipOffset.xy;
    vec2 furClipXY = baseClipPosition.xy + furClipOffsetXY;
    vec2 shadowClipXY = secondaryClipPosition.xy + furClipOffsetXY;
    outUv0 = (inUv0 * _32._m24.xy) + _32._m24.zw;
    outWorldPosition = worldPosition;
    outWorldNormal = worldNormal;
    outWorldTangent = vec4(worldTangentUnnormalized * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(worldTangentUnnormalized, worldTangentUnnormalized))), skinnedTangent.w);
    outFurUv = inFurUv;
    outFurClipPosition = vec3(furClipXY.x, furClipXY.y, baseClipPosition.w);
    outShadowClipPosition = vec3(shadowClipXY.x, shadowClipXY.y, secondaryClipPosition.w);
    finalClipPosition.y = -offsetClipXYZ.y;
    gl_Position = finalClipPosition;
    outInstanceIndex = uint(gl_InstanceIndex);
}
