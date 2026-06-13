#version 460
#extension GL_EXT_spirv_intrinsics : require

// 说明：
// 这是 zhouxue_outline_vs.glsl 的逐句整理版。
// 由于只允许参考源 shader，无法确认引擎侧常量缓冲的真实字段名；
// 因此 uniform/storage buffer 内部仍保留反编译字段名，并在使用处用语义化局部变量解释。

struct InstanceBlock
{
    mat4 objectToWorldRows;   // _m0：实例的物体到世界矩阵，按行向量使用。
    vec4 flags;               // _m1：w 内包含蒙皮信息/开关位。
    vec4 skinOffsets;         // _m2：x/y 是蒙皮矩阵数据起始偏移。
    mat4 outlineObjectRows;   // _m3：描边/代理空间使用的另一套实例矩阵。
    vec4 outlineSwitch;       // _m4：x 控制使用蒙皮后位置还是原位置。
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
};

layout(set = 0, binding = 14, std140) uniform GlobalUniforms
{
    layout(row_major) mat4 _m0;
    layout(row_major) mat4 _m1;
    layout(row_major) mat4 _m2;    // 投影参数；本 shader 使用 [1].y、[2].z、[2].w。
    layout(row_major) mat4 _m3;
    layout(row_major) mat4 _m4;
    layout(row_major) mat4 _m5;
    layout(row_major) mat4 _m6;
    layout(row_major) mat4 _m7;
    layout(row_major) mat4 _m8;    // ViewProjection 或等价裁剪空间矩阵。
    layout(row_major) mat4 _m9;
    layout(row_major) mat4 _m10;
    vec4 _m11;                     // 相机/世界偏移，xyz 被用作相对世界坐标原点。
    layout(row_major) mat4 _m12;
    layout(row_major) mat4 _m13;
    layout(row_major) mat4 _m14;
    layout(row_major) mat4 _m15;   // 第二套裁剪空间矩阵，用于 _17 输出。
    layout(row_major) mat4 _m16;
    layout(row_major) mat4 _m17;
    layout(row_major) mat4 _m18;
    layout(row_major) mat4 _m19;
    layout(row_major) mat4 _m20;
    vec4 _m21;                     // 第二套空间的相对原点。
    vec4 _m22;
    vec4 _m23;                     // xy：屏幕尺寸/比例相关；zw：描边偏移上限。
    vec4 _m24;
    vec4 _m25;                     // z：非透视深度偏移缩放。
    vec4 _m26;                     // w：深度写法分支。
    vec4 _m27;
    vec4 _m28[6];
    vec4 _m29[6];
    vec4 _m30;
    vec4 _m31;                     // zw：裁剪空间屏幕偏移。
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
} globals;

layout(set = 2, binding = 0, std140) uniform InstanceUniforms
{
    layout(row_major) InstanceBlock instances[256];
} instanceUniforms;

layout(set = 0, binding = 16, std430) readonly buffer SkinningBuffer
{
    vec4 rows[];
} skinningBuffer;

layout(set = 1, binding = 0, std140) uniform MaterialUniforms
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
    vec4 _m24;     // UV 缩放偏移，xy 为 scale，zw 为 offset。
    vec4 _m25;
    float _m26;    // 描边宽度系数。
    float _m27;    // 深度偏移系数。
    float _m28;
    float _m29;
    float _m30;    // 是否从 _7 重建切线空间法线。
    float _m31;
    float _m32;
    float _m33;
    vec4 _m34;
    vec4 _m35;
    vec4 _m36;
    vec4 _m37;
    vec4 _m38;
    float _m39;
    float _m40;
    float _m41;
    float _m42;
    float _m43;
    float _m44;
    float _m45;
    float _m46;
} material;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec2 inUv;
layout(location = 2) in vec3 inNormalOrPackedData;
layout(location = 3) in vec4 inTangent;
layout(location = 4) in vec2 inDetailNormalXY;
layout(location = 5) in vec4 inAuxPosition;
layout(location = 6) in vec4 inBlendWeights;
layout(location = 7) in uvec4 inBlendIndices;

layout(location = 0) out vec2 outUv;
layout(location = 1) out vec3 outWorldPosition;
layout(location = 2) out vec3 outOutlineNormal;
layout(location = 4) out vec3 outClipPositionA;
layout(location = 5) out vec3 outClipPositionB;
layout(location = 6) flat out uint outInstanceIndex;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

vec3 safeNormalize(vec3 value)
{
    // NMax 避免零长度向量触发除零；常量是 float 最小正规数。
    return value * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(value, value)));
}

