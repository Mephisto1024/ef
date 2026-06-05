// zhouxue_hair_ps.glsl 的可读重写版本。
// 保留反编译 shader 的 binding/layout 和执行顺序，方便逐句对照。
// 变量命名和注释只依据本文件的数据流，以及需求里给出的纹理用途猜想。
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
#extension GL_EXT_samplerless_texture_functions : require

struct _17
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

const ivec2 _323[6] = ivec2[](ivec2(2, 1), ivec2(2, 1), ivec2(0, 2), ivec2(0, 2), ivec2(0, 1), ivec2(0, 1));
const vec2 _324[6] = vec2[](vec2(-1.0, 1.0), vec2(1.0), vec2(1.0, -1.0), vec2(1.0), vec2(1.0), vec2(-1.0, 1.0));
vec3 _339;
float _340;
vec3 _341;
float _343;
uint _344;

layout(set = 0, binding = 14, std140) uniform _14_15
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
} _15;

layout(set = 2, binding = 0, std140) uniform _16_18
{
    layout(row_major) _17 _m0[256];
} _18;

layout(set = 0, binding = 40, std430) readonly buffer _26_27
{
    uint _m0[];
} _27;

layout(set = 0, binding = 16, std430) readonly buffer _28_29
{
    vec4 _m0[];
} _29;

layout(set = 0, binding = 38, std140) uniform _30_31
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

layout(set = 0, binding = 13, std140) uniform _34_35
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
} _35;

// 头发材质参数块。字段名仍保留反编译编号，因为 std140 ABI 依赖原始布局。
// 可确认的关键字段：_m20 基础色/alpha tint，_m18/_m19 颜色与灰度混合，_m30/_m31/_m40 高光切线偏移，_m38 次高光颜色，_m47 发丝 mask 的 UV 变换。
layout(set = 1, binding = 0, std140) uniform _45_46
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
    float _m39;
    float _m40;
    float _m41;
    float _m42;
    float _m43;
    float _m44;
    float _m45;
    float _m46;
    vec4 _m47;
    float _m48;
    float _m49;
    float _m50;
    float _m51;
    vec4 _m52;
    vec4 _m53;
    vec4 _m54;
    vec4 _m55;
    vec4 _m56;
    vec4 _m57;
    float _m58;
    float _m59;
    float _m60;
    float _m61;
    float _m62;
    float _m63;
    float _m64;
    float _m65;
} _46;

layout(set = 0, binding = 39, std140) uniform _57_58
{
    vec4 _m0[32];
    layout(row_major) mat4 _m1[32];
} _58;

// 纹理与采样器绑定。头发专用纹理按用途重命名；引擎共享纹理只在用途清楚时命名。
layout(set = 0, binding = 3) uniform sampler samplerDepth;
layout(set = 0, binding = 5) uniform sampler samplerLinearClamp;
layout(set = 0, binding = 4) uniform sampler samplerVolume;
layout(set = 0, binding = 6) uniform samplerShadow samplerShadowCmp;
layout(set = 0, binding = 37) uniform texture2D sceneDepthTex;
layout(set = 0, binding = 20) uniform texture2D shadowMapArrayTex;
layout(set = 0, binding = 18) uniform texture2D screenOcclusionTex;
layout(set = 0, binding = 28) uniform texture3D probeMaskFineTex;
layout(set = 0, binding = 25) uniform texture3D probeDataFineTex;
layout(set = 0, binding = 27) uniform texture3D probeMaskMidTex;
layout(set = 0, binding = 24) uniform texture3D probeDataMidTex;
layout(set = 0, binding = 26) uniform texture3D probeMaskCoarseTex;
layout(set = 0, binding = 23) uniform texture3D probeDataCoarseTex;
layout(set = 1, binding = 7) uniform texture2D hairStrandMaskTex;
layout(set = 1, binding = 8) uniform texture2D hairRampTex;
layout(set = 1, binding = 5) uniform texture2D hairSpecularLutTex;
layout(set = 1, binding = 9) uniform texture2D baseColorTex;
layout(set = 1, binding = 3) uniform sampler samplerBaseAndStrand;
layout(set = 1, binding = 6) uniform texture2D controlMaskTex;
layout(set = 1, binding = 2) uniform sampler samplerControlMask;
layout(set = 1, binding = 4) uniform texture2D dualNormalTex;
layout(set = 1, binding = 1) uniform sampler samplerDualNormal;
layout(set = 0, binding = 22) uniform texture2D lightCookieTex;
layout(set = 0, binding = 29) uniform texture3D volumetricFogTex;

// 片元输入：UV、世界坐标、法线、切线+手性、用于 motion vector 的两组裁剪坐标，以及实例索引。
layout(location = 0) in vec2 uv;
layout(location = 1) in vec3 worldPos;
layout(location = 2) in vec3 vertexNormalWS;
layout(location = 3) in vec4 tangentWSAndSign;
layout(location = 4) in vec3 currClipPos;
layout(location = 5) in vec3 prevClipPos;
layout(location = 8) flat in uint instanceIndex;
layout(location = 0) out vec4 outColor;
layout(location = 1) out vec4 outMotionVector;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

