// Readable rewrite of zhouxue_lit_ps_transparent.glsl.
// This is an annotated statement-by-statement cleanup of the decompiled GLSL.
// The original set/binding/location layout is preserved so captured resources still line up.
// Constant-buffer/block names and _mN members are kept original for later cross-reference;
// semantic local names, texture names, and comments explain the inferred role where possible.
// Texture role guesses from the request: _56 BaseColor/Alpha, _58 PBR Mask, _60 Normal,
// _62 Emission, _52 Light Ramp LUT, _53 F0 LUT, _54/_55 Rain Normal, _65 Reflection Cube,
// _40 high-quality character shadow, _39 local/dynamic-light shadow atlas; _38/_42 look like CSM/virtual shadow depths.

#version 460
#extension GL_EXT_spirv_intrinsics : require
#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif

struct _19
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



// Shared luminance weights. The decompiler inlined these constants many times.
const vec3 kLumaRec709 = vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625);
const vec3 kLumaRec709Approx = vec3(0.2125999927520751953125, 0.715200006961822509765625, 0.072200000286102294921875);

// 16-sample rotated Poisson disk for the dedicated character shadow depth.
// kPcfRotation16 rotates the kernel per 4x4 pixel group to hide fixed PCF patterns.
const vec2 kPoissonDisk16[16] = vec2[](vec2(-0.94201624393463134765625, -0.39906215667724609375), vec2(0.94558608531951904296875, -0.768907248973846435546875), vec2(-0.094184100627899169921875, -0.929388701915740966796875), vec2(0.34495937824249267578125, 0.29387760162353515625), vec2(-0.91588580608367919921875, 0.4577143192291259765625), vec2(-0.8154423236846923828125, -0.87912464141845703125), vec2(-0.38277542591094970703125, 0.2767684459686279296875), vec2(0.9748439788818359375, 0.7564837932586669921875), vec2(0.4432332515716552734375, -0.9751155376434326171875), vec2(0.5374298095703125, -0.473734200000762939453125), vec2(-0.2649691104888916015625, -0.418930232524871826171875), vec2(0.79197514057159423828125, 0.19090187549591064453125), vec2(-0.24188840389251708984375, 0.997065067291259765625), vec2(-0.8140995502471923828125, 0.91437590122222900390625), vec2(0.1998412609100341796875, 0.786413669586181640625), vec2(0.14383161067962646484375, -0.141007900238037109375));
const vec2 kPcfRotation16[16] = vec2[](vec2(-0.3996559083461761474609375, 0.91666519641876220703125), vec2(0.12451229989528656005859375, -0.992218077182769775390625), vec2(0.8523542881011962890625, 0.5229647159576416015625), vec2(-0.22931249439716339111328125, 0.973352909088134765625), vec2(-0.772406101226806640625, 0.63512897491455078125), vec2(0.7927525043487548828125, -0.60954368114471435546875), vec2(-0.578049719333648681640625, 0.816001594066619873046875), vec2(-0.831129610538482666015625, -0.55607879161834716796875), vec2(0.8077948093414306640625, 0.589463770389556884765625), vec2(0.47141540050506591796875, 0.88191127777099609375), vec2(-0.3139738142490386962890625, -0.949431717395782470703125), vec2(-0.94500672817230224609375, -0.3270510137081146240234375), vec2(-0.1850374042987823486328125, -0.982731521129608154296875), vec2(-0.9337558746337890625, 0.35791051387786865234375), vec2(-0.997614085674285888671875, 0.069036297500133514404296875), vec2(0.3061277866363525390625, 0.951990425586700439453125));
// Cubemap face unpacking tables used by cookie/cubemap projection.
const ivec2 kCubeFaceAxes[6] = ivec2[](ivec2(2, 1), ivec2(2, 1), ivec2(0, 2), ivec2(0, 2), ivec2(0, 1), ivec2(0, 1));
const vec2 kCubeFaceSigns[6] = vec2[](vec2(-1.0, 1.0), vec2(1.0), vec2(1.0, -1.0), vec2(1.0), vec2(1.0), vec2(-1.0, 1.0));
float _522;
vec3 _523;
float _525;
uint _526;

layout(set = 0, binding = 14, std140) uniform _16_17
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
} _17;

layout(set = 2, binding = 0, std140) uniform _18_20
{
    layout(row_major) _19 _m0[256];
} _20;

layout(set = 0, binding = 39, std430) readonly buffer _26_27
{
    uint _m0[];
} _27;

layout(set = 0, binding = 16, std430) readonly buffer _28_29
{
    vec4 _m0[];
} _29;

layout(set = 0, binding = 37, std140) uniform _30_31
{
    int _m0;
    int _m1;
    int _m2;
    int _m3;
    float _m4;
    float _m5;
    float _m6;
    float _m7;
    float _m8;
    float _m9;
    float _m10;
    float _m11;
} _31;

layout(set = 0, binding = 12, std140) uniform _32_33
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
    vec4 _m4;
    uvec4 _m5;
    vec4 _m6[2048];
} _33;

layout(set = 0, binding = 13, std140) uniform _36_37
{
    layout(row_major) mat4 _m0[5];
    vec4 _m1[4];
    vec4 _m2[4];
    vec4 _m3[4];
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
    vec4 _m8[28];
    layout(row_major) mat4 _m9[56];
    vec4 _m10[56];
    vec4 _m11[56];
    vec4 _m12;
    vec4 _m13[47];
    layout(row_major) mat4 _m14[15];
    vec4 _m15[15];
    vec4 _m16[15];
    vec4 _m17[15];
    vec4 _m18;
    vec4 _m19;
    vec4 _m20[21];
    layout(row_major) mat4 _m21;
    layout(row_major) mat4 _m22;
    vec4 _m23;
    vec4 _m24;
    vec4 _m25;
    vec4 _m26[128];
} _37;

layout(set = 1, binding = 0, std140) uniform _50_51
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
    vec4 _m30;
    vec4 _m31;
    vec4 _m32;
    vec4 _m33;
    vec4 _m34;
    vec4 _m35;
    float _m36;
    float _m37;
    float _m38;
    float _m39;
    float _m40;
    float _m41;
    float _m42;
    float _m43;
} _51;

layout(set = 0, binding = 38, std140) uniform _67_68
{
    vec4 _m0[32];
    layout(row_major) mat4 _m1[32];
} _68;

layout(set = 0, binding = 5) uniform sampler smpLinearClamp;
layout(set = 0, binding = 4) uniform sampler smpLinearRepeat;
layout(set = 0, binding = 6) uniform samplerShadow smpShadow;
layout(set = 0, binding = 8) uniform texture2D texCsmShadowDepth;              // Main/CSM shadow depth used by sceneShadowAndRawShadow.
layout(set = 0, binding = 19) uniform texture2D texLocalLightShadowDepth;       // Local/dynamic-light shadow atlas, sampled with 3x3 PCF inside the light loop.
layout(set = 0, binding = 30) uniform texture2D texCharacterShadowDepth;        // Dedicated high-quality character shadow depth, sampled with 16 textureGather taps.
layout(set = 0, binding = 7) uniform texture2D texCloudShadowOrRainOcclusion;
layout(set = 0, binding = 10) uniform texture2D texVirtualShadowDepth;
layout(set = 0, binding = 27) uniform texture3D texVolumeProbeMaskFine;
layout(set = 0, binding = 24) uniform texture3D texVolumeProbeCoeffFine;
layout(set = 0, binding = 26) uniform texture3D texVolumeProbeMaskMid;
layout(set = 0, binding = 23) uniform texture3D texVolumeProbeCoeffMid;
layout(set = 0, binding = 25) uniform texture3D texVolumeProbeMaskFar;
layout(set = 0, binding = 22) uniform texture3D texVolumeProbeCoeffFar;
layout(set = 1, binding = 8) uniform texture2D texLightRampLut;              // Light ramp / 1D LUT.
layout(set = 1, binding = 5) uniform texture2D texF0TintLut;                 // F0 tint/specular color LUT.
layout(set = 0, binding = 34) uniform texture2D texRainNormalA;              // Rain normal A, triplanar projected.
layout(set = 0, binding = 31) uniform texture2D texRainNormalB;              // Rain normal B / droplet disturbance.
layout(set = 1, binding = 10) uniform texture2D texBaseColorAlpha;          // BaseColor / Albedo + Alpha.
layout(set = 1, binding = 4) uniform sampler smpMaterialBase;
layout(set = 1, binding = 6) uniform texture2D texPbrMask;                    // PBR mask: x=metallic, y=F0/AO factor guess, z=AO, w=1-roughness.
layout(set = 1, binding = 1) uniform sampler smpPbrMask;
layout(set = 1, binding = 9) uniform texture2D texNormalMap;                  // Tangent-space normal. X is stored as x*w, Y is y, Z is reconstructed.
layout(set = 1, binding = 3) uniform sampler smpNormalMap;
layout(set = 1, binding = 7) uniform texture2D texEmissionMap;                // Emission map.
layout(set = 1, binding = 2) uniform sampler smpEmissionMap;
layout(set = 0, binding = 35) uniform textureCube texReflectionCube;         // Reflection cubemap / IBL specular.
layout(set = 0, binding = 21) uniform texture2D texLightCookieAtlas;
layout(set = 0, binding = 28) uniform texture3D texAerialPerspectiveLut;