void decodePackedNormalAndTangent(
    vec3 normalOrPackedData,
    vec4 sourceTangent,
    out vec3 decodedNormal,
    out vec4 decodedTangent)
{
    // x 的 bit30 作为压缩标记；未压缩时直接使用输入法线/切线。
    uint packedBits = floatBitsToUint(normalOrPackedData.x);
    bool hasPackedBasis = (packedBits & 1073741824u) > 0u;

    if (!hasPackedBasis)
    {
        decodedNormal = normalOrPackedData;
        decodedTangent = sourceTangent;
        return;
    }

    // 每 10 bit 存一个有符号量：normal.x、normal.y、tangent 旋转参数。
    float packedNormalX = float((packedBits << 22u) >> 22u);
    float packedNormalY = float((packedBits << 12u) >> 22u);
    float packedTangentAngle = float((packedBits << 2u) >> 22u);

    // 10 bit 有符号数范围还原到 [-512, 511]，再缩放到约 [-1, 1]。
    vec2 octNormalXY = vec2(
        (packedNormalX >= 512.0) ? (packedNormalX - 1024.0) : packedNormalX,
        (packedNormalY >= 512.0) ? (packedNormalY - 1024.0) : packedNormalY
    ) * 0.001956947147846221923828125;

    // Octahedral normal decoding：先补 z，再把负半球折回。
    float octNormalZ = (1.0 - abs(octNormalXY.x)) - abs(octNormalXY.y);
    vec3 foldedNormal = vec3(octNormalXY, octNormalZ);
    vec2 unfoldedXY = mix(
        foldedNormal.xy,
        (vec2(1.0) - abs(foldedNormal.yx)) * ((step(vec2(0.0), foldedNormal.xy) * 2.0) - vec2(1.0)),
        bvec2(octNormalZ < 0.0)
    );
    decodedNormal = normalize(vec3(unfoldedXY, foldedNormal.z));

    // 第三个 10 bit 分量控制切线在法线垂直平面中的方向。
    float signedTangentValue = ((packedTangentAngle >= 512.0) ? (packedTangentAngle - 1024.0) : packedTangentAngle) *
        0.001956947147846221923828125;

    // 构造一个与法线不共线的参考向量，再投影到法线垂直平面得到 tangentBasisX。
    vec3 shiftedNormalDifference = decodedNormal.yzx - decodedNormal.zxy;
    vec3 tangentBasisX = normalize(shiftedNormalDifference - vec3(dot(shiftedNormalDifference, decodedNormal)));
    vec3 tangentBasisY = normalize(cross(decodedNormal, tangentBasisX));

    // 把一维参数展开成单位圆附近的二维方向，用于混合两条切线基。
    float tangentSign = (signedTangentValue < 0.0) ? -1.0 : 1.0;
    float tangentX = 1.0 - ((signedTangentValue * tangentSign) * 2.0);
    vec2 tangentCircle = normalize(vec2(tangentX, tangentSign * (1.0 - abs(tangentX))));
    vec3 tangentXYZ = mat2x3(tangentBasisX, tangentBasisY) * tangentCircle;

    decodedTangent = vec4(tangentXYZ, (float((packedBits >> 31u) & 1u) * 2.0) - 1.0);
}