// 头发片元主流程。执行顺序跟随反编译结果，注释按阶段解释意图。
void main()
{
    // 1. 重建视线方向，并读取当前实例的对象基矩阵。
    float fragViewDepth = 1.0 / gl_FragCoord.w;
    vec3 cameraToPixel = mix(_15._m11.xyz - worldPos, vec3(_15._m0[2u].x, _15._m0[2u].y, _15._m0[2u].z), vec3(_15._m26.w));
    float cameraToPixelLenSq = dot(cameraToPixel, cameraToPixel);
    float invCameraToPixelLen = inversesqrt(spvNMax(cameraToPixelLenSq, 9.9999999392252902907785028219223e-09));
    vec3 viewDirWS = cameraToPixel * invCameraToPixelLen;
    float viewDistance = cameraToPixelLenSq * invCameraToPixelLen;
    uint instanceMatrixBufferOffset = floatBitsToUint(_18._m0[instanceIndex]._m2.x);
    vec4 objectMatrixRow2;
    vec4 objectMatrixRow1;
    vec4 objectMatrixRow0;
    if ((floatBitsToUint(_18._m0[instanceIndex]._m1.w) & 16u) != 0u)
    {
        objectMatrixRow2 = _29._m0[instanceMatrixBufferOffset + 2u];
        objectMatrixRow1 = _29._m0[instanceMatrixBufferOffset + 1u];
        objectMatrixRow0 = _29._m0[instanceMatrixBufferOffset];
    }
    else
    {
        objectMatrixRow2 = _18._m0[instanceIndex]._m0[2];
        objectMatrixRow1 = _18._m0[instanceIndex]._m0[1];
        objectMatrixRow0 = _18._m0[instanceIndex]._m0[0];
    }
    // 2. 采样美术贴图：基础色/alpha、打包控制 mask、双法线图、发丝破碎 mask。
    vec4 baseSample = texture(sampler2D(baseColorTex, samplerBaseAndStrand), uv, _15._m38);
    // baseSample.xyz 是 albedo；baseSample.w 先乘材质 alpha 后成为 materialAlpha。
    vec3 baseColor = baseSample.xyz * _46._m20.xyz;
    vec4 controlMask = texture(sampler2D(controlMaskTex, samplerControlMask), uv, _15._m38);
    // controlMask 通道：x 混合发丝方向，y 控制主高光强度，z 参与光照/遮蔽，w 控制次高光颜色强度。
    float flowBlendMask = controlMask.x;
    float primarySpecMask = controlMask.y;
    float lightOcclusionMask = controlMask.z;
    float materialAlpha = baseSample.w * _46._m20.w;
    vec3 tintedBaseColor = baseColor * _46._m18;
    vec3 readableBaseColor = mix(vec3(dot(tintedBaseColor, vec3(0.21, 0.71, 0.07))), tintedBaseColor, vec3(_46._m19));
    // dualNormalTex 把两张切线空间法线塞进 RGBA：RG 用作光照法线，BA 用作发丝方向/高光法线。
    vec4 dualNormalSample = texture(sampler2D(dualNormalTex, samplerDualNormal), uv, _15._m38);
    vec2 normalPackedA = (dualNormalSample.xy * 2.0) - vec2(1.0);
    vec3 normalTSA = vec3(normalPackedA.x, normalPackedA.y, _341.z);
    vec2 normalXYA = normalPackedA.xy;
    normalTSA.z = spvNMax(1.000000016862383526387164645044e-16, sqrt(1.0 - clamp(dot(normalXYA, normalXYA), 0.0, 1.0)));
    vec2 normalXYAScaled = normalTSA.xy * _46._m3;
    // hairStrandMaskTex 使用独立 UV 变换，只取 x 通道，用来打碎连续高光形成发丝条纹。
    vec4 strandMaskSample = texture(sampler2D(hairStrandMaskTex, samplerBaseAndStrand), (uv * _46._m47.xy) + _46._m47.zw);
    // 后续只使用 strandMaskSample.x。
    // 3. 由 TBN、实例基矩阵和控制 mask 生成世界空间法线与各向异性发丝切线。
    vec3 rootToPixelVector = worldPos - vec3(objectMatrixRow0.w, _343, objectMatrixRow2.w);
    rootToPixelVector.y = 6.103515625e-05;
    vec3 rootToPixelDir = normalize(rootToPixelVector);
    mat3 tbnMatrix = mat3(tangentWSAndSign.xyz * 1.0, (cross(vertexNormalWS, tangentWSAndSign.xyz) * tangentWSAndSign.w) * 1.0, vertexNormalWS * 1.0);
    vec3 normalWSRaw = tbnMatrix * vec3(normalXYAScaled.x, normalXYAScaled.y, normalTSA.z);
    float frontFaceSign = gl_FrontFacing ? 1.0 : ((-1.0) + (2.0 * _46._m5));
    vec3 normalWS = (normalWSRaw * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(normalWSRaw, normalWSRaw)))) * frontFaceSign;
    vec3 geometricNormalWS = normalize(vertexNormalWS) * frontFaceSign;
    vec2 normalPackedB = (dualNormalSample.zw * 2.0) - vec2(1.0);
    vec3 normalTSB = vec3(normalPackedB.x, normalPackedB.y, _341.z);
    vec2 normalXYB = normalPackedB.xy;
    normalTSB.z = spvNMax(1.000000016862383526387164645044e-16, sqrt(1.0 - clamp(dot(normalXYB, normalXYB), 0.0, 1.0)));
    vec2 normalXYBScaled = normalTSB.xy * _46._m27;
    vec3 secondaryNormalWS = normalize(tbnMatrix * vec3(normalXYBScaled.x, normalXYBScaled.y, normalTSB.z));
    mat3 objectToWorld3x3 = mat3(objectMatrixRow0.xyz, objectMatrixRow1.xyz, objectMatrixRow2.xyz);
    vec3 hairFlowSeedWS = vec3(_46._m35, 1.0, 0.0) * objectToWorld3x3;
    vec3 hairTangentWS = cross(secondaryNormalWS, mix(cross(secondaryNormalWS, (hairFlowSeedWS * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(hairFlowSeedWS, hairFlowSeedWS)))).xyz), tangentWSAndSign.xyz, vec3(flowBlendMask)).xyz) * mix(1.0, tangentWSAndSign.w, flowBlendMask);
    vec3 viewDirObjectBasis = objectToWorld3x3 * viewDirWS;
    float anisoViewFactor = pow(clamp(dot(normalize((objectToWorld3x3 * secondaryNormalWS).xz), normalize(viewDirObjectBasis.xz)), 0.0, 1.0), _46._m33);
    // 4. 准备屏幕/相机状态，供深度、分块灯光和雾效路径使用。
    vec2 screenUV = gl_FragCoord.xy * _15._m22.zw;
    uvec2 pixelCoordU = uvec2(gl_FragCoord.xy);
    vec3 cameraForwardWS = vec3(0.0, 0.0, 1.0) * mat3(_15._m1[0].xyz, _15._m1[1].xyz, _15._m1[2].xyz);
    float probeLightingScale = mix(_15._m44.x, 1.0, _15._m113.w) * _15._m42.x;
    vec4 probeDominantDir;
    vec3 probeDiffuseColor;
    vec3 probeHueColor;
    float probeIntensity;
    // 5. Probe/SH 风格的体积光照。fine/mid/coarse 三层 3D 体积混合出漫反射颜色和主方向。
    if (_15._m102.y < 0.5)
    {
        vec3 outerProbeDeltaWS = worldPos - (_15._m126.xyz + (cameraForwardWS * (-_15._m128.w)));
        float outerProbeFade = spvNMax(clamp((spvNMax(abs(outerProbeDeltaWS.x), abs(outerProbeDeltaWS.z)) - 464.0) * 0.03125, 0.0, 1.0), clamp((abs(outerProbeDeltaWS.y) - 208.0) * 0.03125, 0.0, 1.0));
        vec4 volumeProbeSh2;
        vec4 volumeProbeSh1;
        vec4 volumeProbeSh0;
        float shDirectionalBlend;
        float shAmbientBlend;
        if ((_15._m126.w != 0.0) && (outerProbeFade < 1.0))
        {
            vec3 fineProbeDeltaWS = worldPos - (_15._m126.xyz + (cameraForwardWS * (-_15._m128.y)));
            float fineProbeFade = spvNMax(clamp((spvNMax(abs(fineProbeDeltaWS.x), abs(fineProbeDeltaWS.z)) - 29.0) * 0.5, 0.0, 1.0), clamp((abs(fineProbeDeltaWS.y) - 13.0) * 0.5, 0.0, 1.0));
            float fineCoverageAccum;
            vec4 fineSh2Accum;
            vec4 fineSh1Accum;
            vec4 fineSh0Accum;
            if (fineProbeFade < 1.0)
            {
                vec3 fineGridCoord = ((worldPos * 2.0) + vec3(0.5)) * _15._m127.xyz;
                vec3 fineProbeUVW = fineGridCoord - floor(fineGridCoord);
                vec4 fineProbeMask = textureLod(sampler3D(probeMaskFineTex, samplerVolume), fineProbeUVW, 0.0);
                float fineProbeWeight = 1.0 - fineProbeFade;
                float fineTexelHalfY = _15._m127.y * 0.5;
                float fineU = fineProbeUVW.x;
                float fineV0 = clamp(fineProbeUVW.y, fineTexelHalfY, 1.0 - fineTexelHalfY) * 0.3333333432674407958984375;
                float fineW = fineProbeUVW.z;
                vec4 fineProbeData0 = textureLod(sampler3D(probeDataFineTex, samplerLinearClamp), vec3(fineU, fineV0, fineW), 0.0);
                float fineMask0 = fineProbeMask.x;
                float fineMask1 = fineProbeMask.y;
                float fineMask2 = fineProbeMask.z;
                fineCoverageAccum = outerProbeFade + (fineProbeData0.w * fineProbeWeight);
                fineSh2Accum = vec4(((textureLod(sampler3D(probeDataFineTex, samplerLinearClamp), vec3(fineU, fineV0 + 0.666666686534881591796875, fineW), 0.0).xyz * 4.0) - vec3(2.0)) * fineMask2, fineMask2) * fineProbeWeight;
                fineSh1Accum = vec4(((textureLod(sampler3D(probeDataFineTex, samplerLinearClamp), vec3(fineU, fineV0 + 0.3333333432674407958984375, fineW), 0.0).xyz * 4.0) - vec3(2.0)) * fineMask1, fineMask1) * fineProbeWeight;
                fineSh0Accum = vec4(((fineProbeData0.xyz * 4.0) - vec3(2.0)) * fineMask0, fineMask0) * fineProbeWeight;
            }
            else
            {
                fineCoverageAccum = outerProbeFade;
                fineSh2Accum = vec4(0.0);
                fineSh1Accum = vec4(0.0);
                fineSh0Accum = vec4(0.0);
            }
            vec3 midProbeDeltaWS = worldPos - (_15._m126.xyz + (cameraForwardWS * (-_15._m128.z)));
            float midProbeFade = spvNMax(clamp((spvNMax(abs(midProbeDeltaWS.x), abs(midProbeDeltaWS.z)) - 116.0) * 0.125, 0.0, 1.0), clamp((abs(midProbeDeltaWS.y) - 52.0) * 0.125, 0.0, 1.0));
            float midCoverageAccum;
            vec4 midSh2Accum;
            vec4 midSh1Accum;
            vec4 midSh0Accum;
            if (midProbeFade < 1.0)
            {
                vec3 midGridCoord = ((worldPos * 0.5) + vec3(0.5)) * _15._m127.xyz;
                vec3 midProbeUVW = midGridCoord - floor(midGridCoord);
                vec4 midProbeMask = textureLod(sampler3D(probeMaskMidTex, samplerVolume), midProbeUVW, 0.0);
                float midProbeWeight = fineProbeFade * (1.0 - midProbeFade);
                float midTexelHalfY = _15._m127.y * 0.5;
                float midU = midProbeUVW.x;
                float midV0 = clamp(midProbeUVW.y, midTexelHalfY, 1.0 - midTexelHalfY) * 0.3333333432674407958984375;
                float midW = midProbeUVW.z;
                vec4 midProbeData0 = textureLod(sampler3D(probeDataMidTex, samplerLinearClamp), vec3(midU, midV0, midW), 0.0);
                float midMask0 = midProbeMask.x;
                float midMask1 = midProbeMask.y;
                float midMask2 = midProbeMask.z;
                midCoverageAccum = fineCoverageAccum + (midProbeData0.w * midProbeWeight);
                midSh2Accum = fineSh2Accum + (vec4(((textureLod(sampler3D(probeDataMidTex, samplerLinearClamp), vec3(midU, midV0 + 0.666666686534881591796875, midW), 0.0).xyz * 4.0) - vec3(2.0)) * midMask2, midMask2) * midProbeWeight);
                midSh1Accum = fineSh1Accum + (vec4(((textureLod(sampler3D(probeDataMidTex, samplerLinearClamp), vec3(midU, midV0 + 0.3333333432674407958984375, midW), 0.0).xyz * 4.0) - vec3(2.0)) * midMask1, midMask1) * midProbeWeight);
                midSh0Accum = fineSh0Accum + (vec4(((midProbeData0.xyz * 4.0) - vec3(2.0)) * midMask0, midMask0) * midProbeWeight);
            }
            else
            {
                midCoverageAccum = fineCoverageAccum;
                midSh2Accum = fineSh2Accum;
                midSh1Accum = fineSh1Accum;
                midSh0Accum = fineSh0Accum;
            }
            vec4 finalSh2Accum;
            vec4 finalSh1Accum;
            vec4 finalSh0Accum;
            float finalCoverageAccum;
            if (midProbeFade > 0.0)
            {
                vec3 coarseGridCoord = ((worldPos * 0.125) + vec3(0.5)) * _15._m127.xyz;
                vec3 coarseTexelHalfUVW = _15._m127.xyz * 0.5;
                vec3 coarseProbeUVW = clamp(coarseGridCoord - floor(coarseGridCoord), coarseTexelHalfUVW, vec3(1.0) - coarseTexelHalfUVW);
                vec4 coarseProbeMask = textureLod(sampler3D(probeMaskCoarseTex, samplerVolume), coarseProbeUVW, 0.0);
                float coarseProbeWeight = midProbeFade * (1.0 - outerProbeFade);
                float coarseTexelHalfY = _15._m127.y * 0.5;
                float coarseU = coarseProbeUVW.x;
                float coarseV0 = clamp(coarseProbeUVW.y, coarseTexelHalfY, 1.0 - coarseTexelHalfY) * 0.3333333432674407958984375;
                float coarseW = coarseProbeUVW.z;
                vec4 coarseProbeData0 = textureLod(sampler3D(probeDataCoarseTex, samplerLinearClamp), vec3(coarseU, coarseV0, coarseW), 0.0);
                float coarseMask0 = coarseProbeMask.x;
                float coarseMask1 = coarseProbeMask.y;
                float coarseMask2 = coarseProbeMask.z;
                finalSh2Accum = midSh2Accum + (vec4(((textureLod(sampler3D(probeDataCoarseTex, samplerLinearClamp), vec3(coarseU, coarseV0 + 0.666666686534881591796875, coarseW), 0.0).xyz * 4.0) - vec3(2.0)) * coarseMask2, coarseMask2) * coarseProbeWeight);
                finalSh1Accum = midSh1Accum + (vec4(((textureLod(sampler3D(probeDataCoarseTex, samplerLinearClamp), vec3(coarseU, coarseV0 + 0.3333333432674407958984375, coarseW), 0.0).xyz * 4.0) - vec3(2.0)) * coarseMask1, coarseMask1) * coarseProbeWeight);
                finalSh0Accum = midSh0Accum + (vec4(((coarseProbeData0.xyz * 4.0) - vec3(2.0)) * coarseMask0, coarseMask0) * coarseProbeWeight);
                finalCoverageAccum = midCoverageAccum + (coarseProbeData0.w * coarseProbeWeight);
            }
            else
            {
                finalSh2Accum = midSh2Accum;
                finalSh1Accum = midSh1Accum;
                finalSh0Accum = midSh0Accum;
                finalCoverageAccum = midCoverageAccum;
            }
            float probeCoverage01 = clamp((finalCoverageAccum * 2.0) - 1.0, 0.0, 1.0);
            volumeProbeSh2 = finalSh2Accum;
            volumeProbeSh1 = finalSh1Accum;
            volumeProbeSh0 = finalSh0Accum;
            shDirectionalBlend = probeCoverage01 - outerProbeFade;
            shAmbientBlend = (probeCoverage01 + outerProbeFade) * 0.5;
        }
        else
        {
            volumeProbeSh2 = vec4(0.0);
            volumeProbeSh1 = vec4(0.0);
            volumeProbeSh0 = vec4(0.0);
            shDirectionalBlend = 0.0;
            shAmbientBlend = 1.0;
        }
        vec4 shRow0 = volumeProbeSh0 + vec4(_15._m129.x * shAmbientBlend, (_15._m129.y * shAmbientBlend) + ((_15._m129.w * shDirectionalBlend) * 0.5), _15._m129.z * shAmbientBlend, (_15._m129.w * shAmbientBlend) + ((_15._m129.y * shDirectionalBlend) * 0.375));
        vec4 shRow1 = volumeProbeSh1 + vec4(_15._m130.x * shAmbientBlend, (_15._m130.y * shAmbientBlend) + ((_15._m130.w * shDirectionalBlend) * 0.5), _15._m130.z * shAmbientBlend, (_15._m130.w * shAmbientBlend) + ((_15._m130.y * shDirectionalBlend) * 0.375));
        vec4 shRow2 = volumeProbeSh2 + vec4(_15._m131.x * shAmbientBlend, (_15._m131.y * shAmbientBlend) + ((_15._m131.w * shDirectionalBlend) * 0.5), _15._m131.z * shAmbientBlend, (_15._m131.w * shAmbientBlend) + ((_15._m131.y * shDirectionalBlend) * 0.375));
        vec4 normalProbeEval = vec4(normalWS, 1.0);
        vec3 probeDiffuse = spvNMax(vec3(dot(shRow0, normalProbeEval), dot(shRow1, normalProbeEval), dot(shRow2, normalProbeEval)), vec3(0.0)) * probeLightingScale;
        vec3 lumaDirection = ((shRow0.xyz * 0.2125999927520751953125) + (shRow1.xyz * 0.715200006961822509765625)) + (shRow2.xyz * 0.072200000286102294921875);
        vec3 dominantDirSigned = lumaDirection * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(lumaDirection, lumaDirection)));
        float dominantDirAbsY = abs(dominantDirSigned.y);
        vec3 dominantDirUp = dominantDirSigned;
        dominantDirUp.y = dominantDirAbsY;
        vec4 dominantDirOut = vec4(dominantDirUp.x, dominantDirUp.y, dominantDirUp.z, vec4(0.0).w);
        dominantDirOut.w = 1.0;
        vec4 dominantDirEval = vec4(dominantDirSigned.x, dominantDirAbsY, dominantDirSigned.z, 1.0);
        vec3 dominantDirLighting = spvNMax(vec3(dot(shRow0, dominantDirEval), dot(shRow1, dominantDirEval), dot(shRow2, dominantDirEval)), vec3(0.0));
        float probeBlue = probeDiffuse.z;
        float probeGreen = probeDiffuse.y;
        vec4 hueSortGB = mix(vec4(probeBlue, probeGreen, -1.0, 0.666666686534881591796875), vec4(probeGreen, probeBlue, 0.0, -0.3333333432674407958984375), vec4(step(probeBlue, probeGreen)));
        float probeRed = probeDiffuse.x;
        float maxGreenBlue = hueSortGB.x;
        vec4 hueSortRGB = mix(vec4(maxGreenBlue, hueSortGB.yw, probeRed), vec4(probeRed, hueSortGB.yz, maxGreenBlue), vec4(step(maxGreenBlue, probeRed)));
        float maxChannel = hueSortRGB.x;
        float hueCompareA = hueSortRGB.w;
        float hueCompareB = hueSortRGB.y;
        float chroma = maxChannel - spvNMin(hueCompareA, hueCompareB);
        float probeHue = fract(abs(hueSortRGB.z + ((hueCompareA - hueCompareB) / ((6.0 * chroma) + 9.9999997473787516355514526367188e-05))));
        float probeSaturation = spvNMin(chroma / (maxChannel + 9.9999997473787516355514526367188e-05), mix(0.699999988079071044921875, 0.3499999940395355224609375, smoothstep(0.449999988079071044921875, 0.3499999940395355224609375, abs(probeHue - 0.5))) * clamp(maxChannel, 0.0, 1.0));
        float saturationValueScale = 2.0 / (2.0 - probeSaturation);
        probeDominantDir = dominantDirOut;
        probeDiffuseColor = probeDiffuse;
        probeHueColor = mix(vec3(1.0), clamp(abs((fract(vec3(probeHue, probeSaturation, saturationValueScale).xxx + vec3(1.0, 0.666666686534881591796875, 0.3333333432674407958984375)) * 6.0) - vec3(3.0)) - vec3(1.0), vec3(0.0), vec3(1.0)), vec3(probeSaturation)) * saturationValueScale;
        probeIntensity = spvNMax(spvNMax(spvNMax(dominantDirLighting.x, dominantDirLighting.y), dominantDirLighting.z), 0.0) * probeLightingScale;
    }
    else
    {
        probeDominantDir = vec4(0.0);
        probeDiffuseColor = vec3(1.0);
        probeHueColor = _15._m103.xyz;
        probeIntensity = probeLightingScale;
    }
    // 6. 可选角色/材质变色。用于特殊状态下增亮、染色，并提高高光响应。
    float instanceColorOverride = mix(_18._m0[instanceIndex]._m6.x, _15._m111.y, _15._m111.x);
    float heightColorOverride = spvNMax(_18._m0[instanceIndex]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_18._m0[instanceIndex]._m6.z, _15._m111.w, _15._m111.x) - worldPos.y) * mix(_18._m0[instanceIndex]._m6.y, 1.0, _15._m111.x));
    float overrideSpecBoost;
    vec3 baseForLightness;
    vec3 baseForDiffuse;
    SPIRV_CROSS_BRANCH
    if ((instanceColorOverride + heightColorOverride) > 0.00999999977648258209228515625)
    {
        float _1122 = spvNMax(instanceColorOverride, heightColorOverride);
        float _1123 = 1.0 - _1122;
        float _1125 = _1123 + (0.800000011920928955078125 * _1122);
        overrideSpecBoost = _1123 + (2.0 * _1122);
        baseForLightness = readableBaseColor * _1125;
        baseForDiffuse = baseColor * _1125;
    }
    else
    {
        overrideSpecBoost = 1.0;
        baseForLightness = readableBaseColor;
        baseForDiffuse = baseColor;
    }
    vec3 diffuseAlbedo = baseForDiffuse * 0.959999978542327880859375;
    vec3 specularTintMask = vec3(0.039999999105930328369140625) * primarySpecMask;
    vec3 rampAlbedo = baseForLightness * 0.959999978542327880859375;
    // 7. 将 motion vector 编码到第二个 render target。
    vec2 motionNdcDelta = (currClipPos.xy / vec2(spvNMax(currClipPos.z, 9.9999999392252902907785028219223e-09))) - (prevClipPos.xy / vec2(spvNMax(prevClipPos.z, 9.9999999392252902907785028219223e-09)));
    motionNdcDelta.y = -motionNdcDelta.y;
    vec2 encodedMotionXY = ((sqrt(sqrt(abs(motionNdcDelta * 0.5))) * vec2(ivec2(sign(motionNdcDelta)))) * 0.5) + vec2(0.5);
    vec4 motionOutput = vec4(encodedMotionXY.x, encodedMotionXY.y, vec4(0.0).z, vec4(0.0).w);
    motionOutput.z = 1.0;
    motionOutput.w = 0.4000000059604644775390625;
    // 8. 主光与屏幕遮蔽数据准备。
    vec3 mainLightDirWS = mix(-_33._m0.xyz, _15._m112.xyz, vec3(_15._m102.w));
    vec3 mainLightDirFlatWS = normalize(vec3(mainLightDirWS.x, 6.103515625e-05, mainLightDirWS.z));
    vec3 mainLightColor = mix(_33._m3.xyz, _15._m106.xyz, vec3(_15._m113.y));
    vec3 mainLightColorScaled = mainLightColor * mix(_33._m3.w, 1.0, _15._m113.w);
    int _1197 = int(pixelCoordU.x);
    int _1198 = int(pixelCoordU.y);
    vec4 screenOcclusionSample = texelFetch(screenOcclusionTex, ivec3(_1197, _1198, 0).xy, 0);
    float screenOcclusion = screenOcclusionSample.y;
    float lightingSceneBlend = mix(mix(1.0, screenOcclusionSample.x, _35._m6.x), 1.0, _15._m102.z);
    float nDotMainLight = dot(normalWS, mainLightDirWS);
    vec3 directAlbedo = rampAlbedo * _15._m101.z;
    vec3 softDirectAlbedo = directAlbedo * 0.64999997615814208984375;
    float diffuseLuma = dot(diffuseAlbedo, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625));
    float cameraBackLightFactor = clamp(-dot(mainLightDirFlatWS.xz, normalize(cameraForwardWS.xz)), 0.0, 1.0);
    float mainRampBlend = 1.0 - _15._m113.x;
    // hairRampTex 作为 1D ramp 使用：y 固定 0.5，x 来自 N dot L/视角偏置光照；RGB 改色，A 是权重/mask。
    vec4 rampSampleMain = textureLod(sampler2D(hairRampTex, samplerLinearClamp), vec2((clamp(mix(nDotMainLight, ((-nDotMainLight) * ((nDotMainLight * 0.5) - 1.0)) + 0.5, (cameraBackLightFactor * smoothstep(0.25, 0.75, 1.0 - abs(cameraForwardWS.y))) * mainRampBlend) + (_15._m112.w * _15._m113.x), -1.0, 1.0) * 0.5) + 0.5, 0.5), 0.0);
    // rampSampleMain.w 后续会与 controlMask.z 和屏幕遮蔽取交集。
    float rampMainWeight = rampSampleMain.w;
    float _1257 = rampSampleMain.x;
    float _1258 = rampSampleMain.y;
    float _1259 = rampSampleMain.z;
    float rampColorChroma = spvNMax(spvNMax(_1257, _1258), _1259) - spvNMin(spvNMin(_1257, _1258), _1259);
    vec4 rampSampleNormal = textureLod(sampler2D(hairRampTex, samplerLinearClamp), vec2((dot(normalWS, cameraForwardWS) * 0.5) + 0.5, 0.5), 0.0);
    float rampNormalWeight = rampSampleNormal.w;
    float occludedMask = lightOcclusionMask * screenOcclusion;
    float sharedLightMask = spvNMin(spvNMin(screenOcclusion, lightOcclusionMask), rampMainWeight);
    float directRampWeight = rampNormalWeight * occludedMask;
    vec3 probeAmbientTint = vec3((clamp(dot(normalWS, _15._m107.xyz) + _15._m108.x, 0.0, 1.0) * _15._m108.y) + _15._m108.z) * mix(probeHueColor, vec3(1.0), vec3(_15._m102.y * sharedLightMask));
    vec3 _1288 = vec3(sharedLightMask);
    vec3 sceneBlendVec = vec3(lightingSceneBlend);
    vec3 diffuseLightColor = mix((probeAmbientTint * mix(spvNMin(mix(0.64999997615814208984375, 1.0, probeIntensity), 1.5), clamp(probeIntensity, 1.25, 1.75), _15._m102.x)) * _15._m101.w, (mix(vec3(dot(mainLightColorScaled, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), mainLightColorScaled, _1288) + ((probeAmbientTint * clamp(probeIntensity, 0.0, 1.5)) * (vec3(1.0 - _15._m113.y) + (mainLightColor * _15._m113.y)))) * _15._m101.y, sceneBlendVec);
    vec3 rampedBaseColor = mix(mix(mix(vec3(dot(softDirectAlbedo, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), softDirectAlbedo, vec3(1.2000000476837158203125)), directAlbedo, vec3(clamp((occludedMask * rampNormalWeight) + rampMainWeight, 0.0, 1.0))), diffuseAlbedo, _1288);
    vec3 rampColoredBase = rampedBaseColor * (vec3(1.0 - rampColorChroma) + (rampSampleMain.xyz * rampColorChroma));
    vec3 shadedBaseColor = mix(mix(directAlbedo, mix(vec3(diffuseLuma), diffuseAlbedo, vec3(1.2000000476837158203125)), vec3(directRampWeight)), rampColoredBase * clamp(dot(rampedBaseColor, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)) * (1.0 / spvNMax(dot(rampColoredBase, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)), 0.001000000047497451305389404296875)), 0.0, 1.5), sceneBlendVec);
    vec4 shadedBaseAndBlend = vec4(shadedBaseColor, lightingSceneBlend);
    float specLightWeight = mix(directRampWeight, sharedLightMask, lightingSceneBlend);
    // 9. 头发 BRDF：两个各向异性高光 lobe，再叠加发丝破碎项；hairSpecularLutTex 提供高光 LUT/ramp。
    vec3 objectBasisLightVector = vec3(viewDirObjectBasis.x, mix(0.5, mainLightDirWS.y, lightingSceneBlend), viewDirObjectBasis.z) * objectToWorld3x3;
    vec3 primarySpecTangent = normalize(hairTangentWS + (secondaryNormalWS * ((_46._m30 * 2.0) - 1.0)));
    vec3 halfVectorRaw = normalize((mainLightDirWS * lightingSceneBlend) + (vec3(objectBasisLightVector.x, objectBasisLightVector.y, objectBasisLightVector.z) * 2.0)) + viewDirWS;
    vec3 halfVectorWS = halfVectorRaw * inversesqrt(spvNMax(6.103515625e-05, dot(halfVectorRaw, halfVectorRaw)));
    float primaryTangentDotHalf = dot(primarySpecTangent, halfVectorWS);
    vec3 primarySpecLobe = clamp(vec3(pow(spvNMax(sqrt(1.0 - (primaryTangentDotHalf * primaryTangentDotHalf)), 9.9999997473787516355514526367188e-05), 200.0)) * primarySpecMask, vec3(0.0), vec3(1.0));
    float specLutY = anisoViewFactor * anisoViewFactor;
    vec3 primarySpecular = (primarySpecLobe * textureLod(sampler2D(hairSpecularLutTex, samplerLinearClamp), vec2(primarySpecLobe.x, float(primaryTangentDotHalf > 0.0) * specLutY), 0.0).xyz) * anisoViewFactor;
    // hairSpecularLutTex 调制很窄的主高光 lobe；anisoViewFactor 根据视线与发丝方向关系衰减高光。
    float primarySpecularMax = spvNMax(spvNMax(primarySpecular.x, primarySpecular.y), primarySpecular.z);
    float secondaryTangentDotHalf = dot(normalize(hairTangentWS + (secondaryNormalWS * ((_46._m31 * 2.0) - 1.0))), halfVectorWS);
    float strandTangentDotHalf = dot(normalize(hairTangentWS + (secondaryNormalWS * ((2.0 * _46._m40) - 1.0))), halfVectorWS);
    // 将 UV.x 程序条纹、hairStrandMaskTex.x 和当前高光强度混合，打散连续高光。
    float strandBreakup = mix(1.0, mix(1.0, mix(mix(1.0 - _46._m42, 1.0, mix(ceil(clamp(fract(uv.x * _46._m39) - 0.5, 0.0, 1.0)), 1.0 - strandMaskSample.x, _46._m44)), 1.0, primarySpecularMax), clamp(pow(spvNMax(sqrt(1.0 - (strandTangentDotHalf * strandTangentDotHalf)), 9.9999997473787516355514526367188e-05), float(int(200.0 * spvNMax(1.0 - _46._m41, 0.0)))), 0.0, 1.0)), primarySpecMask);
    vec3 diffuseResult = (diffuseLightColor * shadedBaseColor) * strandBreakup;
    float alphaColorScale = (1.0 - _46._m6) + (materialAlpha * _46._m6);
    vec3 hairColorBeforeRim = (mix(vec3(dot(diffuseResult, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), diffuseResult, vec3(mix(_46._m43, 1.0, strandBreakup))) * alphaColorScale) + (((((((primarySpecular * specularTintMask) * _46._m32) * 5.0) * overrideSpecBoost) + mix(((vec3(pow(spvNMax(sqrt(1.0 - (secondaryTangentDotHalf * secondaryTangentDotHalf)), 9.9999997473787516355514526367188e-05), float(int(200.0 * spvNMax(1.0 - _46._m34, 0.0))))) * anisoViewFactor) * (_46._m38.xyz * controlMask.w)) * overrideSpecBoost, vec3(0.0), vec3(primarySpecularMax))) * ((diffuseLightColor * (((specLightWeight * 0.5) + 0.5) * mix(_15._m101.z, 1.0, specLightWeight))) * 1.0)) * _15._m114.w);
    float hairColorLuma = dot(hairColorBeforeRim, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625));
    float overbrightLuma = clamp(hairColorLuma - 0.5, 0.0, 0.5);
    vec3 rimDirectionWS = normalize(cross(cameraForwardWS, vec3(_15._m110.xy, 0.0)));
    vec2 depthOffsetDir = normalize((normalWS * mat3(_15._m0[0].xyz, _15._m0[1].xyz, _15._m0[2].xyz)).xy) * vec2(_15._m27.y / _15._m27.x, 1.0);
    vec2 depthUvMin = _15._m27.zw - vec2(1.0);
    vec2 depthUvMax = vec2(2.0) - _15._m27.zw;
    float flatLightNdot = dot(mainLightDirFlatWS, normalWS);
    float viewNdot = dot(viewDirWS, normalWS);
    float nonSceneBlend = 1.0 - lightingSceneBlend;
    // 边缘光/背光与类似透射的补光；scene depth 采样用于避免效果穿过前景几何。
    vec3 hairColorWithRim = mix(vec3(hairColorLuma), hairColorBeforeRim, vec3((overbrightLuma * overbrightLuma) + 1.0)) + (((((_15._m109.xyz * smoothstep(0.100000001490116119384765625, 0.20000000298023223876953125, (1.0 / ((_15._m24.z * textureLod(sampler2D(sceneDepthTex, samplerDepth), clamp(screenUV + ((depthOffsetDir * _15._m110.w) * 0.006000000052154064178466796875), depthUvMin, depthUvMax), 0.0).x) + _15._m24.w)) - fragViewDepth)) * _15._m109.w) * spvNMin(spvNMin(clamp(dot(rootToPixelDir, rimDirectionWS) + 1.0, 0.0, 1.0), lightOcclusionMask), screenOcclusion)) * (mix(vec3(0.25), diffuseAlbedo, vec3(_15._m110.z)) * clamp(dot(rimDirectionWS, normalWS), 0.0, 1.0))) + ((((((mix(probeDiffuseColor * (1.0 / spvNMax(spvNMax(spvNMax(probeDiffuseColor.x, probeDiffuseColor.y), probeDiffuseColor.z) * 0.5, 1.0)), mainLightColorScaled, sceneBlendVec) * clamp(mix(dot(probeDominantDir.xyz, normalWS) * probeDominantDir.w, ((-flatLightNdot) * ((flatLightNdot * 0.5) - 1.0)) + 0.5, lightingSceneBlend), 0.0, 1.0)) * ((nonSceneBlend + (cameraBackLightFactor * lightingSceneBlend)) * mainRampBlend)) * smoothstep(0.60000002384185791015625, 0.800000011920928955078125, 1.0 - abs(viewNdot))) * spvNMin(lightOcclusionMask, screenOcclusion)) * (nonSceneBlend + (smoothstep(0.100000001490116119384765625, 0.039999999105930328369140625, diffuseLuma) * lightingSceneBlend))) * spvNMax(vec3(0.1500000059604644775390625), diffuseAlbedo)));
    // 10. 分块附加灯循环。bitmask 按 32x32 屏幕 tile 和深度 slice 筛出需要评估的灯。
    vec2 pixelCoordF = vec2(pixelCoordU);
    vec2 lightTileCoord = floor(pixelCoordF * 0.03125);
    int lightTileListBase = int((lightTileCoord.x + (lightTileCoord.y * _31._m5)) * 8.0);
    float depthSliceRaw = floor(fragViewDepth - (_15._m25.y * _31._m11));
    float depthSliceClamped = clamp(depthSliceRaw, 0.0, _31._m7 - 1.0);
    int depthSliceListBase = int(depthSliceClamped * 8.0);
    vec3 accumulatedColor;
    accumulatedColor = hairColorWithRim;
    vec3 _1624;
    SPIRV_CROSS_LOOP
    for (int _1626 = 0; _1626 <= 7; accumulatedColor = _1624, _1626++)
    {
        uint _1644 = (depthSliceRaw <= depthSliceClamped) ? (_27._m0[uint(lightTileListBase + _1626)] & _27._m0[uint((_15._m43.y + depthSliceListBase) + _1626)]) : 0u;
        uint _1645 = uint(_1626);
        _1624 = accumulatedColor;
        uint _1650;
        vec3 _1647;
        SPIRV_CROSS_LOOP
        for (uint _1649 = _1644; _1649 != 0u; _1624 = _1647, _1649 = _1650)
        {
            uint _1654 = uint(findLSB(_1649));
            _1650 = _1649 ^ (1u << (_1654 & 31u));
            int _1660 = int((32u * _1645) + _1654) * 8;
            int _1663 = _1660 + 1;
            int _1666 = _1660 + 2;
            int _1669 = _1660 + 3;
            int _1672 = _1660 + 4;
            int _1675 = _1660 + 5;
            int _1678 = _1660 + 6;
            int _1681 = _1660 + 7;
            float _1759;
            // 评估灯光前，先做可选的灯体裁剪/渐隐。
            if (uint(_33._m6[_1675].w) == 1u)
            {
                uint _1690 = floatBitsToUint(_33._m6[_1675].x);
                uint _1697 = floatBitsToUint(_33._m6[_1675].y);
                uint _1704 = floatBitsToUint(_33._m6[_1675].z);
                uint _1711 = floatBitsToUint(_33._m6[_1678].x);
                uint _1718 = floatBitsToUint(_33._m6[_1678].y);
                uint _1725 = floatBitsToUint(_33._m6[_1678].z);
                vec3 _1744 = abs((mat4(vec4(unpackHalf2x16(_1690).x, unpackHalf2x16(_1704).x, unpackHalf2x16(_1718).x, 0.0), vec4(unpackHalf2x16(_1690 >> 16u).x, unpackHalf2x16(_1704 >> 16u).x, unpackHalf2x16(_1718 >> 16u).x, 0.0), vec4(unpackHalf2x16(_1697).x, unpackHalf2x16(_1711).x, unpackHalf2x16(_1725).x, 0.0), vec4(unpackHalf2x16(_1697 >> 16u).x, unpackHalf2x16(_1711 >> 16u).x, unpackHalf2x16(_1725 >> 16u).x, 0.0)) * vec4(worldPos - _33._m6[_1663].xyz, 1.0)).xyz);
                float _1751 = _33._m6[_1681].x * 0.5;
                float _1757 = 1.0 - clamp((spvNMax(spvNMax(_1744.x, _1744.y), _1744.z) - (_1751 + 0.5)) / (0.5 - _1751), 0.0, 1.0);
                _1759 = _1757 * _1757;
            }
            else
            {
                _1759 = 1.0;
            }
            if (false || (_1759 < 0.001000000047497451305389404296875))
            {
                _1647 = _1624;
                continue;
            }
            vec3 _2436;
            // 灯光类型看起来包含直接光、本地光、颜色替换光，并支持 cookie 与 shadow map。
            if (_33._m6[_1660].w < 1.5)
            {
                vec3 _2435;
                do
                {
                    uint _1772 = floatBitsToUint(_33._m6[_1669].w);
                    if ((_1772 == 16u) || ((_33._m6[_1669].z + _15._m113.z) < 0.5))
                    {
                        _2435 = _1624;
                        break;
                    }
                    bool _1784 = (uint(_33._m6[_1660].w) & 1u) == 0u;
                    bool _1788 = (!_1784) && (_33._m6[_1666].z > 0.0);
                    bool _1789 = _1772 == 4u;
                    float _1790 = float(_1784);
                    float _1798 = (0.5 + (0.5 * _33._m6[_1666].y)) - abs(_33._m6[_1666].x);
                    float _1799 = _33._m6[_1666].y - _1798;
                    float _1806 = abs(spvNMax((1.0 - abs(_1798)) - abs(_1799), 0.00048828125));
                    vec3 _1810 = normalize(vec3(_1798, _1799, (_33._m6[_1666].x >= 0.0) ? _1806 : (-_1806)));
                    float _1816 = mix(_33._m6[_1678].w, spvNMax(2.0 * _33._m6[_1672].y, 0.100000001490116119384765625), float(_1789));
                    vec3 _1821 = _33._m6[_1663].xyz - worldPos;
                    vec3 _1822 = -_1810;
                    vec3 _1827 = mix(_1821, _1822 * dot(_1821, _1822), vec3(float(_1789 && (_33._m6[_1672].z > 0.5)) * _1790));
                    float _1828 = dot(_1827, _1827);
                    float _1829 = inversesqrt(_1828);
                    vec3 _1830 = _1827 * _1829;
                    vec3 _1863;
                    float _1864;
                    if (_1788)
                    {
                        vec3 _1834 = (_1810 * _33._m6[_1666].z) * 0.5;
                        vec3 _1835 = _1827 - _1834;
                        vec3 _1836 = _1827 + _1834;
                        float _1837 = length(_1835);
                        float _1838 = length(_1836);
                        vec3 _1847 = normalize(cross(cross(_1810, _1830), _1810));
                        _1863 = _1847;
                        _1864 = ((1.0 / ((((_1837 * _1838) + dot(_1835, _1836)) * 0.5) + 1.0)) * clamp(0.5 * ((dot(_1847, _1835) / _1837) + (dot(_1847, _1836) / _1838)), 0.0, 1.0)) * (1.0 / clamp(1.0 + (0.5 * clamp(_33._m6[_1666].z * _1829, 0.0, 1.0)), 0.0, 1.0));
                    }
                    else
                    {
                        _1863 = _1830;
                        _1864 = 1.0;
                    }
                    float _1886;
                    if (_1816 < 0.0)
                    {
                        float _1880 = _1828 * (_33._m6[_1663].w * _33._m6[_1663].w);
                        float _1883 = clamp(1.0 - (_1880 * _1880), 0.0, 1.0);
                        _1886 = mix(1.0 / (_1828 + 1.0), _1864, float(_1788)) * (_1883 * _1883);
                    }
                    else
                    {
                        vec3 _1869 = _1827 * _33._m6[_1663].w;
                        _1886 = _1864 * pow(1.0 - clamp(dot(_1869, _1869), 0.0, 1.0), _1816);
                    }
                    float _1891 = clamp((dot(_1863, _1822) - _33._m6[_1666].z) * _33._m6[_1666].w, 0.0, 1.0);
                    float _1894 = _1886 * mix(1.0, _1891 * _1891, _1790);
                    int _1896 = int(_33._m6[_1681].w);
                    float _2000;
                    if ((!_1788) && (_1896 >= 0))
                    {
                        uint _1902 = uint(_1896);
                        vec2 _1993;
                        SPIRV_CROSS_BRANCH
                        if (_1790 != 0.0)
                        {
                            vec4 _1983 = vec4(worldPos, 1.0) * _58._m1[_1902];
                            _1993 = _58._m0[_1902].xy + (clamp(_1983.xy / vec2(_1983.w), vec2(0.0), vec2(1.0)) * _58._m0[_1902].zw);
                        }
                        else
                        {
                            vec3 _1917 = (_58._m1[_1902] * vec4(-_1827, 0.0)).xyz;
                            vec3 _348 = _1917;
                            vec3 _347 = _1917;
                            vec3 _346 = abs(_1917);
                            uint _1926 = uint(int(_346.y > _346.x));
                            uint _1932 = (_346.z > _346[_1926]) ? 2u : _1926;
                            uint _1938 = (_1932 * 2u) + uint(_347[_1932] < 0.0);
                            float _1942 = abs(_348[_1938 / 2u]);
                            float _1962 = 0.5 - (0.000244140625 / _58._m0[_1902].w);
                            _1993 = _58._m0[_1902].xy + (clamp(vec2((float(_1938) + ((((_348[uint(_323[_1938].x)] * _324[_1938].x) / _1942) * _1962) + 0.5)) * 0.16666667163372039794921875, 0.5 - (((_348[uint(_323[_1938].y)] * _324[_1938].y) / _1942) * _1962)), vec2(0.0), vec2(1.0)) * _58._m0[_1902].zw);
                        }
                        _2000 = _1894 * textureLod(sampler2D(lightCookieTex, samplerLinearClamp), _1993, 0.0).x;
                    }
                    else
                    {
                        _2000 = _1894;
                    }
                    float _2001 = _2000 * _1759;
                    vec3 _2434;
                    do
                    {
                        vec3 _2433;
                        SPIRV_CROSS_BRANCH
                        if (_2001 > 9.9999997473787516355514526367188e-05)
                        {
                            SPIRV_CROSS_BRANCH
                            if (_1789)
                            {
                                _2434 = mix(_1624, _33._m6[_1660].xyz, vec3(_2001 * (_33._m6[_1672].x * ((1.0 - _33._m6[_1672].w) + (smoothstep(-0.5, 0.5, dot(geometricNormalWS, _1863)) * _33._m6[_1672].w)))));
                                break;
                            }
                            float _2021 = dot(normalWS, _1863);
                            float _2022 = clamp(_2021, 0.0, 1.0);
                            float _2309;
                            if (_1772 != 0u)
                            {
                                int _2074;
                                if (_1784)
                                {
                                    _2074 = int(_33._m6[_1669].x);
                                }
                                else
                                {
                                    uint _2029 = floatBitsToUint(_33._m6[_1666].w);
                                    uint _2031 = floatBitsToUint(_33._m6[_1669].x);
                                    vec3 _2032 = worldPos - _33._m6[_1663].xyz;
                                    vec3 _2033 = abs(_2032);
                                    float _2034 = _2033.x;
                                    float _2035 = _2033.y;
                                    float _2037 = _2033.z;
                                    int _2069;
                                    if ((_2034 > _2035) && (_2034 > _2037))
                                    {
                                        _2069 = int((_2032.x > 0.0) ? (_2029 >> 24u) : ((_2029 >> 16u) & 255u));
                                    }
                                    else
                                    {
                                        int _2061;
                                        if (_2035 > _2037)
                                        {
                                            _2061 = int((_2032.y > 0.0) ? ((_2029 >> 8u) & 255u) : (_2029 & 255u));
                                        }
                                        else
                                        {
                                            _2061 = int((_2032.z > 0.0) ? ((_2031 >> 8u) & 255u) : (_2031 & 255u));
                                        }
                                        _2069 = _2061;
                                    }
                                    _2074 = (_2069 < 80) ? _2069 : (-1);
                                }
                                bool _2075 = _2074 >= 0;
                                float _2308;
                                if (_2075)
                                {
                                    vec3 _2082 = worldPos - _33._m6[_1663].xyz;
                                    vec4 _2102 = vec4((worldPos - ((_2082 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_2082, _2082)))) * _35._m10[_2074].x)) + (geometricNormalWS * (_35._m10[_2074].y * 5.0)), 1.0) * _35._m9[_2074];
                                    vec3 _2106 = _2102.xyz / vec3(_2102.w);
                                    vec3 _2117 = _2106.xyz;
                                    bvec3 _2118 = lessThanEqual(_2117, vec3(0.0));
                                    bvec3 _2119 = greaterThanEqual(_2117, vec3(1.0));
                                    float _2122 = _2106.z;
                                    vec2 _2131 = ((_2106.xy * (_35._m11[_2074].zw - _35._m11[_2074].xy)) + _35._m11[_2074].xy).xy * _35._m12.zw;
                                    // 3x3 阴影过滤。这里的三次权重来自反编译出的 PCF 公式。
                                    vec2 _2133 = floor(_2131 + vec2(0.5));
                                    vec2 _2134 = _2131 - _2133;
                                    float _2135 = _2134.x;
                                    float _2136 = _2135 + 0.5;
                                    float _2137 = _2136 * _2136;
                                    float _2140 = 1.0 - _2135;
                                    float _2141 = spvNMin(_2135, 0.0);
                                    float _2144 = _2135 + 1.0;
                                    float _2145 = spvNMax(_2135, 0.0);
                                    float _2156 = _2134.y;
                                    float _2157 = _2156 + 0.5;
                                    float _2158 = _2157 * _2157;
                                    float _2161 = 1.0 - _2156;
                                    float _2162 = spvNMin(_2156, 0.0);
                                    float _2165 = _2156 + 1.0;
                                    float _2166 = spvNMax(_2156, 0.0);
                                    vec3 _2178 = vec3(0.1599999964237213134765625 * _2140, 0.1599999964237213134765625 * ((_2144 - (_2145 * _2145)) + 1.0), _2137 * 0.07999999821186065673828125);
                                    vec3 _2179 = vec3(0.1599999964237213134765625 * ((_2137 * 0.5) - _2135), 0.1599999964237213134765625 * ((_2140 - (_2141 * _2141)) + 1.0), 0.1599999964237213134765625 * _2144) + _2178;
                                    vec3 _2181 = vec3(0.1599999964237213134765625 * _2161, 0.1599999964237213134765625 * ((_2165 - (_2166 * _2166)) + 1.0), _2158 * 0.07999999821186065673828125);
                                    vec3 _2182 = vec3(0.1599999964237213134765625 * ((_2158 * 0.5) - _2156), 0.1599999964237213134765625 * ((_2161 - (_2162 * _2162)) + 1.0), 0.1599999964237213134765625 * _2165) + _2181;
                                    vec3 _2188 = ((_2178 / _2179) + vec3(-2.5, -0.5, 1.5)) * _35._m12.xxx;
                                    vec3 _2190 = ((_2181 / _2182) + vec3(-2.5, -0.5, 1.5)) * _35._m12.yyy;
                                    vec2 _2192 = _2133 * _35._m12.xy;
                                    float _2193 = _2188.x;
                                    float _2194 = _2190.x;
                                    vec2 _2196 = _2192 + vec2(_2193, _2194);
                                    float _2197 = _2188.y;
                                    vec2 _2199 = _2192 + vec2(_2197, _2194);
                                    float _2200 = _2188.z;
                                    vec2 _2202 = _2192 + vec2(_2200, _2194);
                                    float _2203 = _2190.y;
                                    vec2 _2205 = _2192 + vec2(_2193, _2203);
                                    vec2 _2207 = _2192 + vec2(_2197, _2203);
                                    vec2 _2209 = _2192 + vec2(_2200, _2203);
                                    float _2210 = _2190.z;
                                    vec2 _2212 = _2192 + vec2(_2193, _2210);
                                    vec2 _2214 = _2192 + vec2(_2197, _2210);
                                    vec2 _2216 = _2192 + vec2(_2200, _2210);
                                    float _2217 = _2179.x;
                                    float _2218 = _2182.x;
                                    float _2220 = _2179.y;
                                    float _2222 = _2179.z;
                                    float _2224 = _2182.y;
                                    float _2228 = _2182.z;
                                    float _2294 = ((((((((_2217 * _2218) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2196, _340).xy, _2122), 0.0)) + ((_2220 * _2218) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2199, _340).xy, _2122), 0.0))) + ((_2222 * _2218) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2202, _340).xy, _2122), 0.0))) + ((_2217 * _2224) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2205, _340).xy, _2122), 0.0))) + ((_2220 * _2224) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2207, _340).xy, _2122), 0.0))) + ((_2222 * _2224) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2209, _340).xy, _2122), 0.0))) + ((_2217 * _2228) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2212, _340).xy, _2122), 0.0))) + ((_2220 * _2228) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2214, _340).xy, _2122), 0.0));
                                    _2308 = _2075 ? mix(1.0, (any(bvec3(_2118.x || _2119.x, _2118.y || _2119.y, _2118.z || _2119.z)) || ((floatBitsToUint(_2122) & 2147483647u) > 2139095040u)) ? 1.0 : (_2294 + ((_2222 * _2228) * textureLod(sampler2DShadow(shadowMapArrayTex, samplerShadowCmp), vec3(vec3(_2216, _340).xy, _2122), 0.0))), _35._m10[_2074].w) : 1.0;
                                }
                                else
                                {
                                    _2308 = clamp(dot(rootToPixelDir, _1863) + 1.0, 0.0, 1.0);
                                }
                                _2309 = _2308;
                            }
                            else
                            {
                                _2309 = 1.0;
                            }
                            float _2382;
                            vec3 _2383;
                            float _2384;
                            vec3 _2385;
                            vec3 _2386;
                            SPIRV_CROSS_BRANCH
                            if (_1772 == 0u)
                            {
                                vec3 _2362 = _33._m6[_1660].xyz * _2001;
                                vec3 _2375 = shadedBaseAndBlend.xyz;
                                _2382 = _2001;
                                _2383 = (_33._m6[_1660].xyz * ((1.0 - _33._m6[_1672].y) + ((1.0 / spvNMax(1.0, spvNMax(spvNMax(_2362.x, _2362.y), _2362.z) * mix(0.75, 0.5, nonSceneBlend))) * _33._m6[_1672].y))) * mix(0.25 * _33._m6[_1672].x, 1.0, clamp(_2021 + 0.5, 0.0, 1.0));
                                _2384 = _2022;
                                _2385 = _2375;
                                _2386 = _2375;
                            }
                            else
                            {
                                float _2357;
                                float _2358;
                                vec3 _2359;
                                vec3 _2360;
                                if (_1772 == 3u)
                                {
                                    _2357 = _2001 * (smoothstep(0.100000001490116119384765625, 0.20000000298023223876953125, (1.0 / ((_15._m24.z * textureLod(sampler2D(sceneDepthTex, samplerDepth), clamp(screenUV + ((depthOffsetDir * _33._m6[_1672].x) * 0.006000000052154064178466796875), depthUvMin, depthUvMax), 0.0).x) + _15._m24.w)) - fragViewDepth) * _2309);
                                    _2358 = clamp(dot(normalWS, -normalize(cross(cameraForwardWS, cross(cameraForwardWS, _1863)))), 0.0, 1.0);
                                    _2359 = mix(vec3(0.5), diffuseAlbedo, vec3(_33._m6[_1672].y));
                                    _2360 = vec3(0.0);
                                }
                                else
                                {
                                    bool _2318 = _1772 == 1u;
                                    float _2328;
                                    vec3 _2329;
                                    if (_2318)
                                    {
                                        _2328 = clamp(clamp(_2021 + _33._m6[_1672].x, -1.0, 1.0), 0.0, 1.0) * _2309;
                                        _2329 = rampAlbedo * _33._m6[_1672].y;
                                    }
                                    else
                                    {
                                        _2328 = _2022;
                                        _2329 = vec3(0.0);
                                    }
                                    _2357 = _2001;
                                    _2358 = _2328;
                                    _2359 = mix(vec3(0.0), diffuseAlbedo, bvec3(_2318));
                                    _2360 = _2329;
                                }
                                _2382 = _2357;
                                _2383 = _33._m6[_1660].xyz;
                                _2384 = _2358;
                                _2385 = _2359;
                                _2386 = _2360;
                            }
                            // 附加灯复用同一套头发高光 LUT；特殊的深度/边缘光路径不加这项。
                            vec3 _2423;
                            SPIRV_CROSS_BRANCH
                            if (_1772 != 3u)
                            {
                                vec3 _2391 = _1863 + viewDirWS;
                                float _2396 = dot(primarySpecTangent, _2391 * inversesqrt(spvNMax(6.103515625e-05, dot(_2391, _2391))));
                                vec3 _2404 = clamp(vec3(pow(spvNMax(sqrt(1.0 - (_2396 * _2396)), 9.9999997473787516355514526367188e-05), 200.0)) * primarySpecMask, vec3(0.0), vec3(1.0));
                                _2423 = (((((((_2404 * textureLod(sampler2D(hairSpecularLutTex, samplerLinearClamp), vec2(_2404.x, float(_2396 > 0.0) * specLutY), 0.0).xyz) * anisoViewFactor) * specularTintMask) * _46._m32) * 5.0) * overrideSpecBoost) * 1.0) * _33._m6[_1681].z;
                            }
                            else
                            {
                                _2423 = vec3(0.0);
                            }
                            vec3 _2426 = _2383 * _2382;
                            _2433 = _1624 + (((_2426 * mix(_2386, _2385, vec3(_2384))) * alphaColorScale) + ((_2426 * _2423) * _2384));
                        }
                        else
                        {
                            _2433 = _1624;
                        }
                        _2434 = _2433;
                        break;
                    } while(false);
                    _2435 = _2434;
                    break;
                } while(false);
                _2436 = _2435;
            }
            else
            {
                _2436 = _1624;
            }
            _1647 = _2436;
        }
    }
    // 11. 可选材质覆盖：灰度/染色，再加掠射角 rim 颜色。
    vec3 colorAfterMaterialOverride;
    SPIRV_CROSS_BRANCH
    if (_46._m12 > 0.5)
    {
        colorAfterMaterialOverride = mix(mix(vec3(0.5), mix(vec3(dot(accumulatedColor, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), accumulatedColor, vec3(_46._m14)), vec3(_46._m15)) * _46._m13, _46._m22.xyz, vec3(_46._m22.w)) + ((_46._m23.xyz * smoothstep(1.0 - _46._m16, 1.0, 1.0 - clamp(viewNdot, 0.0, 1.0))) * _46._m17);
    }
    else
    {
        colorAfterMaterialOverride = accumulatedColor;
    }
    vec4 colorBeforeFog = vec4(colorAfterMaterialOverride / vec3(_15._m42.x), materialAlpha);
    colorBeforeFog.w = (_46._m8 == 1.0) ? materialAlpha : 1.0;
    // _m8 决定输出贴图 alpha，还是强制不透明。
    // 12. 大气雾/体积雾积分。
    vec4 finalColor;
    SPIRV_CROSS_BRANCH
    if (_15._m113.w < 0.5)
    {
        vec3 _2491 = -viewDirWS;
        float _2507 = worldPos.y * _15._m68.w;
        float _2512 = spvNMax(0.00999999977648258209228515625, _2507 + _15._m69.w);
        vec3 _2526 = exp(_15._m67.xyz * ((-spvNMax(0.0, (viewDistance * _15._m66.w) - _15._m65.w)) * (((1.0 - exp(-_2512)) / _2512) * exp(_2507 + _15._m70.w))));
        float _2529 = dot(_2491, _15._m66.xyz);
        float _2535 = _15._m67.w * _15._m67.w;
        float _2539 = (1.0 + _2535) - ((2.0 * _15._m67.w) * _2529);
        vec3 _2859;
        float _2860;
        if (_15._m77.z > 0.0)
        {
            uvec3 _2690 = (uvec3(ivec3(_1197, _1198, int(_15._m41 & 7u))) * uvec3(1664525u)) + uvec3(1013904223u);
            uint _2691 = _2690.y;
            uint _2692 = _2690.z;
            uint _2695 = _2690.x + (_2691 * _2692);
            uint _2697 = _2691 + (_2692 * _2695);
            uint _2699 = _2692 + (_2695 * _2697);
            uint _2701 = _2695 + (_2697 * _2699);
            float _2723 = dot(_2491, -_15._m0[2].xyz);
            vec3 _2730 = worldPos - _15._m11.xyz;
            float _2732 = (_15._m77.w * ((_2723 > 5.9604644775390625e-08) ? (1.0 / _2723) : 0.0)) * (1.0 / viewDistance);
            float _2733 = _2730.y;
            float _2734 = _2732 * _2733;
            float _2736 = _15._m11.y + _2734;
            float _2737 = _2733 - _2734;
            float _2739 = (1.0 - _2732) * viewDistance;
            float _2753 = spvNMax(-127.0, _15._m71.z * _2737);
            float _2777 = spvNMax(-127.0, _15._m74.x * _2737);
            float _2788 = ((_15._m71.y * exp2(-spvNMax(-127.0, _15._m71.z * (_2736 - _15._m71.x)))) * ((abs(_2753) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2753)) / _2753) : (0.693147182464599609375 - (0.2402265071868896484375 * _2753)))) + ((_15._m74.y * exp2(-spvNMax(-127.0, _15._m74.x * (_2736 - _15._m74.z)))) * ((abs(_2777) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2777)) / _2777) : (0.693147182464599609375 - (0.2402265071868896484375 * _2777))));
            float _2810 = clamp((viewDistance * _15._m72.w) + _15._m72.z, 0.0, 1.0);
            float _2813 = clamp((spvNMax(clamp(exp2(-(_2788 * _2739)), 0.0, 1.0), _15._m73.w) + clamp((viewDistance * _15._m72.y) + _15._m72.x, 0.0, 1.0)) + _2810, 0.0, 1.0);
            vec4 _2853 = mix(vec4(0.0, 0.0, 0.0, 1.0), textureLod(sampler3D(volumetricFogTex, samplerLinearClamp), vec3((pixelCoordF + ((((vec3(uvec3(_2701, _2697 + (_2699 * _2701), _344) >> uvec3(16u)) * vec3(1.525902189314365386962890625e-05)) * 2.0) - vec3(1.0)) * _15._m81.w).xy) * _15._m79.xy, (log2((fragViewDepth * _15._m78.x) + _15._m78.y) * _15._m78.z) / _15._m77.z), 0.0), vec4(clamp((fragViewDepth - _15._m80.z) * 1000000.0, 0.0, 1.0)));
            _2859 = _2853.xyz + (((_15._m73.xyz * (1.0 - _2813)) + (((_15._m76.xyz * pow(clamp(dot(viewDirWS, _15._m75.xyz), 0.0, 1.0), _15._m76.w)) * (1.0 - clamp(exp2(-(_2788 * spvNMax(_2739 - _15._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _2810))) * _2853.w);
            _2860 = _2853.w * _2813;
        }
        else
        {
            vec3 _2566 = worldPos - _15._m11.xyz;
            float _2568 = _2566.y;
            float _2582 = spvNMax(-127.0, _15._m71.z * _2568);
            float _2606 = spvNMax(-127.0, _15._m74.x * _2568);
            float _2617 = ((_15._m71.y * exp2(-spvNMax(-127.0, _15._m71.z * (_15._m11.y - _15._m71.x)))) * ((abs(_2582) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2582)) / _2582) : (0.693147182464599609375 - (0.2402265071868896484375 * _2582)))) + ((_15._m74.y * exp2(-spvNMax(-127.0, _15._m74.x * (_15._m11.y - _15._m74.z)))) * ((abs(_2606) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2606)) / _2606) : (0.693147182464599609375 - (0.2402265071868896484375 * _2606))));
            float _2639 = clamp((viewDistance * _15._m72.w) + _15._m72.z, 0.0, 1.0);
            float _2642 = clamp((spvNMax(clamp(exp2(-(_2617 * viewDistance)), 0.0, 1.0), _15._m73.w) + clamp((viewDistance * _15._m72.y) + _15._m72.x, 0.0, 1.0)) + _2639, 0.0, 1.0);
            _2859 = (_15._m73.xyz * (1.0 - _2642)) + (((_15._m76.xyz * pow(clamp(dot(viewDirWS, _15._m75.xyz), 0.0, 1.0), _15._m76.w)) * (1.0 - clamp(exp2(-(_2617 * spvNMax(viewDistance - _15._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _2639));
            _2860 = _2642;
        }
        vec3 _2865 = (colorBeforeFog.xyz * (_2526 * _2860)) + ((((clamp(((_15._m68.xyz * (0.0596831031143665313720703125 * (1.0 + (_2529 * _2529)))) + _15._m70.xyz) + (_15._m69.xyz * ((1.0 - _2535) / spvNMax((12.56637096405029296875 * _2539) * sqrt(_2539), 0.001000000047497451305389404296875))), vec3(0.0), vec3(1.0)) * 255.0) * (vec3(1.0) - _2526)) * _2860) + _2859);
        finalColor = vec4(_2865.x, _2865.y, _2865.z, colorBeforeFog.w);
    }
    else
    {
        finalColor = colorBeforeFog;
    }
    // 最终 MRT 输出：lit color/alpha，以及编码后的 motion vector。
    outColor = finalColor;
    outMotionVector = motionOutput;
}