layout(location = 0) in vec2 vUv;
layout(location = 1) in vec3 vWorldPos;
layout(location = 2) in vec3 vWorldNormal;
layout(location = 3) in vec4 vWorldTangentSign;
layout(location = 4) in vec3 vClipNow;
layout(location = 5) in vec3 vClipPrev;
layout(location = 6) in vec3 vRainBlendNormal;
layout(location = 7) in vec3 vRainProjectionPos;
layout(location = 8) flat in uint vObjectIndex;
layout(location = 0) out vec4 outColor;
layout(location = 1) out vec4 outAux;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    // 1. 视线向量。透视模式使用 cameraPos - worldPos；另一种模式使用相机前向。
    //    viewDir 指向相机；viewDistance 驱动雾、阴影和体积 LUT 项。
    float linearEyeDepth = 1.0 / gl_FragCoord.w;
    vec3 viewVectorRaw = mix(_17._m11.xyz - vWorldPos, vec3(_17._m0[2u].x, _17._m0[2u].y, _17._m0[2u].z), vec3(_17._m26.w));    //_17._m11.xyz = 1.04954E-07, 301.45001, 1.38053; _17._m0[2].x = 8.65910E-08; _17._m0[2].y = -0.0207; _17._m0[2].z = 0.99979; _17._m26.w = 0.00
    float viewVectorLenSq = dot(viewVectorRaw, viewVectorRaw);
    float invViewVectorLen = inversesqrt(spvNMax(viewVectorLenSq, 9.9999999392252902907785028219223e-09));
    vec3 viewDir = viewVectorRaw * invViewVectorLen;
    float viewDistance = viewVectorLenSq * invViewVectorLen;
    uint externalObjectOffset = floatBitsToUint(_20._m0[vObjectIndex]._m2.x);
    bool usesExternalObjectPayload = (floatBitsToUint(_20._m0[vObjectIndex]._m1.w) & 16u) != 0u;
    vec4 objectPayloadRow2;
    vec4 objectPayloadRow0;
    if (usesExternalObjectPayload)
    {
        objectPayloadRow2 = _29._m0[externalObjectOffset + 2u];
        objectPayloadRow0 = _29._m0[externalObjectOffset];
    }
    else
    {
        objectPayloadRow2 = _20._m0[vObjectIndex]._m0[2];
        objectPayloadRow0 = _20._m0[vObjectIndex]._m0[0];
    }
    // 2. 材质纹理。基础色、PBR 遮罩、法线和自发光共享 UV 与全局 mip 偏移。
    vec4 baseColorSample = texture(sampler2D(texBaseColorAlpha, smpMaterialBase), vUv, _17._m38);    //_17._m38 = -1.00
    vec3 baseColor = baseColorSample.xyz * _51._m20.xyz;    //_51._m20.xyz = 1.00, 1.00, 1.00
    vec4 pbrMaskSample = texture(sampler2D(texPbrMask, smpPbrMask), vUv, _17._m38);    //_17._m38 = -1.00
    float metallicMask = pbrMaskSample.x;
    float aoMask = pbrMaskSample.z;
    float perceptualRoughness = 1.0 - pbrMaskSample.w;
    float alpha = baseColorSample.w * _51._m20.w;    //_51._m20.w = 1.00
    vec3 diffuseTintedForSaturation = baseColor * _51._m18;    //_51._m18 = 0.50
    vec3 diffuseColorSaturated = mix(vec3(dot(diffuseTintedForSaturation, kLumaRec709)), diffuseTintedForSaturation, vec3(_51._m19));    //_51._m19 = 1.00
    // 3. 法线贴图解码。该打包方式将 X 存在 w*x 中，将 Y 存在 y 中，并在单位半球上重建 Z。
    vec4 normalMapSample = texture(sampler2D(texNormalMap, smpNormalMap), vUv, _17._m38);    //_17._m38 = -1.00
    normalMapSample.w = normalMapSample.w * normalMapSample.x;
    vec2 normalMapXY = (normalMapSample.wy * 2.0) - vec2(1.0);
    vec3 tangentSpaceNormal = vec3(normalMapXY.x, normalMapXY.y, _523.z);
    vec2 normalXYForReconstruct = normalMapXY.xy;
    tangentSpaceNormal.z = spvNMax(1.000000016862383526387164645044e-16, sqrt(1.0 - clamp(dot(normalXYForReconstruct, normalXYForReconstruct), 0.0, 1.0)));
    vec2 scaledNormalXY = tangentSpaceNormal.xy * _51._m3;    //_51._m3 = 1.00
    vec4 emissionSample = texture(sampler2D(texEmissionMap, smpEmissionMap), vUv, _17._m38);    //_17._m38 = -1.00
    vec3 rootToPixelVector = vWorldPos - vec3(objectPayloadRow0.w, _525, objectPayloadRow2.w);
    rootToPixelVector.y = 1e-16;
    vec3 rootToPixelDir = normalize(rootToPixelVector);
    // 4. TBN 变换。tangent.xyz、normal 和 tangent.w 的副切线符号将法线变换到世界空间。
    vec3 worldNormalUnnormalized = mat3(vWorldTangentSign.xyz * 1.0, (cross(vWorldNormal, vWorldTangentSign.xyz) * vWorldTangentSign.w) * 1.0, vWorldNormal * 1.0) * vec3(scaledNormalXY.x, scaledNormalXY.y, tangentSpaceNormal.z);
    float frontFaceNormalSign = gl_FrontFacing ? 1.0 : ((-1.0) + (2.0 * _51._m5));    //_51._m5 = 0.00
    vec3 shadingNormal = (worldNormalUnnormalized * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(worldNormalUnnormalized, worldNormalUnnormalized)))) * frontFaceNormalSign;
    vec3 geometryNormal = normalize(vWorldNormal) * frontFaceNormalSign;
    uvec2 pixelCoord = uvec2(gl_FragCoord.xy);
    vec3 worldCameraForward = vec3(0.0, 0.0, 1.0) * mat3(_17._m1[0].xyz, _17._m1[1].xyz, _17._m1[2].xyz);    //_17._m1[0].xyz = -1.00, -1.25638E-12, 8.65910E-08; _17._m1[1].xyz = -1.79375E-09, 0.99979, -0.0207; _17._m1[2].xyz = 8.65724E-08, 0.0207, 0.99979
    float sceneLightingScale = mix(_17._m44.x, 1.0, _17._m113.w) * _17._m42.x;    //_17._m44.x = 0.28772; _17._m113.w = 0.00; _17._m42.x = 1.00
    vec4 probeDominantDirAndWeight;
    vec3 probeRgbIrradiance;
    vec3 probeColorTint;
    float probeIntensity;
    // 5. 环境探针。体积探针系数或全局常量构建主方向、RGB 辐照度和染色。
    if (_17._m102.y < 0.5)    //_17._m102.y = 1.00
    {
        vec3 _718 = vWorldPos - (_17._m126.xyz + (worldCameraForward * (-_17._m128.w)));    //_17._m126.xyz = -710.11267, 235.17313, -1150.84998; _17._m128.w = 144.00
        float _732 = spvNMax(clamp((spvNMax(abs(_718.x), abs(_718.z)) - 464.0) * 0.03125, 0.0, 1.0), clamp((abs(_718.y) - 208.0) * 0.03125, 0.0, 1.0));
        vec4 _1034;
        vec4 _1035;
        vec4 _1036;
        float _1037;
        float _1038;
        if ((_17._m126.w != 0.0) && (_732 < 1.0))    //_17._m126.w = -1.00
        {
            vec3 _745 = vWorldPos - (_17._m126.xyz + (worldCameraForward * (-_17._m128.y)));    //_17._m126.xyz = -710.11267, 235.17313, -1150.84998; _17._m128.y = 13.00
            float _759 = spvNMax(clamp((spvNMax(abs(_745.x), abs(_745.z)) - 29.0) * 0.5, 0.0, 1.0), clamp((abs(_745.y) - 13.0) * 0.5, 0.0, 1.0));
            float _835;
            vec4 _836;
            vec4 _837;
            vec4 _838;
            if (_759 < 1.0)
            {
                vec3 _768 = ((vWorldPos * 2.0) + vec3(0.5)) * _17._m127.xyz;    //_17._m127.xyz = 0.00781, 0.01563, 0.00781
                vec3 _770 = _768 - floor(_768);
                vec4 _774 = textureLod(sampler3D(texVolumeProbeMaskFine, smpLinearRepeat), _770, 0.0);
                float _775 = 1.0 - _759;
                float _779 = _17._m127.y * 0.5;    //_17._m127.y = 0.01563
                float _784 = _770.x;
                float _785 = clamp(_770.y, _779, 1.0 - _779) * 0.3333333432674407958984375;
                float _786 = _770.z;
                vec4 _789 = textureLod(sampler3D(texVolumeProbeCoeffFine, smpLinearClamp), vec3(_784, _785, _786), 0.0);
                float _805 = _774.x;
                float _815 = _774.y;
                float _825 = _774.z;
                _835 = _732 + (_789.w * _775);
                _836 = vec4(((textureLod(sampler3D(texVolumeProbeCoeffFine, smpLinearClamp), vec3(_784, _785 + 0.666666686534881591796875, _786), 0.0).xyz * 4.0) - vec3(2.0)) * _825, _825) * _775;
                _837 = vec4(((textureLod(sampler3D(texVolumeProbeCoeffFine, smpLinearClamp), vec3(_784, _785 + 0.3333333432674407958984375, _786), 0.0).xyz * 4.0) - vec3(2.0)) * _815, _815) * _775;
                _838 = vec4(((_789.xyz * 4.0) - vec3(2.0)) * _805, _805) * _775;
            }
            else
            {
                _835 = _732;
                _836 = vec4(0.0);
                _837 = vec4(0.0);
                _838 = vec4(0.0);
            }
            vec3 _844 = vWorldPos - (_17._m126.xyz + (worldCameraForward * (-_17._m128.z)));    //_17._m126.xyz = -710.11267, 235.17313, -1150.84998; _17._m128.z = 52.00
            float _858 = spvNMax(clamp((spvNMax(abs(_844.x), abs(_844.z)) - 116.0) * 0.125, 0.0, 1.0), clamp((abs(_844.y) - 52.0) * 0.125, 0.0, 1.0));
            float _938;
            vec4 _939;
            vec4 _940;
            vec4 _941;
            if (_858 < 1.0)
            {
                vec3 _867 = ((vWorldPos * 0.5) + vec3(0.5)) * _17._m127.xyz;    //_17._m127.xyz = 0.00781, 0.01563, 0.00781
                vec3 _869 = _867 - floor(_867);
                vec4 _873 = textureLod(sampler3D(texVolumeProbeMaskMid, smpLinearRepeat), _869, 0.0);
                float _875 = _759 * (1.0 - _858);
                float _879 = _17._m127.y * 0.5;    //_17._m127.y = 0.01563
                float _884 = _869.x;
                float _885 = clamp(_869.y, _879, 1.0 - _879) * 0.3333333432674407958984375;
                float _886 = _869.z;
                vec4 _889 = textureLod(sampler3D(texVolumeProbeCoeffMid, smpLinearClamp), vec3(_884, _885, _886), 0.0);
                float _905 = _873.x;
                float _916 = _873.y;
                float _927 = _873.z;
                _938 = _835 + (_889.w * _875);
                _939 = _836 + (vec4(((textureLod(sampler3D(texVolumeProbeCoeffMid, smpLinearClamp), vec3(_884, _885 + 0.666666686534881591796875, _886), 0.0).xyz * 4.0) - vec3(2.0)) * _927, _927) * _875);
                _940 = _837 + (vec4(((textureLod(sampler3D(texVolumeProbeCoeffMid, smpLinearClamp), vec3(_884, _885 + 0.3333333432674407958984375, _886), 0.0).xyz * 4.0) - vec3(2.0)) * _916, _916) * _875);
                _941 = _838 + (vec4(((_889.xyz * 4.0) - vec3(2.0)) * _905, _905) * _875);
            }
            else
            {
                _938 = _835;
                _939 = _836;
                _940 = _837;
                _941 = _838;
            }
            vec4 _1024;
            vec4 _1025;
            vec4 _1026;
            float _1027;
            if (_858 > 0.0)
            {
                vec3 _950 = ((vWorldPos * 0.125) + vec3(0.5)) * _17._m127.xyz;    //_17._m127.xyz = 0.00781, 0.01563, 0.00781
                vec3 _953 = _17._m127.xyz * 0.5;    //_17._m127.xyz = 0.00781, 0.01563, 0.00781
                vec3 _955 = clamp(_950 - floor(_950), _953, vec3(1.0) - _953);
                vec4 _959 = textureLod(sampler3D(texVolumeProbeMaskFar, smpLinearRepeat), _955, 0.0);
                float _961 = _858 * (1.0 - _732);
                float _965 = _17._m127.y * 0.5;    //_17._m127.y = 0.01563
                float _970 = _955.x;
                float _971 = clamp(_955.y, _965, 1.0 - _965) * 0.3333333432674407958984375;
                float _972 = _955.z;
                vec4 _975 = textureLod(sampler3D(texVolumeProbeCoeffFar, smpLinearClamp), vec3(_970, _971, _972), 0.0);
                float _991 = _959.x;
                float _1002 = _959.y;
                float _1013 = _959.z;
                _1024 = _939 + (vec4(((textureLod(sampler3D(texVolumeProbeCoeffFar, smpLinearClamp), vec3(_970, _971 + 0.666666686534881591796875, _972), 0.0).xyz * 4.0) - vec3(2.0)) * _1013, _1013) * _961);
                _1025 = _940 + (vec4(((textureLod(sampler3D(texVolumeProbeCoeffFar, smpLinearClamp), vec3(_970, _971 + 0.3333333432674407958984375, _972), 0.0).xyz * 4.0) - vec3(2.0)) * _1002, _1002) * _961);
                _1026 = _941 + (vec4(((_975.xyz * 4.0) - vec3(2.0)) * _991, _991) * _961);
                _1027 = _938 + (_975.w * _961);
            }
            else
            {
                _1024 = _939;
                _1025 = _940;
                _1026 = _941;
                _1027 = _938;
            }
            float _1030 = clamp((_1027 * 2.0) - 1.0, 0.0, 1.0);
            _1034 = _1024;
            _1035 = _1025;
            _1036 = _1026;
            _1037 = _1030 - _732;
            _1038 = (_1030 + _732) * 0.5;
        }
        else
        {
            _1034 = vec4(0.0);
            _1035 = vec4(0.0);
            _1036 = vec4(0.0);
            _1037 = 0.0;
            _1038 = 1.0;
        }
        vec4 _1058 = _1036 + vec4(_17._m129.x * _1038, (_17._m129.y * _1038) + ((_17._m129.w * _1037) * 0.5), _17._m129.z * _1038, (_17._m129.w * _1038) + ((_17._m129.y * _1037) * 0.375));    //_17._m129.x = -0.00755; _17._m129.y = 0.47224; _17._m129.w = 1.09631; _17._m129.z = 0.01217
        vec4 _1078 = _1035 + vec4(_17._m130.x * _1038, (_17._m130.y * _1038) + ((_17._m130.w * _1037) * 0.5), _17._m130.z * _1038, (_17._m130.w * _1038) + ((_17._m130.y * _1037) * 0.375));    //_17._m130.x = -0.00755; _17._m130.y = 0.47224; _17._m130.w = 1.09631; _17._m130.z = 0.01217
        vec4 _1098 = _1034 + vec4(_17._m131.x * _1038, (_17._m131.y * _1038) + ((_17._m131.w * _1037) * 0.5), _17._m131.z * _1038, (_17._m131.w * _1038) + ((_17._m131.y * _1037) * 0.375));    //_17._m131.x = -0.00755; _17._m131.y = 0.47224; _17._m131.w = 1.09631; _17._m131.z = 0.01217
        vec4 _1102 = vec4(shadingNormal, 1.0);
        vec3 _1108 = spvNMax(vec3(dot(_1058, _1102), dot(_1078, _1102), dot(_1098, _1102)), vec3(0.0)) * sceneLightingScale;
        vec3 _1116 = ((_1058.xyz * 0.2125999927520751953125) + (_1078.xyz * 0.715200006961822509765625)) + (_1098.xyz * 0.072200000286102294921875);
        vec3 _1120 = _1116 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_1116, _1116)));
        float _1122 = abs(_1120.y);
        vec3 _1123 = _1120;
        _1123.y = _1122;
        vec4 _1124 = vec4(_1123.x, _1123.y, _1123.z, vec4(0.0).w);
        _1124.w = 1.0;
        vec4 _1128 = vec4(_1120.x, _1122, _1120.z, 1.0);
        vec3 _1133 = spvNMax(vec3(dot(_1058, _1128), dot(_1078, _1128), dot(_1098, _1128)), vec3(0.0));
        float _1141 = _1108.z;
        float _1142 = _1108.y;
        vec4 _1147 = mix(vec4(_1141, _1142, -1.0, 0.666666686534881591796875), vec4(_1142, _1141, 0.0, -0.3333333432674407958984375), vec4(step(_1141, _1142)));
        float _1148 = _1108.x;
        float _1149 = _1147.x;
        vec4 _1157 = mix(vec4(_1149, _1147.yw, _1148), vec4(_1148, _1147.yz, _1149), vec4(step(_1149, _1148)));
        float _1158 = _1157.x;
        float _1159 = _1157.w;
        float _1160 = _1157.y;
        float _1162 = _1158 - spvNMin(_1159, _1160);
        float _1172 = fract(abs(_1157.z + ((_1159 - _1160) / ((6.0 * _1162) + 9.9999997473787516355514526367188e-05))));
        float _1179 = spvNMin(_1162 / (_1158 + 9.9999997473787516355514526367188e-05), mix(0.699999988079071044921875, 0.3499999940395355224609375, smoothstep(0.449999988079071044921875, 0.3499999940395355224609375, abs(_1172 - 0.5))) * clamp(_1158, 0.0, 1.0));
        float _1181 = 2.0 / (2.0 - _1179);
        probeDominantDirAndWeight = _1124;
        probeRgbIrradiance = _1108;
        probeColorTint = mix(vec3(1.0), clamp(abs((fract(vec3(_1172, _1179, _1181).xxx + vec3(1.0, 0.666666686534881591796875, 0.3333333432674407958984375)) * 6.0) - vec3(3.0)) - vec3(1.0), vec3(0.0), vec3(1.0)), vec3(_1179)) * _1181;
        probeIntensity = spvNMax(spvNMax(spvNMax(_1133.x, _1133.y), _1133.z), 0.0) * sceneLightingScale;
    }
    else
    {
        probeDominantDirAndWeight = vec4(0.0);
        probeRgbIrradiance = vec3(1.0);
        probeColorTint = _17._m103.xyz;    //_17._m103.xyz = 0.87831, 0.93023, 1.12169
        probeIntensity = sceneLightingScale;
    }
    float objectWetness = mix(_20._m0[vObjectIndex]._m6.x, _17._m111.y, _17._m111.x);    //_17._m111.y = 1.00; _17._m111.x = 0.00
    float heightWetness = spvNMax(_20._m0[vObjectIndex]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_20._m0[vObjectIndex]._m6.z, _17._m111.w, _17._m111.x) - vWorldPos.y) * mix(_20._m0[vObjectIndex]._m6.y, 1.0, _17._m111.x));    //_17._m111.w = -100.00; _17._m111.x = 0.00
    vec3 normalForLighting;
    float wetMinimumRoughness;
    float wetCoverage;
    float finalPerceptualRoughness;
    vec3 diffuseColorForLighting;
    vec3 baseColorAfterWetness;
    SPIRV_CROSS_BRANCH
    // 6. 雨水/湿润度。物体湿润度加高度湿润度采样 _54/_55 三平面雨水法线，并重写法线、粗糙度和颜色。
    if ((objectWetness + heightWetness) > 0.00999999977648258209228515625)
    {
        float nonMetallicMask = 1.0 - metallicMask;
        float darkNonMetallicMask = smoothstep(0.3499999940395355224609375, 0.100000001490116119384765625, dot(baseColor * nonMetallicMask, kLumaRec709));
        bvec3 externalPayloadSwizzle = bvec3(usesExternalObjectPayload);
        vec3 rainProjectionCoord = mix(vRainProjectionPos, vRainProjectionPos.xzy * vec3(1.0, 1.0, -1.0), externalPayloadSwizzle) * _17._m111.z;    //_17._m111.z = 2.00
        vec3 rainBlendNormal = mix(vRainBlendNormal, vRainBlendNormal.xzy, externalPayloadSwizzle);
        vec3 triplanarWeightSeed = abs(rainBlendNormal) - vec3(0.20000000298023223876953125);
        vec3 triplanarWeightRaw = spvNMax((triplanarWeightSeed * triplanarWeightSeed) * triplanarWeightSeed, vec3(0.0));
        vec3 triplanarWeights = triplanarWeightRaw / vec3(dot(triplanarWeightRaw, vec3(1.0)));
        vec2 rainUvXY = rainProjectionCoord.xy;
        vec2 rainUvZY = rainProjectionCoord.zy;
        // 三平面采样基础雨水法线，w/z 通道继续参与湿润覆盖和水滴触发。
        vec4 rainNormalAPlaneXZ = texture(sampler2D(texRainNormalA, smpMaterialBase), rainProjectionCoord.xz, _17._m38);    //_17._m38 = -1.00
        vec4 rainNormalAPlaneXY = texture(sampler2D(texRainNormalA, smpMaterialBase), rainUvXY, _17._m38);    //_17._m38 = -1.00
        vec4 rainNormalAPlaneZY = texture(sampler2D(texRainNormalA, smpMaterialBase), rainUvZY, _17._m38);    //_17._m38 = -1.00
        vec4 rainNormalASample = (rainNormalAPlaneXZ * triplanarWeights.y) + (rainNormalAPlaneXY * triplanarWeights.z) + (rainNormalAPlaneZY * triplanarWeights.x);
        float rainNormalAHeight = rainNormalASample.w;
        float rainNormalAUpperThreshold = 1.10000002384185791015625 - rainNormalAHeight;
        float surfaceWetnessCoverage = spvNMax(smoothstep(0.800000011920928955078125 - rainNormalAHeight, rainNormalAUpperThreshold, clamp((objectWetness * nonMetallicMask) + (shadingNormal.y * 0.20000000298023223876953125), 0.0, 1.0)), smoothstep(0.449999988079071044921875 - rainNormalAHeight, rainNormalAUpperThreshold, clamp(heightWetness * nonMetallicMask, 0.0, 1.0)));
        float metallicWetHighlightMask = smoothstep(0.5, 0.75, metallicMask);
        float smoothDarkSurfaceMask = smoothstep(0.800000011920928955078125, 0.60000002384185791015625, perceptualRoughness) * darkNonMetallicMask;
        float rippleActivation = clamp(smoothDarkSurfaceMask + metallicWetHighlightMask, 0.0, 1.0) * spvNMax(objectWetness, heightWetness);
        float rippleTimeA = _17._m32.x * 3.0;    //_17._m32.x = 1.33236
        float rippleTimeB = _17._m32.x * 4.345600128173828125;    //_17._m32.x = 1.33236
        vec3 rippleCoordA = rainProjectionCoord * 20.0;
        vec3 rippleCoordB = rainProjectionCoord * 34.345600128173828125;
        vec3 rippleTriplanarWeightRaw = spvNMax(pow(triplanarWeightSeed, vec3(10.0)), vec3(0.0));
        vec3 rippleTriplanarWeights = rippleTriplanarWeightRaw / vec3(dot(rippleTriplanarWeightRaw, vec3(1.0)));

        vec2 rippleAPlaneXZCoord = rippleCoordA.xz;
        vec2 rippleAPlaneXZCell = floor(rippleAPlaneXZCoord);
        vec2 rippleAPlaneXZHashSeed = fract(rippleAPlaneXZCell * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleAPlaneXZHash = rippleAPlaneXZHashSeed + vec2(dot(rippleAPlaneXZHashSeed, rippleAPlaneXZHashSeed + vec2(34.345001220703125)));
        float rippleAPlaneXZHashX = rippleAPlaneXZHash.x;
        float rippleAPlaneXZHashY = rippleAPlaneXZHash.y;
        vec2 rippleAPlaneXZRandom = fract(vec2(rippleAPlaneXZHashX * rippleAPlaneXZHashY, rippleAPlaneXZHashX + rippleAPlaneXZHashY));
        vec2 rippleAPlaneXZNeighborHashSeed = fract((rippleAPlaneXZCell + vec2(114.51399993896484375)) * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleAPlaneXZNeighborHash = rippleAPlaneXZNeighborHashSeed + vec2(dot(rippleAPlaneXZNeighborHashSeed, rippleAPlaneXZNeighborHashSeed + vec2(34.345001220703125)));
        float rippleAPlaneXZNeighborHashX = rippleAPlaneXZNeighborHash.x;
        float rippleAPlaneXZNeighborHashY = rippleAPlaneXZNeighborHash.y;
        vec2 rippleAPlaneXZNeighborRandom = fract(vec2(rippleAPlaneXZNeighborHashX * rippleAPlaneXZNeighborHashY, rippleAPlaneXZNeighborHashX + rippleAPlaneXZNeighborHashY));
        float rippleAPlaneXZPhaseSeed = rippleAPlaneXZRandom.x;
        float rippleAPlaneXZRadius = 0.25 * mix(0.60000002384185791015625, 1.0, rippleAPlaneXZPhaseSeed);
        vec2 rippleAPlaneXZCellOffset = ((rippleAPlaneXZCoord - rippleAPlaneXZCell) + (((rippleAPlaneXZNeighborRandom * 2.0) - vec2(1.0)) * 0.25)) - vec2(0.5);
        float rippleAPlaneXZOffsetY = rippleAPlaneXZCellOffset.y;
        vec2 rippleAPlaneXZEllipseOffset = vec2(rippleAPlaneXZCellOffset.x * 1.25, rippleAPlaneXZOffsetY * ((rippleAPlaneXZOffsetY < 0.0) ? 1.25 : 0.75));
        float rippleAPlaneXZAnimatedPhase = fract(rippleTimeA + rippleAPlaneXZPhaseSeed);
        float rippleAPlaneXZMask = (smoothstep(0.20000000298023223876953125, 0.2199999988079071044921875, rippleAPlaneXZAnimatedPhase) * smoothstep(0.85000002384185791015625, 0.550000011920928955078125, rippleAPlaneXZAnimatedPhase)) * step(0.001000000047497451305389404296875, smoothstep(rippleAPlaneXZRadius, 0.0, length(rippleAPlaneXZEllipseOffset)));
        vec2 rippleAPlaneXZNormalOffset = (clamp(rippleAPlaneXZEllipseOffset / vec2(rippleAPlaneXZRadius), vec2(-1.0), vec2(1.0)) * step(0.001000000047497451305389404296875, rippleAPlaneXZMask)) * mix(0.25, 0.5, rippleAPlaneXZNeighborRandom.x);

        vec2 rippleAPlaneXYCoord = rippleCoordA.xy;
        vec2 rippleAPlaneXYCell = floor(rippleAPlaneXYCoord);
        vec2 rippleAPlaneXYHashSeed = fract(rippleAPlaneXYCell * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleAPlaneXYHash = rippleAPlaneXYHashSeed + vec2(dot(rippleAPlaneXYHashSeed, rippleAPlaneXYHashSeed + vec2(34.345001220703125)));
        float rippleAPlaneXYHashX = rippleAPlaneXYHash.x;
        float rippleAPlaneXYHashY = rippleAPlaneXYHash.y;
        vec2 rippleAPlaneXYRandom = fract(vec2(rippleAPlaneXYHashX * rippleAPlaneXYHashY, rippleAPlaneXYHashX + rippleAPlaneXYHashY));
        vec2 rippleAPlaneXYNeighborHashSeed = fract((rippleAPlaneXYCell + vec2(114.51399993896484375)) * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleAPlaneXYNeighborHash = rippleAPlaneXYNeighborHashSeed + vec2(dot(rippleAPlaneXYNeighborHashSeed, rippleAPlaneXYNeighborHashSeed + vec2(34.345001220703125)));
        float rippleAPlaneXYNeighborHashX = rippleAPlaneXYNeighborHash.x;
        float rippleAPlaneXYNeighborHashY = rippleAPlaneXYNeighborHash.y;
        vec2 rippleAPlaneXYNeighborRandom = fract(vec2(rippleAPlaneXYNeighborHashX * rippleAPlaneXYNeighborHashY, rippleAPlaneXYNeighborHashX + rippleAPlaneXYNeighborHashY));
        float rippleAPlaneXYPhaseSeed = rippleAPlaneXYRandom.x;
        float rippleAPlaneXYRadius = 0.25 * mix(0.60000002384185791015625, 1.0, rippleAPlaneXYPhaseSeed);
        vec2 rippleAPlaneXYCellOffset = ((rippleAPlaneXYCoord - rippleAPlaneXYCell) + (((rippleAPlaneXYNeighborRandom * 2.0) - vec2(1.0)) * 0.25)) - vec2(0.5);
        float rippleAPlaneXYOffsetY = rippleAPlaneXYCellOffset.y;
        vec2 rippleAPlaneXYEllipseOffset = vec2(rippleAPlaneXYCellOffset.x * 1.25, rippleAPlaneXYOffsetY * ((rippleAPlaneXYOffsetY < 0.0) ? 1.25 : 0.75));
        float rippleAPlaneXYAnimatedPhase = fract(rippleTimeA + rippleAPlaneXYPhaseSeed);
        float rippleAPlaneXYMask = (smoothstep(0.20000000298023223876953125, 0.2199999988079071044921875, rippleAPlaneXYAnimatedPhase) * smoothstep(0.85000002384185791015625, 0.550000011920928955078125, rippleAPlaneXYAnimatedPhase)) * step(0.001000000047497451305389404296875, smoothstep(rippleAPlaneXYRadius, 0.0, length(rippleAPlaneXYEllipseOffset)));
        vec2 rippleAPlaneXYNormalOffset = (clamp(rippleAPlaneXYEllipseOffset / vec2(rippleAPlaneXYRadius), vec2(-1.0), vec2(1.0)) * step(0.001000000047497451305389404296875, rippleAPlaneXYMask)) * mix(0.25, 0.5, rippleAPlaneXYNeighborRandom.x);

        vec2 rippleAPlaneZYCoord = rippleCoordA.zy;
        vec2 rippleAPlaneZYCell = floor(rippleAPlaneZYCoord);
        vec2 rippleAPlaneZYHashSeed = fract(rippleAPlaneZYCell * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleAPlaneZYHash = rippleAPlaneZYHashSeed + vec2(dot(rippleAPlaneZYHashSeed, rippleAPlaneZYHashSeed + vec2(34.345001220703125)));
        float rippleAPlaneZYHashX = rippleAPlaneZYHash.x;
        float rippleAPlaneZYHashY = rippleAPlaneZYHash.y;
        vec2 rippleAPlaneZYRandom = fract(vec2(rippleAPlaneZYHashX * rippleAPlaneZYHashY, rippleAPlaneZYHashX + rippleAPlaneZYHashY));
        vec2 rippleAPlaneZYNeighborHashSeed = fract((rippleAPlaneZYCell + vec2(114.51399993896484375)) * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleAPlaneZYNeighborHash = rippleAPlaneZYNeighborHashSeed + vec2(dot(rippleAPlaneZYNeighborHashSeed, rippleAPlaneZYNeighborHashSeed + vec2(34.345001220703125)));
        float rippleAPlaneZYNeighborHashX = rippleAPlaneZYNeighborHash.x;
        float rippleAPlaneZYNeighborHashY = rippleAPlaneZYNeighborHash.y;
        vec2 rippleAPlaneZYNeighborRandom = fract(vec2(rippleAPlaneZYNeighborHashX * rippleAPlaneZYNeighborHashY, rippleAPlaneZYNeighborHashX + rippleAPlaneZYNeighborHashY));
        float rippleAPlaneZYPhaseSeed = rippleAPlaneZYRandom.x;
        float rippleAPlaneZYRadius = 0.25 * mix(0.60000002384185791015625, 1.0, rippleAPlaneZYPhaseSeed);
        vec2 rippleAPlaneZYCellOffset = ((rippleAPlaneZYCoord - rippleAPlaneZYCell) + (((rippleAPlaneZYNeighborRandom * 2.0) - vec2(1.0)) * 0.25)) - vec2(0.5);
        float rippleAPlaneZYOffsetY = rippleAPlaneZYCellOffset.y;
        vec2 rippleAPlaneZYEllipseOffset = vec2(rippleAPlaneZYCellOffset.x * 1.25, rippleAPlaneZYOffsetY * ((rippleAPlaneZYOffsetY < 0.0) ? 1.25 : 0.75));
        float rippleAPlaneZYAnimatedPhase = fract(rippleTimeA + rippleAPlaneZYPhaseSeed);
        float rippleAPlaneZYMask = (smoothstep(0.20000000298023223876953125, 0.2199999988079071044921875, rippleAPlaneZYAnimatedPhase) * smoothstep(0.85000002384185791015625, 0.550000011920928955078125, rippleAPlaneZYAnimatedPhase)) * step(0.001000000047497451305389404296875, smoothstep(rippleAPlaneZYRadius, 0.0, length(rippleAPlaneZYEllipseOffset)));
        vec2 rippleAPlaneZYNormalOffset = (clamp(rippleAPlaneZYEllipseOffset / vec2(rippleAPlaneZYRadius), vec2(-1.0), vec2(1.0)) * step(0.001000000047497451305389404296875, rippleAPlaneZYMask)) * mix(0.25, 0.5, rippleAPlaneZYNeighborRandom.x);

        float rippleWeightXZ = rippleTriplanarWeights.y;
        float rippleWeightXY = rippleTriplanarWeights.z;
        float rippleWeightZY = rippleTriplanarWeights.x;
        vec4 rippleLayerA = ((vec4(rippleAPlaneXZNormalOffset, rippleAPlaneXZMask, rippleAPlaneXZRandom.y) * rippleWeightXZ) + (vec4(rippleAPlaneXYNormalOffset, rippleAPlaneXYMask, rippleAPlaneXYRandom.y) * rippleWeightXY)) + (vec4(rippleAPlaneZYNormalOffset, rippleAPlaneZYMask, rippleAPlaneZYRandom.y) * rippleWeightZY);

        vec2 rippleBPlaneXZCoord = rippleCoordB.xz;
        vec2 rippleBPlaneXZCell = floor(rippleBPlaneXZCoord);
        vec2 rippleBPlaneXZHashSeed = fract(rippleBPlaneXZCell * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleBPlaneXZHash = rippleBPlaneXZHashSeed + vec2(dot(rippleBPlaneXZHashSeed, rippleBPlaneXZHashSeed + vec2(34.345001220703125)));
        float rippleBPlaneXZHashX = rippleBPlaneXZHash.x;
        float rippleBPlaneXZHashY = rippleBPlaneXZHash.y;
        vec2 rippleBPlaneXZRandom = fract(vec2(rippleBPlaneXZHashX * rippleBPlaneXZHashY, rippleBPlaneXZHashX + rippleBPlaneXZHashY));
        vec2 rippleBPlaneXZNeighborHashSeed = fract((rippleBPlaneXZCell + vec2(114.51399993896484375)) * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleBPlaneXZNeighborHash = rippleBPlaneXZNeighborHashSeed + vec2(dot(rippleBPlaneXZNeighborHashSeed, rippleBPlaneXZNeighborHashSeed + vec2(34.345001220703125)));
        float rippleBPlaneXZNeighborHashX = rippleBPlaneXZNeighborHash.x;
        float rippleBPlaneXZNeighborHashY = rippleBPlaneXZNeighborHash.y;
        vec2 rippleBPlaneXZNeighborRandom = fract(vec2(rippleBPlaneXZNeighborHashX * rippleBPlaneXZNeighborHashY, rippleBPlaneXZNeighborHashX + rippleBPlaneXZNeighborHashY));
        float rippleBPlaneXZPhaseSeed = rippleBPlaneXZRandom.x;
        float rippleBPlaneXZRadius = 0.25 * mix(0.60000002384185791015625, 1.0, rippleBPlaneXZPhaseSeed);
        vec2 rippleBPlaneXZCellOffset = ((rippleBPlaneXZCoord - rippleBPlaneXZCell) + (((rippleBPlaneXZNeighborRandom * 2.0) - vec2(1.0)) * 0.25)) - vec2(0.5);
        float rippleBPlaneXZOffsetY = rippleBPlaneXZCellOffset.y;
        vec2 rippleBPlaneXZEllipseOffset = vec2(rippleBPlaneXZCellOffset.x * 1.25, rippleBPlaneXZOffsetY * ((rippleBPlaneXZOffsetY < 0.0) ? 1.25 : 0.75));
        float rippleBPlaneXZAnimatedPhase = fract(rippleTimeB + rippleBPlaneXZPhaseSeed);
        float rippleBPlaneXZMask = (smoothstep(0.20000000298023223876953125, 0.2199999988079071044921875, rippleBPlaneXZAnimatedPhase) * smoothstep(0.85000002384185791015625, 0.550000011920928955078125, rippleBPlaneXZAnimatedPhase)) * step(0.001000000047497451305389404296875, smoothstep(rippleBPlaneXZRadius, 0.0, length(rippleBPlaneXZEllipseOffset)));
        vec2 rippleBPlaneXZNormalOffset = (clamp(rippleBPlaneXZEllipseOffset / vec2(rippleBPlaneXZRadius), vec2(-1.0), vec2(1.0)) * step(0.001000000047497451305389404296875, rippleBPlaneXZMask)) * mix(0.25, 0.5, rippleBPlaneXZNeighborRandom.x);

        vec2 rippleBPlaneXYCoord = rippleCoordB.xy;
        vec2 rippleBPlaneXYCell = floor(rippleBPlaneXYCoord);
        vec2 rippleBPlaneXYHashSeed = fract(rippleBPlaneXYCell * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleBPlaneXYHash = rippleBPlaneXYHashSeed + vec2(dot(rippleBPlaneXYHashSeed, rippleBPlaneXYHashSeed + vec2(34.345001220703125)));
        float rippleBPlaneXYHashX = rippleBPlaneXYHash.x;
        float rippleBPlaneXYHashY = rippleBPlaneXYHash.y;
        vec2 rippleBPlaneXYRandom = fract(vec2(rippleBPlaneXYHashX * rippleBPlaneXYHashY, rippleBPlaneXYHashX + rippleBPlaneXYHashY));
        vec2 rippleBPlaneXYNeighborHashSeed = fract((rippleBPlaneXYCell + vec2(114.51399993896484375)) * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleBPlaneXYNeighborHash = rippleBPlaneXYNeighborHashSeed + vec2(dot(rippleBPlaneXYNeighborHashSeed, rippleBPlaneXYNeighborHashSeed + vec2(34.345001220703125)));
        float rippleBPlaneXYNeighborHashX = rippleBPlaneXYNeighborHash.x;
        float rippleBPlaneXYNeighborHashY = rippleBPlaneXYNeighborHash.y;
        vec2 rippleBPlaneXYNeighborRandom = fract(vec2(rippleBPlaneXYNeighborHashX * rippleBPlaneXYNeighborHashY, rippleBPlaneXYNeighborHashX + rippleBPlaneXYNeighborHashY));
        float rippleBPlaneXYPhaseSeed = rippleBPlaneXYRandom.x;
        float rippleBPlaneXYRadius = 0.25 * mix(0.60000002384185791015625, 1.0, rippleBPlaneXYPhaseSeed);
        vec2 rippleBPlaneXYCellOffset = ((rippleBPlaneXYCoord - rippleBPlaneXYCell) + (((rippleBPlaneXYNeighborRandom * 2.0) - vec2(1.0)) * 0.25)) - vec2(0.5);
        float rippleBPlaneXYOffsetY = rippleBPlaneXYCellOffset.y;
        vec2 rippleBPlaneXYEllipseOffset = vec2(rippleBPlaneXYCellOffset.x * 1.25, rippleBPlaneXYOffsetY * ((rippleBPlaneXYOffsetY < 0.0) ? 1.25 : 0.75));
        float rippleBPlaneXYAnimatedPhase = fract(rippleTimeB + rippleBPlaneXYPhaseSeed);
        float rippleBPlaneXYMask = (smoothstep(0.20000000298023223876953125, 0.2199999988079071044921875, rippleBPlaneXYAnimatedPhase) * smoothstep(0.85000002384185791015625, 0.550000011920928955078125, rippleBPlaneXYAnimatedPhase)) * step(0.001000000047497451305389404296875, smoothstep(rippleBPlaneXYRadius, 0.0, length(rippleBPlaneXYEllipseOffset)));
        vec2 rippleBPlaneXYNormalOffset = (clamp(rippleBPlaneXYEllipseOffset / vec2(rippleBPlaneXYRadius), vec2(-1.0), vec2(1.0)) * step(0.001000000047497451305389404296875, rippleBPlaneXYMask)) * mix(0.25, 0.5, rippleBPlaneXYNeighborRandom.x);

        vec2 rippleBPlaneZYCoord = rippleCoordB.zy;
        vec2 rippleBPlaneZYCell = floor(rippleBPlaneZYCoord);
        vec2 rippleBPlaneZYHashSeed = fract(rippleBPlaneZYCell * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleBPlaneZYHash = rippleBPlaneZYHashSeed + vec2(dot(rippleBPlaneZYHashSeed, rippleBPlaneZYHashSeed + vec2(34.345001220703125)));
        float rippleBPlaneZYHashX = rippleBPlaneZYHash.x;
        float rippleBPlaneZYHashY = rippleBPlaneZYHash.y;
        vec2 rippleBPlaneZYRandom = fract(vec2(rippleBPlaneZYHashX * rippleBPlaneZYHashY, rippleBPlaneZYHashX + rippleBPlaneZYHashY));
        vec2 rippleBPlaneZYNeighborHashSeed = fract((rippleBPlaneZYCell + vec2(114.51399993896484375)) * vec2(123.339996337890625, 456.209991455078125));
        vec2 rippleBPlaneZYNeighborHash = rippleBPlaneZYNeighborHashSeed + vec2(dot(rippleBPlaneZYNeighborHashSeed, rippleBPlaneZYNeighborHashSeed + vec2(34.345001220703125)));
        float rippleBPlaneZYNeighborHashX = rippleBPlaneZYNeighborHash.x;
        float rippleBPlaneZYNeighborHashY = rippleBPlaneZYNeighborHash.y;
        vec2 rippleBPlaneZYNeighborRandom = fract(vec2(rippleBPlaneZYNeighborHashX * rippleBPlaneZYNeighborHashY, rippleBPlaneZYNeighborHashX + rippleBPlaneZYNeighborHashY));
        float rippleBPlaneZYPhaseSeed = rippleBPlaneZYRandom.x;
        float rippleBPlaneZYRadius = 0.25 * mix(0.60000002384185791015625, 1.0, rippleBPlaneZYPhaseSeed);
        vec2 rippleBPlaneZYCellOffset = ((rippleBPlaneZYCoord - rippleBPlaneZYCell) + (((rippleBPlaneZYNeighborRandom * 2.0) - vec2(1.0)) * 0.25)) - vec2(0.5);
        float rippleBPlaneZYOffsetY = rippleBPlaneZYCellOffset.y;
        vec2 rippleBPlaneZYEllipseOffset = vec2(rippleBPlaneZYCellOffset.x * 1.25, rippleBPlaneZYOffsetY * ((rippleBPlaneZYOffsetY < 0.0) ? 1.25 : 0.75));
        float rippleBPlaneZYAnimatedPhase = fract(rippleTimeB + rippleBPlaneZYPhaseSeed);
        float rippleBPlaneZYMask = (smoothstep(0.20000000298023223876953125, 0.2199999988079071044921875, rippleBPlaneZYAnimatedPhase) * smoothstep(0.85000002384185791015625, 0.550000011920928955078125, rippleBPlaneZYAnimatedPhase)) * step(0.001000000047497451305389404296875, smoothstep(rippleBPlaneZYRadius, 0.0, length(rippleBPlaneZYEllipseOffset)));
        vec2 rippleBPlaneZYNormalOffset = (clamp(rippleBPlaneZYEllipseOffset / vec2(rippleBPlaneZYRadius), vec2(-1.0), vec2(1.0)) * step(0.001000000047497451305389404296875, rippleBPlaneZYMask)) * mix(0.25, 0.5, rippleBPlaneZYNeighborRandom.x);

        vec4 rippleLayerB = ((vec4(rippleBPlaneXZNormalOffset, rippleBPlaneXZMask, rippleBPlaneXZRandom.y) * rippleWeightXZ) + (vec4(rippleBPlaneXYNormalOffset, rippleBPlaneXYMask, rippleBPlaneXYRandom.y) * rippleWeightXY)) + (vec4(rippleBPlaneZYNormalOffset, rippleBPlaneZYMask, rippleBPlaneZYRandom.y) * rippleWeightZY);
        vec2 strongestRippleMaskAndSeed = spvNMax(rippleLayerA.zw, rippleLayerB.zw);
        float proceduralRippleMask = (strongestRippleMaskAndSeed.x * step(1.0 - rippleActivation, strongestRippleMaskAndSeed.y - 0.100000001490116119384765625)) * step(0.00999999977648258209228515625, objectWetness);
        vec2 rainNormalBScrollOffset = vec2(0.0, (_17._m32.x * _17._m111.z) * 0.75);    //_17._m32.x = 1.33236; _17._m111.z = 2.00
        vec3 horizontalRainNormal = vec3(rainBlendNormal.x, 0.0, rainBlendNormal.z);
        vec3 horizontalTriplanarSeed = abs(horizontalRainNormal * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(horizontalRainNormal, horizontalRainNormal)))) - vec3(0.20000000298023223876953125);
        vec3 horizontalTriplanarRaw = spvNMax((horizontalTriplanarSeed * horizontalTriplanarSeed) * horizontalTriplanarSeed, vec3(0.0));
        vec3 horizontalTriplanarWeights = horizontalTriplanarRaw / vec3(dot(horizontalTriplanarRaw, vec3(1.0)));
        float rainNormalBWeightXY = horizontalTriplanarWeights.z;
        float rainNormalBWeightZY = horizontalTriplanarWeights.x;
        vec4 rainNormalBSample = (texture(sampler2D(texRainNormalB, smpMaterialBase), rainUvXY, _17._m38) * rainNormalBWeightXY) + (texture(sampler2D(texRainNormalB, smpMaterialBase), rainUvZY, _17._m38) * rainNormalBWeightZY);    //_17._m38 = -1.00
        vec2 wetNormalXY = mix((rainNormalASample.xy * 2.0) - vec2(1.0), (rippleLayerA.xy + rippleLayerB.xy).xy, bvec2(proceduralRippleMask > 0.001000000047497451305389404296875)) + (((rainNormalBSample.xy * 2.0) - vec2(1.0)) * ((texture(sampler2D(texRainNormalB, smpMaterialBase), rainUvXY + rainNormalBScrollOffset, _17._m38).w * rainNormalBWeightXY) + (texture(sampler2D(texRainNormalB, smpMaterialBase), rainUvZY + rainNormalBScrollOffset, _17._m38).w * rainNormalBWeightZY)));    //_17._m38 = -1.00
        float rainNormalBHeight = rainNormalBSample.z;
        float wetNormalBlend = spvNMax(spvNMax(proceduralRippleMask, step(1.0099999904632568359375 - rippleActivation, rainNormalASample.z)), smoothstep(1.0 - rainNormalBHeight, 1.10000002384185791015625 - rainNormalBHeight, rippleActivation));
        vec3 upCrossNormal = cross(shadingNormal, vec3(0.0, 1.0, 0.0));
        vec3 wetTangentDir = mix(vec3(-1.0, 0.0, 0.0), -normalize(upCrossNormal), bvec3(dot(upCrossNormal, upCrossNormal) > 6.103515625e-05));
        float wetRoughnessFloor = spvNMin(perceptualRoughness, 0.0500000007450580596923828125);
        float roughnessWithWetFloor = mix(perceptualRoughness, wetRoughnessFloor, wetNormalBlend);
        float wetDiffuseScale = mix(1.0, 0.5, (surfaceWetnessCoverage * (1.0 - darkNonMetallicMask)) * (1.0 - smoothDarkSurfaceMask));
        normalForLighting = normalize(mix(shadingNormal, normalize(mix(mix(shadingNormal, wetTangentDir, vec3(wetNormalXY.x)), cross(shadingNormal, wetTangentDir), vec3(wetNormalXY.y))), vec3(wetNormalBlend)));
        wetMinimumRoughness = wetRoughnessFloor;
        wetCoverage = wetNormalBlend;
        finalPerceptualRoughness = spvNMax(roughnessWithWetFloor - ((0.20000000298023223876953125 * darkNonMetallicMask) * surfaceWetnessCoverage), spvNMin(0.20000000298023223876953125, roughnessWithWetFloor));
        diffuseColorForLighting = diffuseColorSaturated * wetDiffuseScale;
        baseColorAfterWetness = mix(baseColor, baseColor * vec3((smoothstep(0.699999988079071044921875, 0.300000011920928955078125, dot(baseColor, kLumaRec709)) * 0.5) + 1.0), vec3(wetNormalBlend * metallicWetHighlightMask)) * wetDiffuseScale;
    }
    else
    {
        normalForLighting = shadingNormal;
        wetMinimumRoughness = 0.00999999977648258209228515625;
        wetCoverage = 0.0;
        finalPerceptualRoughness = perceptualRoughness;
        diffuseColorForLighting = diffuseColorSaturated;
        baseColorAfterWetness = baseColor;
    }
    float dielectricDiffuseScale = 0.959999978542327880859375 - (metallicMask * 0.959999978542327880859375);
    vec3 diffuseAlbedo = baseColorAfterWetness * dielectricDiffuseScale;
    vec3 specularF0 = mix(vec3(0.039999999105930328369140625) * pbrMaskSample.y, baseColorAfterWetness, vec3(metallicMask));
    vec3 diffuseLightingAlbedo = diffuseColorForLighting * dielectricDiffuseScale;
    float roughness2Clamped = spvNMax(finalPerceptualRoughness * finalPerceptualRoughness, 0.0078125);
    float roughness4 = roughness2Clamped * roughness2Clamped;
    vec2 screenVelocity = (vClipNow.xy / vec2(spvNMax(vClipNow.z, 9.9999999392252902907785028219223e-09))) - (vClipPrev.xy / vec2(spvNMax(vClipPrev.z, 9.9999999392252902907785028219223e-09)));
    screenVelocity.y = -screenVelocity.y;
    vec2 encodedVelocity = ((sqrt(sqrt(abs(screenVelocity * 0.5))) * vec2(ivec2(sign(screenVelocity)))) * 0.5) + vec2(0.5);
    vec4 auxOutput = vec4(encodedVelocity.x, encodedVelocity.y, vec4(0.0).z, vec4(0.0).w);
    auxOutput.z = 1.0;
    auxOutput.w = (wetCoverage > 0.5) ? 0.699999988079071044921875 : 0.4000000059604644775390625;
    vec3 mainLightDirMixed = mix(-_33._m0.xyz, _17._m112.xyz, vec3(_17._m102.w));    //_17._m112.xyz = -0.26339, 0.58779, 0.76494; _17._m102.w = 1.00
    vec3 mainLightPlanarDir = normalize(vec3(mainLightDirMixed.x, 6.103515625e-05, mainLightDirMixed.z));
    vec3 mainLightColor = mix(_33._m3.xyz, _17._m106.xyz, vec3(_17._m113.y));    //_17._m106.xyz = 1.00, 1.00, 1.00; _17._m113.y = 1.00
    vec3 scaledMainLightColor = mainLightColor * mix(_33._m3.w, 1.0, _17._m113.w);    //_17._m113.w = 0.00
    // 7. 角色阴影。选择逐物体阴影图块，并用 16 次软采样评估 texCharacterShadowDepth。
    float characterShadow;
    do
    {
        float characterShadowSlot = log2(float(floatBitsToUint(_20._m0[vObjectIndex]._m2.z))) - 8.0;
        float resolvedCharacterShadow;
        if ((characterShadowSlot >= 0.0) && (characterShadowSlot < _37._m19.z))
        {
            int characterShadowIndex = int(characterShadowSlot);
            // 法线越背向阴影方向，偏移越大，用来降低角色阴影自遮挡。
            float normalBiasWeight = 1.0 - clamp(dot(geometryNormal, _37._m16[characterShadowIndex].xyz), 0.0, 0.89999997615814208984375);
            vec3 biasedWorldPos = (vWorldPos - (_37._m16[characterShadowIndex].xyz * (normalBiasWeight * _37._m15[characterShadowIndex].x))) + (geometryNormal * (normalBiasWeight * _37._m15[characterShadowIndex].y));
            vec4 characterShadowCoord = vec4(biasedWorldPos, 1.0) * _37._m14[characterShadowIndex];
            float receiverDepth = spvNMax(characterShadowCoord.z, 0.00999999977648258209228515625);
            vec4 clampedShadowCoord = characterShadowCoord;
            clampedShadowCoord.z = receiverDepth;
            bvec3 belowShadowBounds = lessThanEqual(clampedShadowCoord.xyz, vec3(0.0));
            bvec3 aboveShadowBounds = greaterThanEqual(clampedShadowCoord.xyz, vec3(1.0));
            if (any(bvec3(belowShadowBounds.x || aboveShadowBounds.x, belowShadowBounds.y || aboveShadowBounds.y, belowShadowBounds.z || aboveShadowBounds.z)) || ((floatBitsToUint(receiverDepth) & 2147483647u) > 2139095040u))
            {
                characterShadow = 1.0;
                break;
            }
            float pcfSampleRadius = 4.0 * _37._m18.x;
            vec2 characterShadowUv = (_37._m17[characterShadowIndex].xy + (clampedShadowCoord.xy * _37._m17[characterShadowIndex].zw)).xy;
            ivec2 pixelInFourByFourTile = ivec2(pixelCoord % uvec2(4u));
            int pcfRotationIndex = (pixelInFourByFourTile.x * 4) + pixelInFourByFourTile.y;
            mat2 pcfRotation = mat2(kPcfRotation16[pcfRotationIndex], vec2(-kPcfRotation16[pcfRotationIndex].y, kPcfRotation16[pcfRotationIndex].x));
            float visibleDepthDeltaSum;
            float visibleSampleCount;
            visibleDepthDeltaSum = 0.0;
            visibleSampleCount = 0.0;
            // 16 个 Poisson tap，每次 textureGather 取 2x2 深度，共 64 个比较样本。
            for (uint pcfTapIndex = 0u; pcfTapIndex < 16u; )
            {
                vec4 sampledDepthDelta = textureGather(sampler2D(texCharacterShadowDepth, smpLinearClamp), characterShadowUv + ((pcfRotation * kPoissonDisk16[pcfTapIndex]) * pcfSampleRadius)) - vec4(receiverDepth);
                vec4 visibleSamples = step(vec4(0.0), sampledDepthDelta);
                visibleDepthDeltaSum += dot(sampledDepthDelta, visibleSamples);
                visibleSampleCount += dot(visibleSamples, vec4(1.0));
                pcfTapIndex++;
                continue;
            }
            float signedVisibleRatio = (2.0 * clamp(visibleSampleCount * 0.015625, 0.0, 1.0)) - 1.0;
            float visibilitySign = float(int(sign(signedVisibleRatio)));
            float distanceFromVisibilityExtreme = 1.0 - (visibilitySign * signedVisibleRatio);
            float normalizedVisibleDepthSlack = clamp((visibleDepthDeltaSum * (1.0 / visibleSampleCount)) * (1.0 / receiverDepth), 0.0, 1.0);
            resolvedCharacterShadow = spvNMin(1.0, 0.5 - (0.5 * ((1.0 - mix((distanceFromVisibilityExtreme * distanceFromVisibilityExtreme) * distanceFromVisibilityExtreme, distanceFromVisibilityExtreme, normalizedVisibleDepthSlack)) * visibilitySign)));
        }
        else
        {
            resolvedCharacterShadow = 1.0;
        }
        characterShadow = resolvedCharacterShadow;
        break;
    } while(false);
    // 8. 场景阴影。混合 CSM/虚拟阴影，并可选择用云/雨遮挡对其进行调制。
    vec2 sceneShadowAndRawShadow;
    do
    {
        if (_37._m7.w >= 0.9900000095367431640625)
        {
            sceneShadowAndRawShadow = vec2(_37._m7.z, 1.0);
            break;
        }
        int _2052 = int(_37._m7.x);
        vec3 _2059 = vWorldPos - mix(_17._m11.xyz, _37._m1[0].xyz, bvec3(_2052 == 2));    //_17._m11.xyz = 1.04954E-07, 301.45001, 1.38053
        float _2067 = clamp((_37._m6.w - dot(_2059, _2059)) * _37._m6.z, 0.0, 1.0);
        float _2266;
        bool _2267;
        if (_2067 > 0.0)
        {
            float _2264;
            bool _2265;
            if (_2052 > 0)
            {
                vec3 _2074 = vWorldPos - _37._m1[0].xyz;
                vec3 _2078 = vWorldPos - _37._m1[1].xyz;
                vec3 _2082 = vWorldPos - _37._m1[2].xyz;
                vec3 _2086 = vWorldPos - _37._m1[3].xyz;
                vec4 _2102 = vec4(lessThan(vec4(dot(_2074, _2074), dot(_2078, _2078), dot(_2082, _2082), dot(_2086, _2086)), vec4(_37._m1[0].w, _37._m1[1].w, _37._m1[2].w, _37._m1[3].w)));
                vec3 _2106 = clamp(_2102.yzw - _2102.xyz, vec3(0.0), vec3(1.0));
                float _2114 = spvNMax(clamp(clamp(4.0 - dot(vec4(_2102.x, _2106.x, _2106.y, _2106.z), vec4(4.0, 3.0, 2.0, 1.0)), 0.0, 3.0), 0.0, 4.0), _37._m6.y);
                uint _2118 = uint(_2114);
                vec4 _2131 = vec4(vWorldPos - (_33._m0.xyz * spvNMax((1.0 - clamp(dot(geometryNormal, _33._m0.xyz), 0.0, 0.89999997615814208984375)) * _37._m2[_2118].x, 0.0)), 1.0) * _37._m0[_2118];
                float _2134 = _2131.z;
                vec4 _2135 = vec4(_2131.xy, _2134, _2114);
                vec3 _2136 = _2135.xyz;
                bvec3 _2137 = lessThanEqual(_2136, vec3(0.0));
                bvec3 _2138 = greaterThanEqual(_2136, vec3(1.0));
                bool _2144 = any(bvec3(_2137.x || _2138.x, _2137.y || _2138.y, _2137.z || _2138.z)) || ((floatBitsToUint(_2134) & 2147483647u) > 2139095040u);
                int _2145 = int(_2114);
                vec2 _2162 = vec4(_37._m3[_2145].xy + (_2135.xy * _37._m3[_2145].zw), _2134, _2114).xy * _37._m4.zw;
                vec2 _2164 = floor(_2162 + vec2(0.5));
                vec2 _2165 = _2162 - _2164;
                float _2166 = _2165.x;
                float _2167 = _2166 + 0.5;
                float _2169 = (_2167 * _2167) * 0.5;
                float _2172 = spvNMin(_2166, 0.0);
                float _2176 = spvNMax(_2166, 0.0);
                vec4 _2180 = vec4(_2169 - _2166, (1.0 - _2166) - (_2172 * _2172), (_2166 + 1.0) - (_2176 * _2176), _2169) * 0.44444000720977783203125;
                float _2181 = _2165.y;
                float _2182 = _2181 + 0.5;
                float _2184 = (_2182 * _2182) * 0.5;
                float _2187 = spvNMin(_2181, 0.0);
                float _2191 = spvNMax(_2181, 0.0);
                vec4 _2195 = vec4(_2184 - _2181, (1.0 - _2181) - (_2187 * _2187), (_2181 + 1.0) - (_2191 * _2191), _2184) * 0.44444000720977783203125;
                vec2 _2197 = _2180.yw;
                vec2 _2198 = _2180.xz + _2197;
                vec2 _2200 = _2195.yw;
                vec2 _2201 = _2195.xz + _2200;
                vec2 _2207 = ((_2197 / _2198) + vec2(-1.5, 0.5)) * _37._m4.xx;
                vec2 _2209 = ((_2200 / _2201) + vec2(-1.5, 0.5)) * _37._m4.yy;
                vec2 _2211 = _2164 * _37._m4.xy;
                float _2212 = _2207.x;
                float _2213 = _2209.x;
                float _2216 = _2207.y;
                float _2219 = _2209.y;
                float _2224 = _2198.x;
                float _2225 = _2201.x;
                float _2227 = _2198.y;
                float _2229 = _2201.y;
                _2264 = _2144 ? 1.0 : (((((_2224 * _2225) * textureLod(sampler2DShadow(texCsmShadowDepth, smpShadow), vec3(vec3(_2211 + vec2(_2212, _2213), _522).xy, _2134), 0.0)) + ((_2227 * _2225) * textureLod(sampler2DShadow(texCsmShadowDepth, smpShadow), vec3(vec3(_2211 + vec2(_2216, _2213), _522).xy, _2134), 0.0))) + ((_2224 * _2229) * textureLod(sampler2DShadow(texCsmShadowDepth, smpShadow), vec3(vec3(_2211 + vec2(_2212, _2219), _522).xy, _2134), 0.0))) + ((_2227 * _2229) * textureLod(sampler2DShadow(texCsmShadowDepth, smpShadow), vec3(vec3(_2211 + vec2(_2216, _2219), _522).xy, _2134), 0.0)));
                _2265 = _2144;
            }
            else
            {
                _2264 = 1.0;
                _2265 = false;
            }
            _2266 = _2264;
            _2267 = _2265;
        }
        else
        {
            _2266 = 1.0;
            _2267 = false;
        }
        float _2462;
        float _2463;
        if (_2067 < 1.0)
        {
            float _2273 = 1.0 - clamp(dot(geometryNormal, _33._m0.xyz), 0.0, 0.89999997615814208984375);
            vec4 _2290 = vec4((vWorldPos - (_33._m0.xyz * (_2273 * _37._m23.x))) + (geometryNormal * (_2273 * _37._m23.y)), 1.0);
            vec4 _2291 = _2290 * _37._m22;
            vec2 _2292 = _2291.xy;
            float _2460;
            if (all(greaterThan(_2292, vec2(0.0))) && all(lessThan(_2292, vec2(1.0))))
            {
                uint _2311 = clamp(uint((floor(_2291.y * _37._m24.z) + _2291.x) * _37._m24.y), 0u, 127u);
                uint _2315 = floatBitsToUint(_37._m26[_2311].x);
                vec2 _2316 = unpackHalf2x16(_2315);
                float _2317 = _2316.x;
                float _2459;
                if (_2317 >= 0.0)
                {
                    mat4 _2326 = _37._m21;
                    _2326[0].w = _37._m26[_2311].y;
                    _2326[1].w = _37._m26[_2311].z;
                    _2326[2].w = _37._m26[_2311].w;
                    vec4 _2333 = _2290 * _2326;
                    vec3 _2334 = _2333.xyz;
                    float _2458;
                    if (all(greaterThan(_2334, vec3(0.0))) && all(lessThan(_2334, vec3(1.0))))
                    {
                        float _2351 = _2333.z;
                        vec2 _2357 = vec4((_2333.xy * _37._m23.zw) + vec2(_2317, unpackHalf2x16(_2315 >> 16u).x), _2351, 1.0).xy * _37._m25.zw;
                        vec2 _2359 = floor(_2357 + vec2(0.5));
                        vec2 _2360 = _2357 - _2359;
                        float _2361 = _2360.x;
                        float _2362 = _2361 + 0.5;
                        float _2364 = (_2362 * _2362) * 0.5;
                        float _2367 = spvNMin(_2361, 0.0);
                        float _2371 = spvNMax(_2361, 0.0);
                        vec4 _2375 = vec4(_2364 - _2361, (1.0 - _2361) - (_2367 * _2367), (_2361 + 1.0) - (_2371 * _2371), _2364) * 0.44444000720977783203125;
                        float _2376 = _2360.y;
                        float _2377 = _2376 + 0.5;
                        float _2379 = (_2377 * _2377) * 0.5;
                        float _2382 = spvNMin(_2376, 0.0);
                        float _2386 = spvNMax(_2376, 0.0);
                        vec4 _2390 = vec4(_2379 - _2376, (1.0 - _2376) - (_2382 * _2382), (_2376 + 1.0) - (_2386 * _2386), _2379) * 0.44444000720977783203125;
                        vec2 _2392 = _2375.yw;
                        vec2 _2393 = _2375.xz + _2392;
                        vec2 _2395 = _2390.yw;
                        vec2 _2396 = _2390.xz + _2395;
                        vec2 _2402 = ((_2392 / _2393) + vec2(-1.5, 0.5)) * _37._m25.xx;
                        vec2 _2404 = ((_2395 / _2396) + vec2(-1.5, 0.5)) * _37._m25.yy;
                        vec2 _2406 = _2359 * _37._m25.xy;
                        float _2407 = _2402.x;
                        float _2408 = _2404.x;
                        float _2411 = _2402.y;
                        float _2414 = _2404.y;
                        float _2419 = _2393.x;
                        float _2420 = _2396.x;
                        float _2422 = _2393.y;
                        float _2424 = _2396.y;
                        _2458 = ((((_2419 * _2420) * textureLod(sampler2DShadow(texVirtualShadowDepth, smpShadow), vec3(vec3(_2406 + vec2(_2407, _2408), _522).xy, _2351), 0.0)) + ((_2422 * _2420) * textureLod(sampler2DShadow(texVirtualShadowDepth, smpShadow), vec3(vec3(_2406 + vec2(_2411, _2408), _522).xy, _2351), 0.0))) + ((_2419 * _2424) * textureLod(sampler2DShadow(texVirtualShadowDepth, smpShadow), vec3(vec3(_2406 + vec2(_2407, _2414), _522).xy, _2351), 0.0))) + ((_2422 * _2424) * textureLod(sampler2DShadow(texVirtualShadowDepth, smpShadow), vec3(vec3(_2406 + vec2(_2411, _2414), _522).xy, _2351), 0.0));
                    }
                    else
                    {
                        _2458 = 1.0;
                    }
                    _2459 = _2458;
                }
                else
                {
                    _2459 = 1.0;
                }
                _2460 = _2459;
            }
            else
            {
                _2460 = 1.0;
            }
            _2462 = _2267 ? _2460 : _2266;
            _2463 = _2460;
        }
        else
        {
            _2462 = _2266;
            _2463 = 1.0;
        }
        float _2464 = mix(_2463, _2462, _2067);
        float _2515;
        if (_2464 > 0.001000000047497451305389404296875)
        {
            vec3 _2471 = vWorldPos - _17._m87.xyz;    //_17._m87.xyz = 1.00, 0.00, 0.00
            vec2 _2481 = (_2471 + (_17._m90.xyz * _2471.y)).xz * _17._m88.z;    //_17._m90.xyz = 0.00, 0.00, 0.00; _17._m88.z = 0.00
            vec2 _2490 = _17._m89.xy * _17._m97.w;    //_17._m89.xy = 1.00, 1.00; _17._m97.w = 26.64717
            _2515 = _2464 * mix(1.0, mix(textureLod(sampler2D(texCloudShadowOrRainOcclusion, smpLinearRepeat), _2481 + _2490, 0.0), textureLod(sampler2D(texCloudShadowOrRainOcclusion, smpLinearRepeat), (_2481 * _17._m89.w) + _2490, 0.0), vec4(smoothstep(_17._m88.x, _17._m88.y, length(_2471.xz)))).x, _17._m89.z);    //_17._m89.w = 1.00; _17._m88.x = 0.00; _17._m88.y = 0.00; _17._m89.z = 1.00
        }
        else
        {
            _2515 = _2464;
        }
        sceneShadowAndRawShadow = vec2(mix(_2515, _37._m7.z, _37._m7.w), _2515);
        break;
    } while(false);
    float characterShadowMix = mix(1.0, characterShadow, _37._m6.x);
    float mainShadow = mix(mix(1.0, sceneShadowAndRawShadow.x, _37._m6.x), 1.0, _17._m102.z);    //_17._m102.z = 1.00
    float ndotlMain = dot(shadingNormal, mainLightDirMixed);
    vec3 diffuseAlbedoScaled = diffuseLightingAlbedo * _17._m101.z;    //_17._m101.z = 0.70
    vec3 diffuseAlbedoSoft = diffuseAlbedoScaled * 0.64999997615814208984375;
    float diffuseLuma = dot(diffuseAlbedo, kLumaRec709);
    float sunCameraOpposition = clamp(-dot(mainLightPlanarDir.xz, normalize(worldCameraForward.xz)), 0.0, 1.0);
    float globalLightBlendInverse = 1.0 - _17._m113.x;    //_17._m113.x = 1.00
    // 9. Ramp 光照。texLightRampLut 将主光 NdotL 和法线方向映射到风格化布料/金属过渡。
    vec4 mainRampSample = textureLod(sampler2D(texLightRampLut, smpLinearClamp), vec2((clamp(mix(ndotlMain, ((-ndotlMain) * ((ndotlMain * 0.5) - 1.0)) + 0.5, (sunCameraOpposition * smoothstep(0.25, 0.75, 1.0 - abs(worldCameraForward.y))) * globalLightBlendInverse) + (_17._m112.w * _17._m113.x), -1.0, 1.0) * 0.5) + 0.5, 0.5), 0.0);    //_17._m112.w = 0.00; _17._m113.x = 1.00
    float mainRampAlpha = mainRampSample.w;
    float mainRampR = mainRampSample.x;
    float mainRampG = mainRampSample.y;
    float mainRampB = mainRampSample.z;
    float mainRampChroma = spvNMax(spvNMax(mainRampR, mainRampG), mainRampB) - spvNMin(spvNMin(mainRampR, mainRampG), mainRampB);
    vec4 ambientRampSample = textureLod(sampler2D(texLightRampLut, smpLinearClamp), vec2((dot(shadingNormal, worldCameraForward) * 0.5) + 0.5, 0.5), 0.0);
    float ambientRampAlpha = ambientRampSample.w;
    float aoTimesCharacterShadow = aoMask * characterShadowMix;
    float combinedDirectOcclusion = spvNMin(spvNMin(characterShadowMix, aoMask), mainRampAlpha);
    float ambientOcclusionRamp = ambientRampAlpha * aoTimesCharacterShadow;
    vec3 probeRampColor = vec3((clamp(dot(shadingNormal, _17._m107.xyz) + _17._m108.x, 0.0, 1.0) * _17._m108.y) + _17._m108.z) * mix(probeColorTint, vec3(1.0), vec3(_17._m102.y * combinedDirectOcclusion));    //_17._m107.xyz = 0.00, 1.00, 4.37114E-08; _17._m108.x = 0.15; _17._m108.y = 1.50; _17._m108.z = 0.50; _17._m102.y = 1.00
    vec3 directOcclusionVec = vec3(combinedDirectOcclusion);
    vec3 mainShadowVec = vec3(mainShadow);
    vec3 directLightColor = mix((probeRampColor * mix(spvNMin(mix(0.64999997615814208984375, 1.0, probeIntensity), 1.5), clamp(probeIntensity, 1.25, 1.75), _17._m102.x)) * _17._m101.w, (mix(vec3(dot(scaledMainLightColor, kLumaRec709)), scaledMainLightColor, directOcclusionVec) + ((probeRampColor * clamp(probeIntensity, 0.0, 1.5)) * (vec3(1.0 - _17._m113.y) + (mainLightColor * _17._m113.y)))) * _17._m101.y, mainShadowVec);    //_17._m102.x = 0.00; _17._m101.w = 0.90; _17._m113.y = 1.00; _17._m101.y = 1.10
    vec3 rampedDiffuseBase = mix(mix(mix(vec3(dot(diffuseAlbedoSoft, kLumaRec709)), diffuseAlbedoSoft, vec3(1.2000000476837158203125)), diffuseAlbedoScaled, vec3(clamp((aoTimesCharacterShadow * ambientRampAlpha) + mainRampAlpha, 0.0, 1.0))), diffuseAlbedo, directOcclusionVec);
    vec3 rampedDiffuseColored = rampedDiffuseBase * (vec3(1.0 - mainRampChroma) + (mainRampSample.xyz * mainRampChroma));
    vec3 finalDiffuseTerm = mix(mix(diffuseAlbedoScaled, mix(vec3(diffuseLuma), diffuseAlbedo, vec3(1.2000000476837158203125)), vec3(ambientOcclusionRamp)), rampedDiffuseColored * clamp(dot(rampedDiffuseBase, kLumaRec709) * (1.0 / spvNMax(dot(rampedDiffuseColored, kLumaRec709), 0.001000000047497451305389404296875)), 0.0, 1.5), mainShadowVec);
    vec4 diffuseAndShadow = vec4(finalDiffuseTerm, mainShadow);
    float directVisibility = mix(ambientOcclusionRamp, combinedDirectOcclusion, mainShadow);
    float directIntensityScale = mix(_17._m101.z, 1.0, directVisibility);    //_17._m101.z = 0.70
    vec3 halfVectorBiasDir = vec3(worldCameraForward.x, mix(0.5, mainLightDirMixed.y, mainShadow), worldCameraForward.z);
    float ndotv = clamp(dot(normalForLighting, viewDir), 0.0, 1.0);
    float ndothBiased = dot(normalForLighting, normalize(((mainLightDirMixed * mainShadow) + ((halfVectorBiasDir * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(halfVectorBiasDir, halfVectorBiasDir)))) * 2.0)) + (viewDir * (2.0 + mainShadow))));
    float ggxDenom = (((ndothBiased * roughness4) - ndothBiased) * ndothBiased) + 1.0;
    float ggxDenom2 = ggxDenom * ggxDenom;
    float ggxDistribution = (roughness4 != ggxDenom2) ? (roughness4 / ggxDenom2) : 1.0;
    float smithViewTermA = 2.0 * ndotv;
    float smithViewTermB = (1.0 + ndotv) - ndotv;
    float ndotv2 = ndotv * ndotv;
    // 10. F0 LUT。GGX 分布和粗糙度选择布料/金属高光使用的 F0 染色。
    vec3 f0TintedByLut = specularF0 * textureLod(sampler2D(texF0TintLut, smpLinearClamp), vec2(mix(ggxDistribution / spvNMin(1.0 / (roughness4 + 9.9999997473787516355514526367188e-05), 65504.0), ndotv2, _51._m4), finalPerceptualRoughness * (1.0 - metallicMask)), 0.0).xyz;    //_51._m4 = 1.00
    vec3 finalSpecularF0 = mix(specularF0, f0TintedByLut, vec3(_51._m4));    //_51._m4 = 1.00
    float alphaLightingScale = (1.0 - _51._m6) + (alpha * _51._m6);    //_51._m6 = 1.00
    vec3 mainDirectLighting = ((directLightColor * finalDiffuseTerm) * alphaLightingScale) + (((f0TintedByLut * clamp((ggxDistribution * (0.5 / ((smithViewTermA + (roughness2Clamped * smithViewTermB)) + 9.9999997473787516355514526367188e-05))) - 6.103515625e-05, 0.0, 20.0)) * ((directLightColor * (((directVisibility * 0.5) + 0.5) * directIntensityScale)) * 1.0)) * _17._m114.w);    //_17._m114.w = 1.00
    float mainDirectLuma = dot(mainDirectLighting, kLumaRec709);
    float mainDirectLumaOverHalf = clamp(mainDirectLuma - 0.5, 0.0, 0.5);
    vec3 rimLightDir = normalize(cross(worldCameraForward, vec3(_17._m110.xy, 0.0)));    //_17._m110.xy = 8.74228E-08, -1.00
    float vdotn = dot(viewDir, shadingNormal);
    float viewEdgeFactor = 1.0 - abs(vdotn);
    float flatLightNdotL = dot(mainLightPlanarDir, shadingNormal);
    float shadowedAmount = 1.0 - mainShadow;
    float iblPerceptualRoughness = mix(finalPerceptualRoughness, wetMinimumRoughness, wetCoverage);
    float iblRoughness2 = iblPerceptualRoughness * iblPerceptualRoughness;
    float iblNdotV3 = ndotv2 * ndotv;
    vec2 iblFitInput0 = vec2(1.0, ndotv);
    vec2 iblFitInput1 = vec2(1.0, iblRoughness2);
    vec3 iblFitInput2 = vec3(1.0, iblRoughness2, (iblRoughness2 * iblRoughness2) * iblRoughness2);
    float iblScale = dot(mat2(vec2(0.0365463010966777801513671875, 9.0631999969482421875), vec2(3.3270699977874755859375, -9.0475597381591796875)) * iblFitInput0, iblFitInput1) / dot(mat3(vec3(1.0, 9.044010162353515625, 5.565889835357666015625), vec3(3.596849918365478515625, -16.3173999786376953125, 19.788600921630859375), vec3(-1.36772000789642333984375, 9.2294902801513671875, -20.212299346923828125)) * vec3(1.0, ndotv2, iblNdotV3), iblFitInput2);
    float iblBias = dot(mat2(vec2(0.99044001102447509765625, 1.29677999019622802734375), vec2(-1.28514003753662109375, -0.755906999111175537109375)) * iblFitInput0, iblFitInput1) / dot(mat3(vec3(1.0, 20.3225002288818359375, 121.5630035400390625), vec3(2.9233798980712890625, -27.0301990509033203125, 626.1300048828125), vec3(59.41880035400390625, 222.5919952392578125, 316.62701416015625)) * vec3(1.0, ndotv, iblNdotV3), iblFitInput2);
    vec3 iblSpecularScaleBias = (finalSpecularF0 * iblScale) + vec3(iblBias);
    float iblScaleBiasSum = iblScale + iblBias;
    vec3 viewDirFromSurface = -viewDir;
    vec3 directAndRimLighting = mix(vec3(mainDirectLuma), mainDirectLighting, vec3((mainDirectLumaOverHalf * mainDirectLumaOverHalf) + 1.0)) + (((((_17._m109.xyz * smoothstep(mix(0.800000011920928955078125, 0.20000000298023223876953125, _17._m110.w), mix(0.89999997615814208984375, 0.5, _17._m110.w), viewEdgeFactor)) * _17._m109.w) * spvNMin(spvNMin(clamp(dot(rootToPixelDir, rimLightDir) + 1.0, 0.0, 1.0), aoMask), characterShadowMix)) * (mix(vec3(0.25), diffuseAlbedo, vec3(_17._m110.z)) * clamp(dot(rimLightDir, shadingNormal), 0.0, 1.0))) + ((((((mix(probeRgbIrradiance * (1.0 / spvNMax(spvNMax(spvNMax(probeRgbIrradiance.x, probeRgbIrradiance.y), probeRgbIrradiance.z) * 0.5, 1.0)), scaledMainLightColor, mainShadowVec) * clamp(mix(dot(probeDominantDirAndWeight.xyz, shadingNormal) * probeDominantDirAndWeight.w, ((-flatLightNdotL) * ((flatLightNdotL * 0.5) - 1.0)) + 0.5, mainShadow), 0.0, 1.0)) * ((shadowedAmount + (sunCameraOpposition * mainShadow)) * globalLightBlendInverse)) * smoothstep(0.60000002384185791015625, 0.800000011920928955078125, viewEdgeFactor)) * spvNMin(aoMask, characterShadowMix)) * (shadowedAmount + (smoothstep(0.100000001490116119384765625, 0.039999999105930328369140625, diffuseLuma) * mainShadow))) * spvNMax(vec3(0.1500000059604644775390625), diffuseAlbedo)));    //_17._m109.xyz = 0.00, 0.00, 0.00; _17._m110.w = 0.40; _17._m109.w = 1.00; _17._m110.z = 0.00
    vec2 pixelCoordFloat = vec2(pixelCoord);
    vec2 lightTileCoord = floor(pixelCoordFloat * 0.03125);
    int lightTileBaseIndex = int((lightTileCoord.x + (lightTileCoord.y * _31._m5)) * 8.0);
    float depthSliceFloat = floor(linearEyeDepth - (_17._m25.y * _31._m11));    //_17._m25.y = 0.10
    float depthSliceClamped = clamp(depthSliceFloat, 0.0, _31._m7 - 1.0);
    int depthSliceBaseIndex = int(depthSliceClamped * 8.0);
    vec3 lightingAccumulator;
    // 11. 初始光照累加器：直接光、边缘光、自发光和 cubemap IBL 反射。
    lightingAccumulator = (directAndRimLighting + (((emissionSample.xyz * _51._m21.xyz) * _51._m7) * alphaLightingScale)) + (((textureLod(samplerCube(texReflectionCube, smpLinearClamp), reflect(viewDirFromSurface, normalForLighting), (1.2000000476837158203125 * log2(spvNMax(iblPerceptualRoughness, 0.001000000047497451305389404296875))) + 5.0).xyz * ((iblSpecularScaleBias + ((finalSpecularF0 * ((1.0 - iblScaleBiasSum) / iblScaleBiasSum)) * iblSpecularScaleBias)) * 1.0)) * ((clamp(probeIntensity, 0.5, 1.5) * _17._m101.w) * directIntensityScale)) * probeColorTint);    //_51._m21.xyz = 0.34793, 0.68676, 1.00; _51._m7 = 0.75; _17._m101.w = 0.90
    vec3 lightingAccumulatorAfterOneLight;
    // 12. Clustered/Forward+ 动态光循环。屏幕图块和深度切片遮罩选择光源，然后累加漫反射和高光。
    SPIRV_CROSS_LOOP
    for (int lightTileWord = 0; lightTileWord <= 7; lightingAccumulator = lightingAccumulatorAfterOneLight, lightTileWord++)
    {
        // 取当前屏幕 tile 与深度 slice 的交集 bitmask，每一位对应一个候选本地光。
        uint lightMaskWord = (depthSliceFloat <= depthSliceClamped) ? (_27._m0[uint(lightTileBaseIndex + lightTileWord)] & _27._m0[uint((_17._m43.y + depthSliceBaseIndex) + lightTileWord)]) : 0u;    //_17._m43.y = 28800
        uint lightTileWordU = uint(lightTileWord);
        lightingAccumulatorAfterOneLight = lightingAccumulator;
        uint remainingLightBitsAfterClear;
        vec3 accumulatedAfterCurrentLight;
        SPIRV_CROSS_LOOP
        for (uint remainingLightBits = lightMaskWord; remainingLightBits != 0u; lightingAccumulatorAfterOneLight = accumulatedAfterCurrentLight, remainingLightBits = remainingLightBitsAfterClear)
        {
            uint lightBitIndex = uint(findLSB(remainingLightBits));
            remainingLightBitsAfterClear = remainingLightBits ^ (1u << (lightBitIndex & 31u));
            int lightDataBaseIndex = int((32u * lightTileWordU) + lightBitIndex) * 8;
            int lightPositionRangeIndex = lightDataBaseIndex + 1;
            int lightDirectionShapeIndex = lightDataBaseIndex + 2;
            int lightModeShadowIndex = lightDataBaseIndex + 3;
            int lightParamIndex = lightDataBaseIndex + 4;
            int lightShapeMatrix0Index = lightDataBaseIndex + 5;
            int lightShapeMatrix1Index = lightDataBaseIndex + 6;
            int lightExtraIndex = lightDataBaseIndex + 7;
            float lightShapeMaskFade;
            // 可选的盒状/体积光范围裁剪：把像素变换到光源局部空间，越靠近边缘越淡出。
            if (uint(_33._m6[lightShapeMatrix0Index].w) == 1u)
            {
                uint packedShapeMatrix00_10 = floatBitsToUint(_33._m6[lightShapeMatrix0Index].x);
                uint packedShapeMatrix20_30 = floatBitsToUint(_33._m6[lightShapeMatrix0Index].y);
                uint packedShapeMatrix01_11 = floatBitsToUint(_33._m6[lightShapeMatrix0Index].z);
                uint packedShapeMatrix21_31 = floatBitsToUint(_33._m6[lightShapeMatrix1Index].x);
                uint packedShapeMatrix02_12 = floatBitsToUint(_33._m6[lightShapeMatrix1Index].y);
                uint packedShapeMatrix22_32 = floatBitsToUint(_33._m6[lightShapeMatrix1Index].z);
                vec3 absShapeLocalPos = abs((mat4(vec4(unpackHalf2x16(packedShapeMatrix00_10).x, unpackHalf2x16(packedShapeMatrix01_11).x, unpackHalf2x16(packedShapeMatrix02_12).x, 0.0), vec4(unpackHalf2x16(packedShapeMatrix00_10 >> 16u).x, unpackHalf2x16(packedShapeMatrix01_11 >> 16u).x, unpackHalf2x16(packedShapeMatrix02_12 >> 16u).x, 0.0), vec4(unpackHalf2x16(packedShapeMatrix20_30).x, unpackHalf2x16(packedShapeMatrix21_31).x, unpackHalf2x16(packedShapeMatrix22_32).x, 0.0), vec4(unpackHalf2x16(packedShapeMatrix20_30 >> 16u).x, unpackHalf2x16(packedShapeMatrix21_31 >> 16u).x, unpackHalf2x16(packedShapeMatrix22_32 >> 16u).x, 0.0)) * vec4(vWorldPos - _33._m6[lightPositionRangeIndex].xyz, 1.0)).xyz);
                float shapeSoftInnerExtent = _33._m6[lightExtraIndex].x * 0.5;
                float shapeEdgeFade = 1.0 - clamp((spvNMax(spvNMax(absShapeLocalPos.x, absShapeLocalPos.y), absShapeLocalPos.z) - (shapeSoftInnerExtent + 0.5)) / (0.5 - shapeSoftInnerExtent), 0.0, 1.0);
                lightShapeMaskFade = shapeEdgeFade * shapeEdgeFade;
            }
            else
            {
                lightShapeMaskFade = 1.0;
            }
            if (false || (lightShapeMaskFade < 0.001000000047497451305389404296875))
            {
                accumulatedAfterCurrentLight = lightingAccumulatorAfterOneLight;
                continue;
            }
            vec3 accumulatorAfterThisLight;
            if (_33._m6[lightDataBaseIndex].w < 1.5)
            {
                vec3 accumulatorAfterLocalLight;
                do
                {
                    uint lightMode = floatBitsToUint(_33._m6[lightModeShadowIndex].w);
                    if ((lightMode == 16u) || ((_33._m6[lightModeShadowIndex].z + _17._m113.z) < 0.5))    //_17._m113.z = 1.00
                    {
                        accumulatorAfterLocalLight = lightingAccumulatorAfterOneLight;
                        break;
                    }
                    bool usesSpotCone = (uint(_33._m6[lightDataBaseIndex].w) & 1u) == 0u;
                    bool usesLineAreaShape = (!usesSpotCone) && (_33._m6[lightDirectionShapeIndex].z > 0.0);
                    bool isColorBlendLight = lightMode == 4u;
                    float spotConeSelector = float(usesSpotCone);
                    // 光方向以八面体编码存放在 lightDirectionShapeIndex.xy，这里还原为世界方向。
                    float decodedDirOctX = (0.5 + (0.5 * _33._m6[lightDirectionShapeIndex].y)) - abs(_33._m6[lightDirectionShapeIndex].x);
                    float decodedDirOctY = _33._m6[lightDirectionShapeIndex].y - decodedDirOctX;
                    float decodedDirOctZAbs = abs(spvNMax((1.0 - abs(decodedDirOctX)) - abs(decodedDirOctY), 0.00048828125));
                    vec3 lightForwardDir = normalize(vec3(decodedDirOctX, decodedDirOctY, (_33._m6[lightDirectionShapeIndex].x >= 0.0) ? decodedDirOctZAbs : (-decodedDirOctZAbs)));
                    float distanceFalloffPower = mix(_33._m6[lightShapeMatrix1Index].w, spvNMax(2.0 * _33._m6[lightParamIndex].y, 0.100000001490116119384765625), float(isColorBlendLight));
                    vec3 surfaceToLightVector = _33._m6[lightPositionRangeIndex].xyz - vWorldPos;
                    vec3 backwardLightDir = -lightForwardDir;
                    vec3 attenuationVector = mix(surfaceToLightVector, backwardLightDir * dot(surfaceToLightVector, backwardLightDir), vec3(float(isColorBlendLight && (_33._m6[lightParamIndex].z > 0.5)) * spotConeSelector));
                    float attenuationDistanceSq = dot(attenuationVector, attenuationVector);
                    float invAttenuationDistance = inversesqrt(attenuationDistanceSq);
                    vec3 pointLightDir = attenuationVector * invAttenuationDistance;
                    vec3 effectiveLightDir;
                    float areaLightScale;
                    if (usesLineAreaShape)
                    {
                        // 线光源用两端点近似代表方向，并加入面积归一化，避免退化成普通点光。
                        vec3 lineHalfVector = (lightForwardDir * _33._m6[lightDirectionShapeIndex].z) * 0.5;
                        vec3 lineEndpointAVector = attenuationVector - lineHalfVector;
                        vec3 lineEndpointBVector = attenuationVector + lineHalfVector;
                        float lineEndpointADistance = length(lineEndpointAVector);
                        float lineEndpointBDistance = length(lineEndpointBVector);
                        vec3 lineRepresentativeDir = normalize(cross(cross(lightForwardDir, pointLightDir), lightForwardDir));
                        effectiveLightDir = lineRepresentativeDir;
                        areaLightScale = ((1.0 / ((((lineEndpointADistance * lineEndpointBDistance) + dot(lineEndpointAVector, lineEndpointBVector)) * 0.5) + 1.0)) * clamp(0.5 * ((dot(lineRepresentativeDir, lineEndpointAVector) / lineEndpointADistance) + (dot(lineRepresentativeDir, lineEndpointBVector) / lineEndpointBDistance)), 0.0, 1.0)) * (1.0 / clamp(1.0 + (0.5 * clamp(_33._m6[lightDirectionShapeIndex].z * invAttenuationDistance, 0.0, 1.0)), 0.0, 1.0));
                    }
                    else
                    {
                        effectiveLightDir = pointLightDir;
                        areaLightScale = 1.0;
                    }
                    float rangeAttenuation;
                    if (distanceFalloffPower < 0.0)
                    {
                        float normalizedDistanceSq = attenuationDistanceSq * (_33._m6[lightPositionRangeIndex].w * _33._m6[lightPositionRangeIndex].w);
                        float smoothRangeFade = clamp(1.0 - (normalizedDistanceSq * normalizedDistanceSq), 0.0, 1.0);
                        rangeAttenuation = mix(1.0 / (attenuationDistanceSq + 1.0), areaLightScale, float(usesLineAreaShape)) * (smoothRangeFade * smoothRangeFade);
                    }
                    else
                    {
                        vec3 normalizedRangeVector = attenuationVector * _33._m6[lightPositionRangeIndex].w;
                        rangeAttenuation = areaLightScale * pow(1.0 - clamp(dot(normalizedRangeVector, normalizedRangeVector), 0.0, 1.0), distanceFalloffPower);
                    }
                    float spotConeAttenuation = clamp((dot(effectiveLightDir, backwardLightDir) - _33._m6[lightDirectionShapeIndex].z) * _33._m6[lightDirectionShapeIndex].w, 0.0, 1.0);
                    float attenuationBeforeCookie = rangeAttenuation * mix(1.0, spotConeAttenuation * spotConeAttenuation, spotConeSelector);
                    int cookieAtlasIndex = int(_33._m6[lightExtraIndex].w);
                    float attenuationWithCookie;
                    if ((!usesLineAreaShape) && (cookieAtlasIndex >= 0))
                    {
                        // Spot cookie 走投影矩阵；Point cookie 按主轴选 cubemap face 后映射到 2D atlas。
                        uint cookieAtlasIndexU = uint(cookieAtlasIndex);
                        vec2 cookieAtlasUv;
                        SPIRV_CROSS_BRANCH
                        if (spotConeSelector != 0.0)
                        {
                            vec4 projectedCookiePos = vec4(vWorldPos, 1.0) * _68._m1[cookieAtlasIndexU];
                            cookieAtlasUv = _68._m0[cookieAtlasIndexU].xy + (clamp(projectedCookiePos.xy / vec2(projectedCookiePos.w), vec2(0.0), vec2(1.0)) * _68._m0[cookieAtlasIndexU].zw);
                        }
                        else
                        {
                            vec3 cubeCookieVector = (_68._m1[cookieAtlasIndexU] * vec4(-attenuationVector, 0.0)).xyz;
                            vec3 cubeCookieVectorAlias = cubeCookieVector;
                            vec3 cubeCookieVectorSign = cubeCookieVector;
                            vec3 absCubeCookieVector = abs(cubeCookieVector);
                            uint cubeMajorAxisXY = uint(int(absCubeCookieVector.y > absCubeCookieVector.x));
                            uint cubeMajorAxis = (absCubeCookieVector.z > absCubeCookieVector[cubeMajorAxisXY]) ? 2u : cubeMajorAxisXY;
                            uint cubeFaceIndex = (cubeMajorAxis * 2u) + uint(cubeCookieVectorSign[cubeMajorAxis] < 0.0);
                            float cubeFaceDepth = abs(cubeCookieVectorAlias[cubeFaceIndex / 2u]);
                            float cubeCookiePaddingScale = 0.5 - (0.000244140625 / _68._m0[cookieAtlasIndexU].w);
                            cookieAtlasUv = _68._m0[cookieAtlasIndexU].xy + (clamp(vec2((float(cubeFaceIndex) + ((((cubeCookieVectorAlias[uint(kCubeFaceAxes[cubeFaceIndex].x)] * kCubeFaceSigns[cubeFaceIndex].x) / cubeFaceDepth) * cubeCookiePaddingScale) + 0.5)) * 0.16666667163372039794921875, 0.5 - (((cubeCookieVectorAlias[uint(kCubeFaceAxes[cubeFaceIndex].y)] * kCubeFaceSigns[cubeFaceIndex].y) / cubeFaceDepth) * cubeCookiePaddingScale)), vec2(0.0), vec2(1.0)) * _68._m0[cookieAtlasIndexU].zw);
                        }
                        attenuationWithCookie = attenuationBeforeCookie * textureLod(sampler2D(texLightCookieAtlas, smpLinearClamp), cookieAtlasUv, 0.0).x;
                    }
                    else
                    {
                        attenuationWithCookie = attenuationBeforeCookie;
                    }
                    float finalLightAttenuation = attenuationWithCookie * lightShapeMaskFade;
                    vec3 accumulatorAfterContribution;
                    do
                    {
                        vec3 accumulatorCandidate;
                        SPIRV_CROSS_BRANCH
                        if (finalLightAttenuation > 9.9999997473787516355514526367188e-05)
                        {
                            SPIRV_CROSS_BRANCH
                            if (isColorBlendLight)
                            {
                                accumulatorAfterContribution = mix(lightingAccumulatorAfterOneLight, _33._m6[lightDataBaseIndex].xyz, vec3(finalLightAttenuation * (_33._m6[lightParamIndex].x * ((1.0 - _33._m6[lightParamIndex].w) + (smoothstep(-0.5, 0.5, dot(geometryNormal, effectiveLightDir)) * _33._m6[lightParamIndex].w)))));
                                break;
                            }
                            float rawNdotL = dot(shadingNormal, effectiveLightDir);
                            float clampedNdotL = clamp(rawNdotL, 0.0, 1.0);
                            float localShadowFactor;
                            if (lightMode != 0u)
                            {
                                int localShadowIndex;
                                if (usesSpotCone)
                                {
                                    localShadowIndex = int(_33._m6[lightModeShadowIndex].x);
                                }
                                else
                                {
                                    uint packedPointShadowFacesXY = floatBitsToUint(_33._m6[lightDirectionShapeIndex].w);
                                    uint packedPointShadowFacesZ = floatBitsToUint(_33._m6[lightModeShadowIndex].x);
                                    vec3 lightToPixelOffset = vWorldPos - _33._m6[lightPositionRangeIndex].xyz;
                                    vec3 absLightToPixelOffset = abs(lightToPixelOffset);
                                    float absLightOffsetX = absLightToPixelOffset.x;
                                    float absLightOffsetY = absLightToPixelOffset.y;
                                    float absLightOffsetZ = absLightToPixelOffset.z;
                                    int selectedPointShadowIndex;
                                    if ((absLightOffsetX > absLightOffsetY) && (absLightOffsetX > absLightOffsetZ))
                                    {
                                        selectedPointShadowIndex = int((lightToPixelOffset.x > 0.0) ? (packedPointShadowFacesXY >> 24u) : ((packedPointShadowFacesXY >> 16u) & 255u));
                                    }
                                    else
                                    {
                                        int selectedPointShadowIndexYZ;
                                        if (absLightOffsetY > absLightOffsetZ)
                                        {
                                            selectedPointShadowIndexYZ = int((lightToPixelOffset.y > 0.0) ? ((packedPointShadowFacesXY >> 8u) & 255u) : (packedPointShadowFacesXY & 255u));
                                        }
                                        else
                                        {
                                            selectedPointShadowIndexYZ = int((lightToPixelOffset.z > 0.0) ? ((packedPointShadowFacesZ >> 8u) & 255u) : (packedPointShadowFacesZ & 255u));
                                        }
                                        selectedPointShadowIndex = selectedPointShadowIndexYZ;
                                    }
                                    localShadowIndex = (selectedPointShadowIndex < 80) ? selectedPointShadowIndex : (-1);
                                }
                                bool hasLocalShadow = localShadowIndex >= 0;
                                float shadowVisibility;
                                if (hasLocalShadow)
                                {
                                    // 本地光阴影：先投到阴影图，再用 3x3 separable PCF 权重采样。
                                    vec3 shadowLightToPixel = vWorldPos - _33._m6[lightPositionRangeIndex].xyz;
                                    vec4 shadowClipPos = vec4((vWorldPos - ((shadowLightToPixel * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(shadowLightToPixel, shadowLightToPixel)))) * _37._m10[localShadowIndex].x)) + (geometryNormal * (_37._m10[localShadowIndex].y * 5.0)), 1.0) * _37._m9[localShadowIndex];
                                    vec3 shadowUvDepth = shadowClipPos.xyz / vec3(shadowClipPos.w);
                                    vec3 shadowBoundsCoord = shadowUvDepth.xyz;
                                    bvec3 belowShadowBounds = lessThanEqual(shadowBoundsCoord, vec3(0.0));
                                    bvec3 aboveShadowBounds = greaterThanEqual(shadowBoundsCoord, vec3(1.0));
                                    float shadowCompareDepth = shadowUvDepth.z;
                                    vec2 shadowTexelPos = ((shadowUvDepth.xy * (_37._m11[localShadowIndex].zw - _37._m11[localShadowIndex].xy)) + _37._m11[localShadowIndex].xy).xy * _37._m12.zw;
                                    vec2 shadowTexelCenter = floor(shadowTexelPos + vec2(0.5));
                                    vec2 shadowTexelFrac = shadowTexelPos - shadowTexelCenter;
                                    float shadowFracX = shadowTexelFrac.x;
                                    float shadowFracXPlusHalf = shadowFracX + 0.5;
                                    float shadowFracXPlusHalfSq = shadowFracXPlusHalf * shadowFracXPlusHalf;
                                    float shadowOneMinusFracX = 1.0 - shadowFracX;
                                    float shadowFracXMinZero = spvNMin(shadowFracX, 0.0);
                                    float shadowFracXPlusOne = shadowFracX + 1.0;
                                    float shadowFracXMaxZero = spvNMax(shadowFracX, 0.0);
                                    float shadowFracY = shadowTexelFrac.y;
                                    float shadowFracYPlusHalf = shadowFracY + 0.5;
                                    float shadowFracYPlusHalfSq = shadowFracYPlusHalf * shadowFracYPlusHalf;
                                    float shadowOneMinusFracY = 1.0 - shadowFracY;
                                    float shadowFracYMinZero = spvNMin(shadowFracY, 0.0);
                                    float shadowFracYPlusOne = shadowFracY + 1.0;
                                    float shadowFracYMaxZero = spvNMax(shadowFracY, 0.0);
                                    vec3 shadowFilterNumeratorX = vec3(0.1599999964237213134765625 * shadowOneMinusFracX, 0.1599999964237213134765625 * ((shadowFracXPlusOne - (shadowFracXMaxZero * shadowFracXMaxZero)) + 1.0), shadowFracXPlusHalfSq * 0.07999999821186065673828125);
                                    vec3 shadowFilterWeightX = vec3(0.1599999964237213134765625 * ((shadowFracXPlusHalfSq * 0.5) - shadowFracX), 0.1599999964237213134765625 * ((shadowOneMinusFracX - (shadowFracXMinZero * shadowFracXMinZero)) + 1.0), 0.1599999964237213134765625 * shadowFracXPlusOne) + shadowFilterNumeratorX;
                                    vec3 shadowFilterNumeratorY = vec3(0.1599999964237213134765625 * shadowOneMinusFracY, 0.1599999964237213134765625 * ((shadowFracYPlusOne - (shadowFracYMaxZero * shadowFracYMaxZero)) + 1.0), shadowFracYPlusHalfSq * 0.07999999821186065673828125);
                                    vec3 shadowFilterWeightY = vec3(0.1599999964237213134765625 * ((shadowFracYPlusHalfSq * 0.5) - shadowFracY), 0.1599999964237213134765625 * ((shadowOneMinusFracY - (shadowFracYMinZero * shadowFracYMinZero)) + 1.0), 0.1599999964237213134765625 * shadowFracYPlusOne) + shadowFilterNumeratorY;
                                    vec3 shadowSampleOffsetX = ((shadowFilterNumeratorX / shadowFilterWeightX) + vec3(-2.5, -0.5, 1.5)) * _37._m12.xxx;
                                    vec3 shadowSampleOffsetY = ((shadowFilterNumeratorY / shadowFilterWeightY) + vec3(-2.5, -0.5, 1.5)) * _37._m12.yyy;
                                    vec2 shadowBaseUv = shadowTexelCenter * _37._m12.xy;
                                    float shadowOffsetX0 = shadowSampleOffsetX.x;
                                    float shadowOffsetY0 = shadowSampleOffsetY.x;
                                    vec2 shadowSampleUv00 = shadowBaseUv + vec2(shadowOffsetX0, shadowOffsetY0);
                                    float shadowOffsetX1 = shadowSampleOffsetX.y;
                                    vec2 shadowSampleUv10 = shadowBaseUv + vec2(shadowOffsetX1, shadowOffsetY0);
                                    float shadowOffsetX2 = shadowSampleOffsetX.z;
                                    vec2 shadowSampleUv20 = shadowBaseUv + vec2(shadowOffsetX2, shadowOffsetY0);
                                    float shadowOffsetY1 = shadowSampleOffsetY.y;
                                    vec2 shadowSampleUv01 = shadowBaseUv + vec2(shadowOffsetX0, shadowOffsetY1);
                                    vec2 shadowSampleUv11 = shadowBaseUv + vec2(shadowOffsetX1, shadowOffsetY1);
                                    vec2 shadowSampleUv21 = shadowBaseUv + vec2(shadowOffsetX2, shadowOffsetY1);
                                    float shadowOffsetY2 = shadowSampleOffsetY.z;
                                    vec2 shadowSampleUv02 = shadowBaseUv + vec2(shadowOffsetX0, shadowOffsetY2);
                                    vec2 shadowSampleUv12 = shadowBaseUv + vec2(shadowOffsetX1, shadowOffsetY2);
                                    vec2 shadowSampleUv22 = shadowBaseUv + vec2(shadowOffsetX2, shadowOffsetY2);
                                    float shadowWeightX0 = shadowFilterWeightX.x;
                                    float shadowWeightY0 = shadowFilterWeightY.x;
                                    float shadowWeightX1 = shadowFilterWeightX.y;
                                    float shadowWeightX2 = shadowFilterWeightX.z;
                                    float shadowWeightY1 = shadowFilterWeightY.y;
                                    float shadowWeightY2 = shadowFilterWeightY.z;
                                    float shadowFilteredFirstEightTaps = ((((((((shadowWeightX0 * shadowWeightY0) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv00, _522).xy, shadowCompareDepth), 0.0)) + ((shadowWeightX1 * shadowWeightY0) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv10, _522).xy, shadowCompareDepth), 0.0))) + ((shadowWeightX2 * shadowWeightY0) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv20, _522).xy, shadowCompareDepth), 0.0))) + ((shadowWeightX0 * shadowWeightY1) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv01, _522).xy, shadowCompareDepth), 0.0))) + ((shadowWeightX1 * shadowWeightY1) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv11, _522).xy, shadowCompareDepth), 0.0))) + ((shadowWeightX2 * shadowWeightY1) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv21, _522).xy, shadowCompareDepth), 0.0))) + ((shadowWeightX0 * shadowWeightY2) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv02, _522).xy, shadowCompareDepth), 0.0))) + ((shadowWeightX1 * shadowWeightY2) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv12, _522).xy, shadowCompareDepth), 0.0));
                                    shadowVisibility = hasLocalShadow ? mix(1.0, (any(bvec3(belowShadowBounds.x || aboveShadowBounds.x, belowShadowBounds.y || aboveShadowBounds.y, belowShadowBounds.z || aboveShadowBounds.z)) || ((floatBitsToUint(shadowCompareDepth) & 2147483647u) > 2139095040u)) ? 1.0 : (shadowFilteredFirstEightTaps + ((shadowWeightX2 * shadowWeightY2) * textureLod(sampler2DShadow(texLocalLightShadowDepth, smpShadow), vec3(vec3(shadowSampleUv22, _522).xy, shadowCompareDepth), 0.0))), _37._m10[localShadowIndex].w) : 1.0;
                                }
                                else
                                {
                                    shadowVisibility = clamp(dot(rootToPixelDir, effectiveLightDir) + 1.0, 0.0, 1.0);
                                }
                                localShadowFactor = shadowVisibility;
                            }
                            else
                            {
                                localShadowFactor = 1.0;
                            }
                            float contributionIntensity;
                            vec3 contributionColor;
                            float diffuseBlendFactor;
                            vec3 litDiffuseTerm;
                            vec3 darkDiffuseTerm;
                            float specularScale;
                            float sharpSpecularBlend;
                            SPIRV_CROSS_BRANCH
                            // 不同 lightMode 会改写漫反射、边缘光、粗糙度/金属度遮罩等参与方式。
                            if (lightMode == 0u)
                            {
                                vec3 attenuatedLightColorPreview = _33._m6[lightDataBaseIndex].xyz * finalLightAttenuation;
                                vec3 defaultLocalDiffuseTerm = diffuseAndShadow.xyz;
                                contributionIntensity = finalLightAttenuation;
                                contributionColor = (_33._m6[lightDataBaseIndex].xyz * ((1.0 - _33._m6[lightParamIndex].y) + ((1.0 / spvNMax(1.0, spvNMax(spvNMax(attenuatedLightColorPreview.x, attenuatedLightColorPreview.y), attenuatedLightColorPreview.z) * mix(0.75, 0.5, shadowedAmount))) * _33._m6[lightParamIndex].y))) * mix(0.25 * _33._m6[lightParamIndex].x, 1.0, clamp(rawNdotL + 0.5, 0.0, 1.0));
                                diffuseBlendFactor = clampedNdotL;
                                litDiffuseTerm = defaultLocalDiffuseTerm;
                                darkDiffuseTerm = defaultLocalDiffuseTerm;
                                specularScale = 1.0;
                                sharpSpecularBlend = 0.0;
                            }
                            else
                            {
                                float selectedContributionIntensity;
                                float selectedDiffuseBlendFactor;
                                vec3 selectedLitDiffuseTerm;
                                vec3 selectedDarkDiffuseTerm;
                                float selectedSpecularScale;
                                float selectedSharpSpecularBlend;
                                if (lightMode == 3u)
                                {
                                    selectedContributionIntensity = finalLightAttenuation * (smoothstep(mix(0.8, 0.2, _33._m6[lightParamIndex].x), mix(0.9, 0.5, _33._m6[lightParamIndex].x), viewEdgeFactor) * localShadowFactor);
                                    selectedDiffuseBlendFactor = clamp(dot(shadingNormal, -normalize(cross(worldCameraForward, cross(worldCameraForward, effectiveLightDir)))), 0.0, 1.0);
                                    selectedLitDiffuseTerm = mix(vec3(0.5), diffuseAlbedo, vec3(_33._m6[lightParamIndex].y));
                                    selectedDarkDiffuseTerm = vec3(0.0);
                                    selectedSpecularScale = 1.0;
                                    selectedSharpSpecularBlend = 0.0;
                                }
                                else
                                {
                                    bool isWrapDiffuseMode = lightMode == 1u;
                                    float modeDiffuseBlendFactor;
                                    vec3 modeDarkDiffuseTerm;
                                    float modeSpecularScale;
                                    float modeSharpSpecularBlend;
                                    if (isWrapDiffuseMode)
                                    {
                                        modeDiffuseBlendFactor = clamp(clamp(rawNdotL + _33._m6[lightParamIndex].x, -1.0, 1.0), 0.0, 1.0) * localShadowFactor;
                                        modeDarkDiffuseTerm = diffuseLightingAlbedo * _33._m6[lightParamIndex].y;
                                        modeSpecularScale = 1.0;
                                        modeSharpSpecularBlend = 0.0;
                                    }
                                    else
                                    {
                                        bool isSpecularMaskMode = lightMode == 2u;
                                        float specularMaskFactor;
                                        if (isSpecularMaskMode)
                                        {
                                            specularMaskFactor = smoothstep(_33._m6[lightParamIndex].x + 0.0500000007450580596923828125, _33._m6[lightParamIndex].x - 0.0500000007450580596923828125, finalPerceptualRoughness) * ((1.0 - _33._m6[lightParamIndex].z) + (step(0.5, metallicMask) * _33._m6[lightParamIndex].z));
                                        }
                                        else
                                        {
                                            specularMaskFactor = 1.0;
                                        }
                                        modeDiffuseBlendFactor = clampedNdotL;
                                        modeDarkDiffuseTerm = vec3(0.0);
                                        modeSpecularScale = specularMaskFactor;
                                        modeSharpSpecularBlend = isSpecularMaskMode ? _33._m6[lightParamIndex].y : 0.0;
                                    }
                                    selectedContributionIntensity = finalLightAttenuation;
                                    selectedDiffuseBlendFactor = modeDiffuseBlendFactor;
                                    selectedLitDiffuseTerm = mix(vec3(0.0), diffuseAlbedo, bvec3(isWrapDiffuseMode));
                                    selectedDarkDiffuseTerm = modeDarkDiffuseTerm;
                                    selectedSpecularScale = modeSpecularScale;
                                    selectedSharpSpecularBlend = modeSharpSpecularBlend;
                                }
                                contributionIntensity = selectedContributionIntensity;
                                contributionColor = _33._m6[lightDataBaseIndex].xyz;
                                diffuseBlendFactor = selectedDiffuseBlendFactor;
                                litDiffuseTerm = selectedLitDiffuseTerm;
                                darkDiffuseTerm = selectedDarkDiffuseTerm;
                                specularScale = selectedSpecularScale;
                                sharpSpecularBlend = selectedSharpSpecularBlend;
                            }
                            vec3 localSpecularBrdf;
                            SPIRV_CROSS_BRANCH
                            if (lightMode != 3u)
                            {
                                float localRoughness2 = mix(roughness2Clamped, 0.01, sharpSpecularBlend);
                                float localHalfNdot = dot(normalForLighting, normalize(effectiveLightDir + viewDir));
                                float localRoughness4 = localRoughness2 * localRoughness2;
                                float localGgxDenom = (((localHalfNdot * localRoughness4) - localHalfNdot) * localHalfNdot) + 1.0;
                                float localGgxDenomSq = localGgxDenom * localGgxDenom;
                                localSpecularBrdf = ((f0TintedByLut * clamp((((localRoughness4 != localGgxDenomSq) ? (localRoughness4 / localGgxDenomSq) : 1.0) * (0.5 / ((smithViewTermA + (localRoughness2 * smithViewTermB)) + 9.9999997473787516355514526367188e-05))) - 6.103515625e-05, 0.0, 20.0)) * specularScale) * _33._m6[lightExtraIndex].z;
                            }
                            else
                            {
                                localSpecularBrdf = vec3(0.0);
                            }
                            vec3 attenuatedContributionColor = contributionColor * contributionIntensity;
                            // 漫反射按 diffuseBlendFactor 在暗部/亮部项之间插值，高光走局部 GGX BRDF。
                            accumulatorCandidate = lightingAccumulatorAfterOneLight + (((attenuatedContributionColor * mix(darkDiffuseTerm, litDiffuseTerm, vec3(diffuseBlendFactor))) * alphaLightingScale) + ((attenuatedContributionColor * localSpecularBrdf) * diffuseBlendFactor));
                        }
                        else
                        {
                            accumulatorCandidate = lightingAccumulatorAfterOneLight;
                        }
                        accumulatorAfterContribution = accumulatorCandidate;
                        break;
                    } while(false);
                    accumulatorAfterLocalLight = accumulatorAfterContribution;
                    break;
                } while(false);
                accumulatorAfterThisLight = accumulatorAfterLocalLight;
            }
            else
            {
                accumulatorAfterThisLight = lightingAccumulatorAfterOneLight;
            }
            accumulatedAfterCurrentLight = accumulatorAfterThisLight;
        }
    }
    vec3 colorBeforeExposureFog;
    SPIRV_CROSS_BRANCH
    // 13. 材质后处理/调试颜色路径。可将最终颜色推向灰度、固定染色和视角边缘颜色。
    if (_51._m12 > 0.5)    //_51._m12 = 0.00
    {
        colorBeforeExposureFog = mix(mix(vec3(0.5), mix(vec3(dot(lightingAccumulator, kLumaRec709)), lightingAccumulator, vec3(_51._m14)), vec3(_51._m15)) * _51._m13, _51._m22.xyz, vec3(_51._m22.w)) + ((_51._m23.xyz * smoothstep(1.0 - _51._m16, 1.0, 1.0 - clamp(vdotn, 0.0, 1.0))) * _51._m17);    //_51._m14 = 1.00; _51._m15 = 1.00; _51._m13 = 1.00; _51._m22.xyz = 1.00, 1.00, 1.00; _51._m22.w = 0.00; _51._m23.xyz = 1.00, 1.00, 1.00; _51._m16 = 0.35; _51._m17 = 4.00
    }
    else
    {
        colorBeforeExposureFog = lightingAccumulator;
    }
    vec4 litColorBeforeFog = vec4(colorBeforeExposureFog / vec3(_17._m42.x), alpha);    //_17._m42.x = 1.00
    litColorBeforeFog.w = (_51._m8 == 1.0) ? alpha : 1.0;    //_51._m8 = 1.00
    vec4 finalFoggedColor;
    SPIRV_CROSS_BRANCH
    // 14. 雾和大气透视。高度、距离和大气透视 LUT 混合进最终颜色。
    if (_17._m113.w < 0.5)    //_17._m113.w = 0.00
    {
        float _3769 = vWorldPos.y * _17._m68.w;    //_17._m68.w = -1.00
        float _3774 = spvNMax(0.00999999977648258209228515625, _3769 + _17._m69.w);    //_17._m69.w = 0.00
        vec3 _3788 = exp(_17._m67.xyz * ((-spvNMax(0.0, (viewDistance * _17._m66.w) - _17._m65.w)) * (((1.0 - exp(-_3774)) / _3774) * exp(_3769 + _17._m70.w))));    //_17._m67.xyz = 1.00000E-05, 1.00000E-05, 1.00000E-05; _17._m66.w = 0.001; _17._m65.w = 0.00; _17._m70.w = -65535.00
        float _3791 = dot(viewDirFromSurface, _17._m66.xyz);    //_17._m66.xyz = 0.00, 0.00, 1.00
        float _3797 = _17._m67.w * _17._m67.w;    //_17._m67.w = 0.00
        float _3801 = (1.0 + _3797) - ((2.0 * _17._m67.w) * _3791);    //_17._m67.w = 0.00
        vec3 _4128;
        float _4129;
        if (_17._m77.z > 0.0)    //_17._m77.z = 0.00
        {
            uvec3 _3850 = (uvec3(ivec3(int(pixelCoord.x), int(pixelCoord.y), int(_17._m41 & 7u))) * uvec3(1664525u)) + uvec3(1013904223u);    //_17._m41 = 655
            uint _3851 = _3850.y;
            uint _3852 = _3850.z;
            uint _3855 = _3850.x + (_3851 * _3852);
            uint _3857 = _3851 + (_3852 * _3855);
            uint _3859 = _3852 + (_3855 * _3857);
            uint _3861 = _3855 + (_3857 * _3859);
            float _3886 = dot(viewDirFromSurface, -_17._m0[2].xyz);    //_17._m0[2].xyz = 8.65910E-08, -0.0207, 0.99979
            vec3 _3893 = vWorldPos - _17._m11.xyz;    //_17._m11.xyz = 1.04954E-07, 301.45001, 1.38053
            float _3895 = (_17._m77.w * ((_3886 > 5.9604644775390625e-08) ? (1.0 / _3886) : 0.0)) * (1.0 / viewDistance);    //_17._m77.w = 0.00
            float _3896 = _3893.y;
            float _3897 = _3895 * _3896;
            float _3899 = _17._m11.y + _3897;    //_17._m11.y = 301.45001
            float _3900 = _3896 - _3897;
            float _3902 = (1.0 - _3895) * viewDistance;
            float _3916 = spvNMax(-127.0, _17._m71.z * _3900);    //_17._m71.z = 0.00
            float _3940 = spvNMax(-127.0, _17._m74.x * _3900);    //_17._m74.x = 0.00
            float _3951 = ((_17._m71.y * exp2(-spvNMax(-127.0, _17._m71.z * (_3899 - _17._m71.x)))) * ((abs(_3916) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_3916)) / _3916) : (0.693147182464599609375 - (0.2402265071868896484375 * _3916)))) + ((_17._m74.y * exp2(-spvNMax(-127.0, _17._m74.x * (_3899 - _17._m74.z)))) * ((abs(_3940) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_3940)) / _3940) : (0.693147182464599609375 - (0.2402265071868896484375 * _3940))));    //_17._m71.y = 0.00; _17._m71.z = 0.00; _17._m71.x = 0.00; _17._m74.y = 0.00; _17._m74.x = 0.00; _17._m74.z = 0.00
            float _3973 = clamp((viewDistance * _17._m72.w) + _17._m72.z, 0.0, 1.0);    //_17._m72.w = 0.00; _17._m72.z = 0.00
            float _3976 = clamp((spvNMax(clamp(exp2(-(_3951 * _3902)), 0.0, 1.0), _17._m73.w) + clamp((viewDistance * _17._m72.y) + _17._m72.x, 0.0, 1.0)) + _3973, 0.0, 1.0);    //_17._m73.w = 1.00; _17._m72.y = 0.00; _17._m72.x = 0.00
            vec4 _4016 = mix(vec4(0.0, 0.0, 0.0, 1.0), textureLod(sampler3D(texAerialPerspectiveLut, smpLinearClamp), vec3((pixelCoordFloat + ((((vec3(uvec3(_3861, _3857 + (_3859 * _3861), _526) >> uvec3(16u)) * vec3(1.525902189314365386962890625e-05)) * 2.0) - vec3(1.0)) * _17._m81.w).xy) * _17._m79.xy, (log2((linearEyeDepth * _17._m78.x) + _17._m78.y) * _17._m78.z) / _17._m77.z), 0.0), vec4(clamp((linearEyeDepth - _17._m80.z) * 1000000.0, 0.0, 1.0)));    //_17._m81.w = 0.00; _17._m79.xy = 0.00, 0.00; _17._m78.x = 0.00; _17._m78.y = 0.00; _17._m78.z = 0.00; _17._m77.z = 0.00; _17._m80.z = 0.00
            _4128 = _4016.xyz + (((_17._m73.xyz * (1.0 - _3976)) + (((_17._m76.xyz * pow(clamp(dot(viewDir, _17._m75.xyz), 0.0, 1.0), _17._m76.w)) * (1.0 - clamp(exp2(-(_3951 * spvNMax(_3902 - _17._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _3973))) * _4016.w);    //_17._m73.xyz = 0.00, 0.00, 0.00; _17._m76.xyz = 0.00, 0.00, 0.00; _17._m75.xyz = 0.00, 1.00, 0.00; _17._m76.w = 1.00; _17._m75.w = 0.00
            _4129 = _4016.w * _3976;
        }
        else
        {
            vec3 _4022 = vWorldPos - _17._m11.xyz;    //_17._m11.xyz = 1.04954E-07, 301.45001, 1.38053
            float _4024 = _4022.y;
            float _4038 = spvNMax(-127.0, _17._m71.z * _4024);    //_17._m71.z = 0.00
            float _4062 = spvNMax(-127.0, _17._m74.x * _4024);    //_17._m74.x = 0.00
            float _4073 = ((_17._m71.y * exp2(-spvNMax(-127.0, _17._m71.z * (_17._m11.y - _17._m71.x)))) * ((abs(_4038) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_4038)) / _4038) : (0.693147182464599609375 - (0.2402265071868896484375 * _4038)))) + ((_17._m74.y * exp2(-spvNMax(-127.0, _17._m74.x * (_17._m11.y - _17._m74.z)))) * ((abs(_4062) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_4062)) / _4062) : (0.693147182464599609375 - (0.2402265071868896484375 * _4062))));    //_17._m71.y = 0.00; _17._m71.z = 0.00; _17._m11.y = 301.45001; _17._m71.x = 0.00; _17._m74.y = 0.00; _17._m74.x = 0.00; _17._m74.z = 0.00
            float _4095 = clamp((viewDistance * _17._m72.w) + _17._m72.z, 0.0, 1.0);    //_17._m72.w = 0.00; _17._m72.z = 0.00
            float _4098 = clamp((spvNMax(clamp(exp2(-(_4073 * viewDistance)), 0.0, 1.0), _17._m73.w) + clamp((viewDistance * _17._m72.y) + _17._m72.x, 0.0, 1.0)) + _4095, 0.0, 1.0);    //_17._m73.w = 1.00; _17._m72.y = 0.00; _17._m72.x = 0.00
            _4128 = (_17._m73.xyz * (1.0 - _4098)) + (((_17._m76.xyz * pow(clamp(dot(viewDir, _17._m75.xyz), 0.0, 1.0), _17._m76.w)) * (1.0 - clamp(exp2(-(_4073 * spvNMax(viewDistance - _17._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _4095));    //_17._m73.xyz = 0.00, 0.00, 0.00; _17._m76.xyz = 0.00, 0.00, 0.00; _17._m75.xyz = 0.00, 1.00, 0.00; _17._m76.w = 1.00; _17._m75.w = 0.00
            _4129 = _4098;
        }
        vec3 _4134 = (litColorBeforeFog.xyz * (_3788 * _4129)) + ((((clamp(((_17._m68.xyz * (0.0596831031143665313720703125 * (1.0 + (_3791 * _3791)))) + _17._m70.xyz) + (_17._m69.xyz * ((1.0 - _3797) / spvNMax((12.56637096405029296875 * _3801) * sqrt(_3801), 0.001000000047497451305389404296875))), vec3(0.0), vec3(1.0)) * 255.0) * (vec3(1.0) - _3788)) * _4129) + _4128);    //_17._m68.xyz = 0.00, 0.00, 0.00; _17._m70.xyz = 0.00, 0.00, 0.00; _17._m69.xyz = 0.00, 0.00, 0.00
        finalFoggedColor = vec4(_4134.x, _4134.y, _4134.z, litColorBeforeFog.w);
    }
    else
    {
        finalFoggedColor = litColorBeforeFog;
    }
    // MRT0 写入颜色。MRT1 写入编码后的屏幕速度；w 也标记湿润覆盖强度。
    outColor = finalFoggedColor;
    outAux = auxOutput;
}