void main()
{
    uint instanceIndex = uint(gl_InstanceIndex);
    InstanceBlock instanceData = instanceUniforms.instances[instanceIndex];

    vec3 objectNormal;
    vec4 objectTangent;
    decodePackedNormalAndTangent(inNormalOrPackedData, inTangent, objectNormal, objectTangent);

    // 默认路径：不蒙皮时直接使用顶点属性。
    vec4 skinnedTangent = objectTangent;
    vec3 skinnedNormal = objectNormal;
    vec3 skinnedPosition = inPosition;
    vec3 skinnedAuxPosition = inAuxPosition.xyz;

    // flags.w 的 bit5 表示启用蒙皮；清除 bit4 后的值表示有效骨骼数量/模式。
    vec4 localPosition4 = vec4(inPosition, 1.0);
    uint skinFlags = floatBitsToUint(instanceData.flags.w);
    uint skinInfluenceMode = skinFlags & 4294967247u;
    bool shouldSkin = ((skinFlags & 32u) != 0u) && (skinInfluenceMode != 0u);

    if (shouldSkin)
    {
        // 每根骨骼在 buffer 中占 3 行；两套偏移分别用于位置/辅助位置两组矩阵。
        uvec4 skinRowStride = inBlendIndices * uvec4(3u);
        uvec4 primaryBoneRows = uvec4(floatBitsToUint(instanceData.skinOffsets.x) + 3u) + skinRowStride;
        uvec4 auxBoneRows = uvec4(floatBitsToUint(instanceData.skinOffsets.y) + 3u) + skinRowStride;

        uint primary0 = primaryBoneRows.x;
        uint primary0Row1 = primary0 + 1u;
        uint primary0Row2 = primary0 + 2u;
        uint aux0 = auxBoneRows.x;
        uint aux0Row1 = aux0 + 1u;
        uint aux0Row2 = aux0 + 2u;

        vec4 auxSkinRow2;
        vec4 auxSkinRow1;
        vec4 auxSkinRow0;
        vec4 primarySkinRow2;
        vec4 primarySkinRow1;
        vec4 primarySkinRow0;

        if (skinInfluenceMode >= 2u)
        {
            // 前两个骨骼权重混合。
            uint primary1 = primaryBoneRows.y;
            uint aux1 = auxBoneRows.y;
            auxSkinRow2 = (skinningBuffer.rows[aux0Row2] * inBlendWeights.x) + (skinningBuffer.rows[aux1 + 2u] * inBlendWeights.y);
            auxSkinRow1 = (skinningBuffer.rows[aux0Row1] * inBlendWeights.x) + (skinningBuffer.rows[aux1 + 1u] * inBlendWeights.y);
            auxSkinRow0 = (skinningBuffer.rows[aux0] * inBlendWeights.x) + (skinningBuffer.rows[aux1] * inBlendWeights.y);
            primarySkinRow2 = (skinningBuffer.rows[primary0Row2] * inBlendWeights.x) + (skinningBuffer.rows[primary1 + 2u] * inBlendWeights.y);
            primarySkinRow1 = (skinningBuffer.rows[primary0Row1] * inBlendWeights.x) + (skinningBuffer.rows[primary1 + 1u] * inBlendWeights.y);
            primarySkinRow0 = (skinningBuffer.rows[primary0] * inBlendWeights.x) + (skinningBuffer.rows[primary1] * inBlendWeights.y);
        }
        else
        {
            // 单骨骼路径：直接取第一个骨骼的三行矩阵。
            auxSkinRow2 = skinningBuffer.rows[aux0Row2];
            auxSkinRow1 = skinningBuffer.rows[aux0Row1];
            auxSkinRow0 = skinningBuffer.rows[aux0];
            primarySkinRow2 = skinningBuffer.rows[primary0Row2];
            primarySkinRow1 = skinningBuffer.rows[primary0Row1];
            primarySkinRow0 = skinningBuffer.rows[primary0];
        }

        vec4 finalAuxSkinRow2;
        vec4 finalAuxSkinRow1;
        vec4 finalAuxSkinRow0;
        vec4 finalPrimarySkinRow2;
        vec4 finalPrimarySkinRow1;
        vec4 finalPrimarySkinRow0;

        if (skinInfluenceMode >= 4u)
        {
            // 四骨骼路径：继续叠加第三、第四个骨骼权重。
            uint primary2 = primaryBoneRows.z;
            uint primary3 = primaryBoneRows.w;
            uint aux2 = auxBoneRows.z;
            uint aux3 = auxBoneRows.w;
            finalAuxSkinRow2 = auxSkinRow2 + ((skinningBuffer.rows[aux2 + 2u] * inBlendWeights.z) + (skinningBuffer.rows[aux3 + 2u] * inBlendWeights.w));
            finalAuxSkinRow1 = auxSkinRow1 + ((skinningBuffer.rows[aux2 + 1u] * inBlendWeights.z) + (skinningBuffer.rows[aux3 + 1u] * inBlendWeights.w));
            finalAuxSkinRow0 = auxSkinRow0 + ((skinningBuffer.rows[aux2] * inBlendWeights.z) + (skinningBuffer.rows[aux3] * inBlendWeights.w));
            finalPrimarySkinRow2 = primarySkinRow2 + ((skinningBuffer.rows[primary2 + 2u] * inBlendWeights.z) + (skinningBuffer.rows[primary3 + 2u] * inBlendWeights.w));
            finalPrimarySkinRow1 = primarySkinRow1 + ((skinningBuffer.rows[primary2 + 1u] * inBlendWeights.z) + (skinningBuffer.rows[primary3 + 1u] * inBlendWeights.w));
            finalPrimarySkinRow0 = primarySkinRow0 + ((skinningBuffer.rows[primary2] * inBlendWeights.z) + (skinningBuffer.rows[primary3] * inBlendWeights.w));
        }
        else
        {
            finalAuxSkinRow2 = auxSkinRow2;
            finalAuxSkinRow1 = auxSkinRow1;
            finalAuxSkinRow0 = auxSkinRow0;
            finalPrimarySkinRow2 = primarySkinRow2;
            finalPrimarySkinRow1 = primarySkinRow1;
            finalPrimarySkinRow0 = primarySkinRow0;
        }

        // 用蒙皮矩阵的 3x3 部分变换切线和法线。
        vec3 tangentXYZ = objectTangent.xyz;
        vec3 skinnedTangentXYZ = vec3(
            dot(finalPrimarySkinRow0.xyz, tangentXYZ),
            dot(finalPrimarySkinRow1.xyz, tangentXYZ),
            dot(finalPrimarySkinRow2.xyz, tangentXYZ)
        );
        skinnedTangent = vec4(skinnedTangentXYZ, objectTangent.w);

        skinnedNormal = vec3(
            dot(finalPrimarySkinRow0.xyz, objectNormal),
            dot(finalPrimarySkinRow1.xyz, objectNormal),
            dot(finalPrimarySkinRow2.xyz, objectNormal)
        );

        // 用蒙皮矩阵完整行变换顶点位置，以及另一套辅助位置。
        skinnedPosition = vec3(
            dot(finalPrimarySkinRow0, localPosition4),
            dot(finalPrimarySkinRow1, localPosition4),
            dot(finalPrimarySkinRow2, localPosition4)
        );
        skinnedAuxPosition = vec3(
            dot(finalAuxSkinRow0, localPosition4),
            dot(finalAuxSkinRow1, localPosition4),
            dot(finalAuxSkinRow2, localPosition4)
        );
    }

    // 实例矩阵前三行的 xyz 组成旋转缩放部分，w 组成平移。
    mat3 objectToWorld3x3 = mat3(
        instanceData.objectToWorldRows[0].xyz,
        instanceData.objectToWorldRows[1].xyz,
        instanceData.objectToWorldRows[2].xyz
    );
    vec3 objectToWorldTranslation = vec3(
        instanceData.objectToWorldRows[0].w,
        instanceData.objectToWorldRows[1].w,
        instanceData.objectToWorldRows[2].w
    );

    // 转到相对世界空间，再乘全局矩阵得到裁剪空间。
    vec3 relativeWorldPosition = (skinnedPosition * objectToWorld3x3) + (objectToWorldTranslation - globals._m11.xyz);
    vec4 clipPosition = vec4(relativeWorldPosition, 1.0) * globals._m8;
    float clipW = clipPosition.w;

    // 法线和切线进入世界/视图相关空间。
    vec3 worldNormalRaw = skinnedNormal * objectToWorld3x3;
    vec3 worldNormal = safeNormalize(worldNormalRaw);
    vec3 worldTangentRaw = skinnedTangent.xyz * objectToWorld3x3;

    // 第二套矩阵输出，供片元阶段或额外效果使用。
    mat3 outlineObject3x3 = mat3(
        instanceData.outlineObjectRows[0].xyz,
        instanceData.outlineObjectRows[1].xyz,
        instanceData.outlineObjectRows[2].xyz
    );
    vec3 outlineObjectTranslation = vec3(
        instanceData.outlineObjectRows[0].w,
        instanceData.outlineObjectRows[1].w,
        instanceData.outlineObjectRows[2].w
    );
    vec3 outlineSourcePosition = mix(skinnedAuxPosition.xyz, skinnedPosition, bvec3(instanceData.outlineSwitch.x < 1.0));
    vec3 relativeOutlinePosition = (outlineSourcePosition * outlineObject3x3) + (outlineObjectTranslation - globals._m21.xyz);
    vec4 outlineClipPosition = vec4(relativeOutlinePosition, 1.0) * globals._m15;

    vec3 outlineNormal;
    if (material._m30 > 0.5)
    {
        // 从输入的 xy 重建一个切线空间法线，z 保证单位半球。
        vec3 tangentSpaceNormal = vec3(inDetailNormalXY, 0.0);
        vec2 tangentNormalXY = tangentSpaceNormal.xy;
        tangentSpaceNormal.z = sqrt(1.0 - clamp(dot(tangentNormalXY, tangentNormalXY), 0.0, 1.0));

        // 构造 TBN：切线、带 handedness 的副切线、法线。
        vec3 worldTangent = vec4(safeNormalize(worldTangentRaw), skinnedTangent.w).xyz;
        vec3 worldBitangent = cross(worldNormal, worldTangent) * skinnedTangent.w;
        outlineNormal = mat3(worldTangent, worldBitangent, worldNormal) * tangentSpaceNormal;
    }
    else
    {
        // 未启用细节法线时，直接沿世界法线外扩描边。
        outlineNormal = worldNormal;
    }

    // 根据投影矩阵估计垂直 FOV 的半角。源 shader 用多项式近似 atan。
    float inverseProjectionY = (-1.0) / globals._m2[1].y;
    float absInverseProjectionY = abs(inverseProjectionY);
    bool atanInputIsSmall = absInverseProjectionY < 1.0;
    float atanInput = atanInputIsSmall ? absInverseProjectionY : (1.0 / absInverseProjectionY);
    float atanInputSq = atanInput * atanInput;
    float atanApproxSmall = (1.0 + (((-0.3018949925899505615234375) + (0.087292902171611785888671875 * atanInputSq)) * atanInputSq)) * atanInput;
    float halfFov = atanInputIsSmall ? atanApproxSmall : (1.57079637050628662109375 - atanApproxSmall);
    float signedHalfFov = (inverseProjectionY < 0.0) ? (-halfFov) : halfFov;

    // 把描边法线投影到屏幕方向，并按宽度、FOV、距离做缩放。
    mat3 clipNormalMatrix = mat3(globals._m8[0].xyz, globals._m8[1].xyz, globals._m8[2].xyz);
    vec2 projectedNormalDir = normalize((outlineNormal * clipNormalMatrix).xy);
    vec2 aspectCorrectedDir = projectedNormalDir * vec2(globals._m23.y / globals._m23.x, 1.0);
    float fovScale = material._m26 * (0.3926990330219268798828125 / signedHalfFov);
    float distanceFade = clamp((clipW * (signedHalfFov * 114.5915679931640625)) * 0.039999999105930328369140625, 0.0, 1.0);
    vec2 rawOutlineOffset = ((aspectCorrectedDir * fovScale) * distanceFade) * 0.004999999888241291046142578125;

    // 源逻辑在偏移过小时把它抬到和深度相关的屏幕空间下限。
    vec2 minOutlineOffset = globals._m23.zw * clamp(clipW, 0.0, 1.57079613208770751953125 / signedHalfFov);
    vec2 adjustedOutlineOffset = mix(
        rawOutlineOffset,
        minOutlineOffset * vec2(ivec2(sign(rawOutlineOffset))),
        lessThan(abs(rawOutlineOffset), minOutlineOffset)
    );

    // 应用屏幕偏移和描边偏移。
    vec2 clipXYWithGlobalOffset = (clipPosition.xy - ((globals._m31.zw * vec2(2.0, -2.0)) * clipW)).xy + adjustedOutlineOffset;
    vec4 finalClipPosition = vec4(clipXYWithGlobalOffset, clipPosition.z, clipPosition.w);

    vec4 depthAdjustedClipPosition;
    if (globals._m26.w == 0.0)
    {
        // 透视路径：把深度向摄像机方向稍微推开，减少描边与本体的深度冲突。
        float shiftedViewZ = (-clipW) + (material._m27 * (-0.100000001490116119384765625));
        depthAdjustedClipPosition = finalClipPosition;
        depthAdjustedClipPosition.z = (((shiftedViewZ * globals._m2[2].z) + globals._m2[2].w) * clipW) / (-shiftedViewZ);
    }
    else
    {
        // 非透视/特殊投影路径：直接在裁剪空间 z 上做常量偏移。
        depthAdjustedClipPosition = finalClipPosition;
        depthAdjustedClipPosition.z = clipPosition.z + ((material._m27 * (-0.100000001490116119384765625)) / globals._m25.z);
    }

    vec2 clipAWithOutline = clipPosition.xy + adjustedOutlineOffset;
    vec2 clipBWithOutline = outlineClipPosition.xy + adjustedOutlineOffset;

    outUv = (inUv * material._m24.xy) + material._m24.zw;
    outWorldPosition = relativeWorldPosition + globals._m11.xyz;
    outOutlineNormal = outlineNormal;
    outClipPositionA = vec3(clipAWithOutline, clipPosition.w);
    outClipPositionB = vec3(clipBWithOutline, outlineClipPosition.w);

    // Vulkan 风格裁剪空间转目标平台所需的 y 翻转。
    depthAdjustedClipPosition.y = -depthAdjustedClipPosition.y;
    gl_Position = depthAdjustedClipPosition;

    outInstanceIndex = instanceIndex;
}
