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

layout(set = 0, binding = 3) uniform sampler _20;
layout(set = 0, binding = 5) uniform sampler _21;
layout(set = 0, binding = 4) uniform sampler _22;
layout(set = 0, binding = 6) uniform samplerShadow _23;
layout(set = 0, binding = 37) uniform texture2D _25;
layout(set = 0, binding = 20) uniform texture2D _36;
layout(set = 0, binding = 18) uniform texture2D _37;
layout(set = 0, binding = 28) uniform texture3D _39;
layout(set = 0, binding = 25) uniform texture3D _40;
layout(set = 0, binding = 27) uniform texture3D _41;
layout(set = 0, binding = 24) uniform texture3D _42;
layout(set = 0, binding = 26) uniform texture3D _43;
layout(set = 0, binding = 23) uniform texture3D _44;
layout(set = 1, binding = 7) uniform texture2D _47;
layout(set = 1, binding = 8) uniform texture2D _48;
layout(set = 1, binding = 5) uniform texture2D _49;
layout(set = 1, binding = 9) uniform texture2D _50;
layout(set = 1, binding = 3) uniform sampler _51;
layout(set = 1, binding = 6) uniform texture2D _52;
layout(set = 1, binding = 2) uniform sampler _53;
layout(set = 1, binding = 4) uniform texture2D _54;
layout(set = 1, binding = 1) uniform sampler _55;
layout(set = 0, binding = 22) uniform texture2D _56;
layout(set = 0, binding = 29) uniform texture3D _61;

layout(location = 0) in vec2 _3;
layout(location = 1) in vec3 _4;
layout(location = 2) in vec3 _5;
layout(location = 3) in vec4 _6;
layout(location = 4) in vec3 _7;
layout(location = 5) in vec3 _8;
layout(location = 8) flat in uint _10;
layout(location = 0) out vec4 _12;
layout(location = 1) out vec4 _13;

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
    float _357 = 1.0 / gl_FragCoord.w;
    vec3 _375 = mix(_15._m11.xyz - _4, vec3(_15._m0[2u].x, _15._m0[2u].y, _15._m0[2u].z), vec3(_15._m26.w));
    float _376 = dot(_375, _375);
    float _378 = inversesqrt(spvNMax(_376, 9.9999999392252902907785028219223e-09));
    vec3 _379 = _375 * _378;
    float _380 = _376 * _378;
    uint _383 = floatBitsToUint(_18._m0[_10]._m2.x);
    vec4 _405;
    vec4 _406;
    vec4 _407;
    if ((floatBitsToUint(_18._m0[_10]._m1.w) & 16u) != 0u)
    {
        _405 = _29._m0[_383 + 2u];
        _406 = _29._m0[_383 + 1u];
        _407 = _29._m0[_383];
    }
    else
    {
        _405 = _18._m0[_10]._m0[2];
        _406 = _18._m0[_10]._m0[1];
        _407 = _18._m0[_10]._m0[0];
    }
    vec4 _413 = texture(sampler2D(_50, _51), _3, _15._m38);
    vec3 _418 = _413.xyz * _46._m20.xyz;
    vec4 _422 = texture(sampler2D(_52, _53), _3, _15._m38);
    float _423 = _422.x;
    float _424 = _422.y;
    float _425 = _422.z;
    float _429 = _413.w * _46._m20.w;
    vec3 _447 = _418 * _46._m18;
    vec3 _451 = mix(vec3(dot(_447, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _447, vec3(_46._m19));
    vec4 _455 = texture(sampler2D(_54, _55), _3, _15._m38);
    vec2 _460 = (_455.xy * 2.0) - vec2(1.0);
    vec3 _461 = vec3(_460.x, _460.y, _341.z);
    vec2 _462 = _460.xy;
    _461.z = spvNMax(1.000000016862383526387164645044e-16, sqrt(1.0 - clamp(dot(_462, _462), 0.0, 1.0)));
    vec2 _470 = _461.xy * _46._m3;
    vec4 _481 = texture(sampler2D(_47, _51), (_3 * _46._m47.xy) + _46._m47.zw);
    vec3 _486 = _4 - vec3(_407.w, _343, _405.w);
    _486.y = 6.103515625e-05;
    vec3 _489 = normalize(_486);
    mat3 _498 = mat3(_6.xyz * 1.0, (cross(_5, _6.xyz) * _6.w) * 1.0, _5 * 1.0);
    vec3 _499 = _498 * vec3(_470.x, _470.y, _461.z);
    float _508 = gl_FrontFacing ? 1.0 : ((-1.0) + (2.0 * _46._m5));
    vec3 _509 = (_499 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_499, _499)))) * _508;
    vec3 _510 = normalize(_5) * _508;
    vec2 _515 = (_455.zw * 2.0) - vec2(1.0);
    vec3 _516 = vec3(_515.x, _515.y, _341.z);
    vec2 _517 = _515.xy;
    _516.z = spvNMax(1.000000016862383526387164645044e-16, sqrt(1.0 - clamp(dot(_517, _517), 0.0, 1.0)));
    vec2 _525 = _516.xy * _46._m27;
    vec3 _528 = normalize(_498 * vec3(_525.x, _525.y, _516.z));
    mat3 _535 = mat3(_407.xyz, _406.xyz, _405.xyz);
    vec3 _536 = vec3(_46._m35, 1.0, 0.0) * _535;
    vec3 _548 = cross(_528, mix(cross(_528, (_536 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_536, _536)))).xyz), _6.xyz, vec3(_423)).xyz) * mix(1.0, _6.w, _423);
    vec3 _550 = _535 * _379;
    float _559 = pow(clamp(dot(normalize((_535 * _528).xz), normalize(_550.xz)), 0.0, 1.0), _46._m33);
    vec2 _564 = gl_FragCoord.xy * _15._m22.zw;
    uvec2 _565 = uvec2(gl_FragCoord.xy);
    vec3 _575 = vec3(0.0, 0.0, 1.0) * mat3(_15._m1[0].xyz, _15._m1[1].xyz, _15._m1[2].xyz);
    float _583 = mix(_15._m44.x, 1.0, _15._m113.w) * _15._m42.x;
    vec4 _1077;
    vec3 _1078;
    vec3 _1079;
    float _1080;
    if (_15._m102.y < 0.5)
    {
        vec3 _601 = _4 - (_15._m126.xyz + (_575 * (-_15._m128.w)));
        float _615 = spvNMax(clamp((spvNMax(abs(_601.x), abs(_601.z)) - 464.0) * 0.03125, 0.0, 1.0), clamp((abs(_601.y) - 208.0) * 0.03125, 0.0, 1.0));
        vec4 _917;
        vec4 _918;
        vec4 _919;
        float _920;
        float _921;
        if ((_15._m126.w != 0.0) && (_615 < 1.0))
        {
            vec3 _628 = _4 - (_15._m126.xyz + (_575 * (-_15._m128.y)));
            float _642 = spvNMax(clamp((spvNMax(abs(_628.x), abs(_628.z)) - 29.0) * 0.5, 0.0, 1.0), clamp((abs(_628.y) - 13.0) * 0.5, 0.0, 1.0));
            float _718;
            vec4 _719;
            vec4 _720;
            vec4 _721;
            if (_642 < 1.0)
            {
                vec3 _651 = ((_4 * 2.0) + vec3(0.5)) * _15._m127.xyz;
                vec3 _653 = _651 - floor(_651);
                vec4 _657 = textureLod(sampler3D(_39, _22), _653, 0.0);
                float _658 = 1.0 - _642;
                float _662 = _15._m127.y * 0.5;
                float _667 = _653.x;
                float _668 = clamp(_653.y, _662, 1.0 - _662) * 0.3333333432674407958984375;
                float _669 = _653.z;
                vec4 _672 = textureLod(sampler3D(_40, _21), vec3(_667, _668, _669), 0.0);
                float _688 = _657.x;
                float _698 = _657.y;
                float _708 = _657.z;
                _718 = _615 + (_672.w * _658);
                _719 = vec4(((textureLod(sampler3D(_40, _21), vec3(_667, _668 + 0.666666686534881591796875, _669), 0.0).xyz * 4.0) - vec3(2.0)) * _708, _708) * _658;
                _720 = vec4(((textureLod(sampler3D(_40, _21), vec3(_667, _668 + 0.3333333432674407958984375, _669), 0.0).xyz * 4.0) - vec3(2.0)) * _698, _698) * _658;
                _721 = vec4(((_672.xyz * 4.0) - vec3(2.0)) * _688, _688) * _658;
            }
            else
            {
                _718 = _615;
                _719 = vec4(0.0);
                _720 = vec4(0.0);
                _721 = vec4(0.0);
            }
            vec3 _727 = _4 - (_15._m126.xyz + (_575 * (-_15._m128.z)));
            float _741 = spvNMax(clamp((spvNMax(abs(_727.x), abs(_727.z)) - 116.0) * 0.125, 0.0, 1.0), clamp((abs(_727.y) - 52.0) * 0.125, 0.0, 1.0));
            float _821;
            vec4 _822;
            vec4 _823;
            vec4 _824;
            if (_741 < 1.0)
            {
                vec3 _750 = ((_4 * 0.5) + vec3(0.5)) * _15._m127.xyz;
                vec3 _752 = _750 - floor(_750);
                vec4 _756 = textureLod(sampler3D(_41, _22), _752, 0.0);
                float _758 = _642 * (1.0 - _741);
                float _762 = _15._m127.y * 0.5;
                float _767 = _752.x;
                float _768 = clamp(_752.y, _762, 1.0 - _762) * 0.3333333432674407958984375;
                float _769 = _752.z;
                vec4 _772 = textureLod(sampler3D(_42, _21), vec3(_767, _768, _769), 0.0);
                float _788 = _756.x;
                float _799 = _756.y;
                float _810 = _756.z;
                _821 = _718 + (_772.w * _758);
                _822 = _719 + (vec4(((textureLod(sampler3D(_42, _21), vec3(_767, _768 + 0.666666686534881591796875, _769), 0.0).xyz * 4.0) - vec3(2.0)) * _810, _810) * _758);
                _823 = _720 + (vec4(((textureLod(sampler3D(_42, _21), vec3(_767, _768 + 0.3333333432674407958984375, _769), 0.0).xyz * 4.0) - vec3(2.0)) * _799, _799) * _758);
                _824 = _721 + (vec4(((_772.xyz * 4.0) - vec3(2.0)) * _788, _788) * _758);
            }
            else
            {
                _821 = _718;
                _822 = _719;
                _823 = _720;
                _824 = _721;
            }
            vec4 _907;
            vec4 _908;
            vec4 _909;
            float _910;
            if (_741 > 0.0)
            {
                vec3 _833 = ((_4 * 0.125) + vec3(0.5)) * _15._m127.xyz;
                vec3 _836 = _15._m127.xyz * 0.5;
                vec3 _838 = clamp(_833 - floor(_833), _836, vec3(1.0) - _836);
                vec4 _842 = textureLod(sampler3D(_43, _22), _838, 0.0);
                float _844 = _741 * (1.0 - _615);
                float _848 = _15._m127.y * 0.5;
                float _853 = _838.x;
                float _854 = clamp(_838.y, _848, 1.0 - _848) * 0.3333333432674407958984375;
                float _855 = _838.z;
                vec4 _858 = textureLod(sampler3D(_44, _21), vec3(_853, _854, _855), 0.0);
                float _874 = _842.x;
                float _885 = _842.y;
                float _896 = _842.z;
                _907 = _822 + (vec4(((textureLod(sampler3D(_44, _21), vec3(_853, _854 + 0.666666686534881591796875, _855), 0.0).xyz * 4.0) - vec3(2.0)) * _896, _896) * _844);
                _908 = _823 + (vec4(((textureLod(sampler3D(_44, _21), vec3(_853, _854 + 0.3333333432674407958984375, _855), 0.0).xyz * 4.0) - vec3(2.0)) * _885, _885) * _844);
                _909 = _824 + (vec4(((_858.xyz * 4.0) - vec3(2.0)) * _874, _874) * _844);
                _910 = _821 + (_858.w * _844);
            }
            else
            {
                _907 = _822;
                _908 = _823;
                _909 = _824;
                _910 = _821;
            }
            float _913 = clamp((_910 * 2.0) - 1.0, 0.0, 1.0);
            _917 = _907;
            _918 = _908;
            _919 = _909;
            _920 = _913 - _615;
            _921 = (_913 + _615) * 0.5;
        }
        else
        {
            _917 = vec4(0.0);
            _918 = vec4(0.0);
            _919 = vec4(0.0);
            _920 = 0.0;
            _921 = 1.0;
        }
        vec4 _941 = _919 + vec4(_15._m129.x * _921, (_15._m129.y * _921) + ((_15._m129.w * _920) * 0.5), _15._m129.z * _921, (_15._m129.w * _921) + ((_15._m129.y * _920) * 0.375));
        vec4 _961 = _918 + vec4(_15._m130.x * _921, (_15._m130.y * _921) + ((_15._m130.w * _920) * 0.5), _15._m130.z * _921, (_15._m130.w * _921) + ((_15._m130.y * _920) * 0.375));
        vec4 _981 = _917 + vec4(_15._m131.x * _921, (_15._m131.y * _921) + ((_15._m131.w * _920) * 0.5), _15._m131.z * _921, (_15._m131.w * _921) + ((_15._m131.y * _920) * 0.375));
        vec4 _985 = vec4(_509, 1.0);
        vec3 _991 = spvNMax(vec3(dot(_941, _985), dot(_961, _985), dot(_981, _985)), vec3(0.0)) * _583;
        vec3 _999 = ((_941.xyz * 0.2125999927520751953125) + (_961.xyz * 0.715200006961822509765625)) + (_981.xyz * 0.072200000286102294921875);
        vec3 _1003 = _999 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_999, _999)));
        float _1005 = abs(_1003.y);
        vec3 _1006 = _1003;
        _1006.y = _1005;
        vec4 _1007 = vec4(_1006.x, _1006.y, _1006.z, vec4(0.0).w);
        _1007.w = 1.0;
        vec4 _1011 = vec4(_1003.x, _1005, _1003.z, 1.0);
        vec3 _1016 = spvNMax(vec3(dot(_941, _1011), dot(_961, _1011), dot(_981, _1011)), vec3(0.0));
        float _1024 = _991.z;
        float _1025 = _991.y;
        vec4 _1030 = mix(vec4(_1024, _1025, -1.0, 0.666666686534881591796875), vec4(_1025, _1024, 0.0, -0.3333333432674407958984375), vec4(step(_1024, _1025)));
        float _1031 = _991.x;
        float _1032 = _1030.x;
        vec4 _1040 = mix(vec4(_1032, _1030.yw, _1031), vec4(_1031, _1030.yz, _1032), vec4(step(_1032, _1031)));
        float _1041 = _1040.x;
        float _1042 = _1040.w;
        float _1043 = _1040.y;
        float _1045 = _1041 - spvNMin(_1042, _1043);
        float _1055 = fract(abs(_1040.z + ((_1042 - _1043) / ((6.0 * _1045) + 9.9999997473787516355514526367188e-05))));
        float _1062 = spvNMin(_1045 / (_1041 + 9.9999997473787516355514526367188e-05), mix(0.699999988079071044921875, 0.3499999940395355224609375, smoothstep(0.449999988079071044921875, 0.3499999940395355224609375, abs(_1055 - 0.5))) * clamp(_1041, 0.0, 1.0));
        float _1064 = 2.0 / (2.0 - _1062);
        _1077 = _1007;
        _1078 = _991;
        _1079 = mix(vec3(1.0), clamp(abs((fract(vec3(_1055, _1062, _1064).xxx + vec3(1.0, 0.666666686534881591796875, 0.3333333432674407958984375)) * 6.0) - vec3(3.0)) - vec3(1.0), vec3(0.0), vec3(1.0)), vec3(_1062)) * _1064;
        _1080 = spvNMax(spvNMax(spvNMax(_1016.x, _1016.y), _1016.z), 0.0) * _583;
    }
    else
    {
        _1077 = vec4(0.0);
        _1078 = vec3(1.0);
        _1079 = _15._m103.xyz;
        _1080 = _583;
    }
    float _1102 = mix(_18._m0[_10]._m6.x, _15._m111.y, _15._m111.x);
    float _1117 = spvNMax(_18._m0[_10]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_18._m0[_10]._m6.z, _15._m111.w, _15._m111.x) - _4.y) * mix(_18._m0[_10]._m6.y, 1.0, _15._m111.x));
    float _1130;
    vec3 _1131;
    vec3 _1132;
    SPIRV_CROSS_BRANCH
    if ((_1102 + _1117) > 0.00999999977648258209228515625)
    {
        float _1122 = spvNMax(_1102, _1117);
        float _1123 = 1.0 - _1122;
        float _1125 = _1123 + (0.800000011920928955078125 * _1122);
        _1130 = _1123 + (2.0 * _1122);
        _1131 = _451 * _1125;
        _1132 = _418 * _1125;
    }
    else
    {
        _1130 = 1.0;
        _1131 = _451;
        _1132 = _418;
    }
    vec3 _1133 = _1132 * 0.959999978542327880859375;
    vec3 _1134 = vec3(0.039999999105930328369140625) * _424;
    vec3 _1135 = _1131 * 0.959999978542327880859375;
    vec2 _1148 = (_7.xy / vec2(spvNMax(_7.z, 9.9999999392252902907785028219223e-09))) - (_8.xy / vec2(spvNMax(_8.z, 9.9999999392252902907785028219223e-09)));
    _1148.y = -_1148.y;
    vec2 _1161 = ((sqrt(sqrt(abs(_1148 * 0.5))) * vec2(ivec2(sign(_1148)))) * 0.5) + vec2(0.5);
    vec4 _1162 = vec4(_1161.x, _1161.y, vec4(0.0).z, vec4(0.0).w);
    _1162.z = 1.0;
    _1162.w = 0.4000000059604644775390625;
    vec3 _1175 = mix(-_33._m0.xyz, _15._m112.xyz, vec3(_15._m102.w));
    vec3 _1179 = normalize(vec3(_1175.x, 6.103515625e-05, _1175.z));
    vec3 _1189 = mix(_33._m3.xyz, _15._m106.xyz, vec3(_15._m113.y));
    vec3 _1193 = _1189 * mix(_33._m3.w, 1.0, _15._m113.w);
    int _1197 = int(_565.x);
    int _1198 = int(_565.y);
    vec4 _1202 = texelFetch(_37, ivec3(_1197, _1198, 0).xy, 0);
    float _1207 = _1202.y;
    float _1210 = mix(mix(1.0, _1202.x, _35._m6.x), 1.0, _15._m102.z);
    float _1211 = dot(_509, _1175);
    vec3 _1218 = _1135 * _15._m101.z;
    vec3 _1219 = _1218 * 0.64999997615814208984375;
    float _1223 = dot(_1133, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625));
    float _1236 = clamp(-dot(_1179.xz, normalize(_575.xz)), 0.0, 1.0);
    float _1240 = 1.0 - _15._m113.x;
    vec4 _1254 = textureLod(sampler2D(_48, _21), vec2((clamp(mix(_1211, ((-_1211) * ((_1211 * 0.5) - 1.0)) + 0.5, (_1236 * smoothstep(0.25, 0.75, 1.0 - abs(_575.y))) * _1240) + (_15._m112.w * _15._m113.x), -1.0, 1.0) * 0.5) + 0.5, 0.5), 0.0);
    float _1255 = _1254.w;
    float _1257 = _1254.x;
    float _1258 = _1254.y;
    float _1259 = _1254.z;
    float _1264 = spvNMax(spvNMax(_1257, _1258), _1259) - spvNMin(spvNMin(_1257, _1258), _1259);
    vec4 _1272 = textureLod(sampler2D(_48, _21), vec2((dot(_509, _575) * 0.5) + 0.5, 0.5), 0.0);
    float _1273 = _1272.w;
    float _1274 = _425 * _1207;
    float _1281 = spvNMin(spvNMin(_1207, _425), _1255);
    float _1282 = _1273 * _1274;
    vec3 _1286 = vec3((clamp(dot(_509, _15._m107.xyz) + _15._m108.x, 0.0, 1.0) * _15._m108.y) + _15._m108.z) * mix(_1079, vec3(1.0), vec3(_15._m102.y * _1281));
    vec3 _1288 = vec3(_1281);
    vec3 _1311 = vec3(_1210);
    vec3 _1312 = mix((_1286 * mix(spvNMin(mix(0.64999997615814208984375, 1.0, _1080), 1.5), clamp(_1080, 1.25, 1.75), _15._m102.x)) * _15._m101.w, (mix(vec3(dot(_1193, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1193, _1288) + ((_1286 * clamp(_1080, 0.0, 1.5)) * (vec3(1.0 - _15._m113.y) + (_1189 * _15._m113.y)))) * _15._m101.y, _1311);
    vec3 _1313 = mix(mix(mix(vec3(dot(_1219, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1219, vec3(1.2000000476837158203125)), _1218, vec3(clamp((_1274 * _1273) + _1255, 0.0, 1.0))), _1133, _1288);
    vec3 _1319 = _1313 * (vec3(1.0 - _1264) + (_1254.xyz * _1264));
    vec3 _1328 = mix(mix(_1218, mix(vec3(_1223), _1133, vec3(1.2000000476837158203125)), vec3(_1282)), _1319 * clamp(dot(_1313, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)) * (1.0 / spvNMax(dot(_1319, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)), 0.001000000047497451305389404296875)), 0.0, 1.5), _1311);
    vec4 _1332 = vec4(_1328, _1210);
    float _1334 = mix(_1282, _1281, _1210);
    vec3 _1346 = vec3(_550.x, mix(0.5, _1175.y, _1210), _550.z) * _535;
    vec3 _1354 = normalize(_548 + (_528 * ((_46._m30 * 2.0) - 1.0)));
    vec3 _1355 = normalize((_1175 * _1210) + (vec3(_1346.x, _1346.y, _1346.z) * 2.0)) + _379;
    vec3 _1359 = _1355 * inversesqrt(spvNMax(6.103515625e-05, dot(_1355, _1355)));
    float _1360 = dot(_1354, _1359);
    vec3 _1368 = clamp(vec3(pow(spvNMax(sqrt(1.0 - (_1360 * _1360)), 9.9999997473787516355514526367188e-05), 200.0)) * _424, vec3(0.0), vec3(1.0));
    float _1371 = _559 * _559;
    vec3 _1381 = (_1368 * textureLod(sampler2D(_49, _21), vec2(_1368.x, float(_1360 > 0.0) * _1371), 0.0).xyz) * _559;
    float _1386 = spvNMax(spvNMax(_1381.x, _1381.y), _1381.z);
    float _1402 = dot(normalize(_548 + (_528 * ((_46._m31 * 2.0) - 1.0))), _1359);
    float _1442 = dot(normalize(_548 + (_528 * ((2.0 * _46._m40) - 1.0))), _1359);
    float _1456 = mix(1.0, mix(1.0, mix(mix(1.0 - _46._m42, 1.0, mix(ceil(clamp(fract(_3.x * _46._m39) - 0.5, 0.0, 1.0)), 1.0 - _481.x, _46._m44)), 1.0, _1386), clamp(pow(spvNMax(sqrt(1.0 - (_1442 * _1442)), 9.9999997473787516355514526367188e-05), float(int(200.0 * spvNMax(1.0 - _46._m41, 0.0)))), 0.0, 1.0)), _424);
    vec3 _1464 = (_1312 * _1328) * _1456;
    float _1473 = (1.0 - _46._m6) + (_429 * _46._m6);
    vec3 _1475 = (mix(vec3(dot(_1464, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1464, vec3(mix(_46._m43, 1.0, _1456))) * _1473) + (((((((_1381 * _1134) * _46._m32) * 5.0) * _1130) + mix(((vec3(pow(spvNMax(sqrt(1.0 - (_1402 * _1402)), 9.9999997473787516355514526367188e-05), float(int(200.0 * spvNMax(1.0 - _46._m34, 0.0))))) * _559) * (_46._m38.xyz * _422.w)) * _1130, vec3(0.0), vec3(_1386))) * ((_1312 * (((_1334 * 0.5) + 0.5) * mix(_15._m101.z, 1.0, _1334))) * 1.0)) * _15._m114.w);
    float _1476 = dot(_1475, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625));
    float _1479 = clamp(_1476 - 0.5, 0.0, 0.5);
    vec3 _1490 = normalize(cross(_575, vec3(_15._m110.xy, 0.0)));
    vec2 _1514 = normalize((_509 * mat3(_15._m0[0].xyz, _15._m0[1].xyz, _15._m0[2].xyz)).xy) * vec2(_15._m27.y / _15._m27.x, 1.0);
    vec2 _1520 = _15._m27.zw - vec2(1.0);
    vec2 _1521 = vec2(2.0) - _15._m27.zw;
    float _1555 = dot(_1179, _509);
    float _1566 = dot(_379, _509);
    float _1570 = 1.0 - _1210;
    vec3 _1597 = mix(vec3(_1476), _1475, vec3((_1479 * _1479) + 1.0)) + (((((_15._m109.xyz * smoothstep(0.100000001490116119384765625, 0.20000000298023223876953125, (1.0 / ((_15._m24.z * textureLod(sampler2D(_25, _20), clamp(_564 + ((_1514 * _15._m110.w) * 0.006000000052154064178466796875), _1520, _1521), 0.0).x) + _15._m24.w)) - _357)) * _15._m109.w) * spvNMin(spvNMin(clamp(dot(_489, _1490) + 1.0, 0.0, 1.0), _425), _1207)) * (mix(vec3(0.25), _1133, vec3(_15._m110.z)) * clamp(dot(_1490, _509), 0.0, 1.0))) + ((((((mix(_1078 * (1.0 / spvNMax(spvNMax(spvNMax(_1078.x, _1078.y), _1078.z) * 0.5, 1.0)), _1193, _1311) * clamp(mix(dot(_1077.xyz, _509) * _1077.w, ((-_1555) * ((_1555 * 0.5) - 1.0)) + 0.5, _1210), 0.0, 1.0)) * ((_1570 + (_1236 * _1210)) * _1240)) * smoothstep(0.60000002384185791015625, 0.800000011920928955078125, 1.0 - abs(_1566))) * spvNMin(_425, _1207)) * (_1570 + (smoothstep(0.100000001490116119384765625, 0.039999999105930328369140625, _1223) * _1210))) * spvNMax(vec3(0.1500000059604644775390625), _1133)));
    vec2 _1598 = vec2(_565);
    vec2 _1600 = floor(_1598 * 0.03125);
    int _1608 = int((_1600.x + (_1600.y * _31._m5)) * 8.0);
    float _1615 = floor(_357 - (_15._m25.y * _31._m11));
    float _1619 = clamp(_1615, 0.0, _31._m7 - 1.0);
    int _1621 = int(_1619 * 8.0);
    vec3 _1623;
    _1623 = _1597;
    vec3 _1624;
    SPIRV_CROSS_LOOP
    for (int _1626 = 0; _1626 <= 7; _1623 = _1624, _1626++)
    {
        uint _1644 = (_1615 <= _1619) ? (_27._m0[uint(_1608 + _1626)] & _27._m0[uint((_15._m43.y + _1621) + _1626)]) : 0u;
        uint _1645 = uint(_1626);
        _1624 = _1623;
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
            if (uint(_33._m6[_1675].w) == 1u)
            {
                uint _1690 = floatBitsToUint(_33._m6[_1675].x);
                uint _1697 = floatBitsToUint(_33._m6[_1675].y);
                uint _1704 = floatBitsToUint(_33._m6[_1675].z);
                uint _1711 = floatBitsToUint(_33._m6[_1678].x);
                uint _1718 = floatBitsToUint(_33._m6[_1678].y);
                uint _1725 = floatBitsToUint(_33._m6[_1678].z);
                vec3 _1744 = abs((mat4(vec4(unpackHalf2x16(_1690).x, unpackHalf2x16(_1704).x, unpackHalf2x16(_1718).x, 0.0), vec4(unpackHalf2x16(_1690 >> 16u).x, unpackHalf2x16(_1704 >> 16u).x, unpackHalf2x16(_1718 >> 16u).x, 0.0), vec4(unpackHalf2x16(_1697).x, unpackHalf2x16(_1711).x, unpackHalf2x16(_1725).x, 0.0), vec4(unpackHalf2x16(_1697 >> 16u).x, unpackHalf2x16(_1711 >> 16u).x, unpackHalf2x16(_1725 >> 16u).x, 0.0)) * vec4(_4 - _33._m6[_1663].xyz, 1.0)).xyz);
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
                    vec3 _1821 = _33._m6[_1663].xyz - _4;
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
                            vec4 _1983 = vec4(_4, 1.0) * _58._m1[_1902];
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
                        _2000 = _1894 * textureLod(sampler2D(_56, _21), _1993, 0.0).x;
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
                                _2434 = mix(_1624, _33._m6[_1660].xyz, vec3(_2001 * (_33._m6[_1672].x * ((1.0 - _33._m6[_1672].w) + (smoothstep(-0.5, 0.5, dot(_510, _1863)) * _33._m6[_1672].w)))));
                                break;
                            }
                            float _2021 = dot(_509, _1863);
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
                                    vec3 _2032 = _4 - _33._m6[_1663].xyz;
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
                                    vec3 _2082 = _4 - _33._m6[_1663].xyz;
                                    vec4 _2102 = vec4((_4 - ((_2082 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_2082, _2082)))) * _35._m10[_2074].x)) + (_510 * (_35._m10[_2074].y * 5.0)), 1.0) * _35._m9[_2074];
                                    vec3 _2106 = _2102.xyz / vec3(_2102.w);
                                    vec3 _2117 = _2106.xyz;
                                    bvec3 _2118 = lessThanEqual(_2117, vec3(0.0));
                                    bvec3 _2119 = greaterThanEqual(_2117, vec3(1.0));
                                    float _2122 = _2106.z;
                                    vec2 _2131 = ((_2106.xy * (_35._m11[_2074].zw - _35._m11[_2074].xy)) + _35._m11[_2074].xy).xy * _35._m12.zw;
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
                                    float _2294 = ((((((((_2217 * _2218) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2196, _340).xy, _2122), 0.0)) + ((_2220 * _2218) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2199, _340).xy, _2122), 0.0))) + ((_2222 * _2218) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2202, _340).xy, _2122), 0.0))) + ((_2217 * _2224) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2205, _340).xy, _2122), 0.0))) + ((_2220 * _2224) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2207, _340).xy, _2122), 0.0))) + ((_2222 * _2224) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2209, _340).xy, _2122), 0.0))) + ((_2217 * _2228) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2212, _340).xy, _2122), 0.0))) + ((_2220 * _2228) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2214, _340).xy, _2122), 0.0));
                                    _2308 = _2075 ? mix(1.0, (any(bvec3(_2118.x || _2119.x, _2118.y || _2119.y, _2118.z || _2119.z)) || ((floatBitsToUint(_2122) & 2147483647u) > 2139095040u)) ? 1.0 : (_2294 + ((_2222 * _2228) * textureLod(sampler2DShadow(_36, _23), vec3(vec3(_2216, _340).xy, _2122), 0.0))), _35._m10[_2074].w) : 1.0;
                                }
                                else
                                {
                                    _2308 = clamp(dot(_489, _1863) + 1.0, 0.0, 1.0);
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
                                vec3 _2375 = _1332.xyz;
                                _2382 = _2001;
                                _2383 = (_33._m6[_1660].xyz * ((1.0 - _33._m6[_1672].y) + ((1.0 / spvNMax(1.0, spvNMax(spvNMax(_2362.x, _2362.y), _2362.z) * mix(0.75, 0.5, _1570))) * _33._m6[_1672].y))) * mix(0.25 * _33._m6[_1672].x, 1.0, clamp(_2021 + 0.5, 0.0, 1.0));
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
                                    _2357 = _2001 * (smoothstep(0.100000001490116119384765625, 0.20000000298023223876953125, (1.0 / ((_15._m24.z * textureLod(sampler2D(_25, _20), clamp(_564 + ((_1514 * _33._m6[_1672].x) * 0.006000000052154064178466796875), _1520, _1521), 0.0).x) + _15._m24.w)) - _357) * _2309);
                                    _2358 = clamp(dot(_509, -normalize(cross(_575, cross(_575, _1863)))), 0.0, 1.0);
                                    _2359 = mix(vec3(0.5), _1133, vec3(_33._m6[_1672].y));
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
                                        _2329 = _1135 * _33._m6[_1672].y;
                                    }
                                    else
                                    {
                                        _2328 = _2022;
                                        _2329 = vec3(0.0);
                                    }
                                    _2357 = _2001;
                                    _2358 = _2328;
                                    _2359 = mix(vec3(0.0), _1133, bvec3(_2318));
                                    _2360 = _2329;
                                }
                                _2382 = _2357;
                                _2383 = _33._m6[_1660].xyz;
                                _2384 = _2358;
                                _2385 = _2359;
                                _2386 = _2360;
                            }
                            vec3 _2423;
                            SPIRV_CROSS_BRANCH
                            if (_1772 != 3u)
                            {
                                vec3 _2391 = _1863 + _379;
                                float _2396 = dot(_1354, _2391 * inversesqrt(spvNMax(6.103515625e-05, dot(_2391, _2391))));
                                vec3 _2404 = clamp(vec3(pow(spvNMax(sqrt(1.0 - (_2396 * _2396)), 9.9999997473787516355514526367188e-05), 200.0)) * _424, vec3(0.0), vec3(1.0));
                                _2423 = (((((((_2404 * textureLod(sampler2D(_49, _21), vec2(_2404.x, float(_2396 > 0.0) * _1371), 0.0).xyz) * _559) * _1134) * _46._m32) * 5.0) * _1130) * 1.0) * _33._m6[_1681].z;
                            }
                            else
                            {
                                _2423 = vec3(0.0);
                            }
                            vec3 _2426 = _2383 * _2382;
                            _2433 = _1624 + (((_2426 * mix(_2386, _2385, vec3(_2384))) * _1473) + ((_2426 * _2423) * _2384));
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
    vec3 _2476;
    SPIRV_CROSS_BRANCH
    if (_46._m12 > 0.5)
    {
        _2476 = mix(mix(vec3(0.5), mix(vec3(dot(_1623, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1623, vec3(_46._m14)), vec3(_46._m15)) * _46._m13, _46._m22.xyz, vec3(_46._m22.w)) + ((_46._m23.xyz * smoothstep(1.0 - _46._m16, 1.0, 1.0 - clamp(_1566, 0.0, 1.0))) * _46._m17);
    }
    else
    {
        _2476 = _1623;
    }
    vec4 _2482 = vec4(_2476 / vec3(_15._m42.x), _429);
    _2482.w = (_46._m8 == 1.0) ? _429 : 1.0;
    vec4 _2867;
    SPIRV_CROSS_BRANCH
    if (_15._m113.w < 0.5)
    {
        vec3 _2491 = -_379;
        float _2507 = _4.y * _15._m68.w;
        float _2512 = spvNMax(0.00999999977648258209228515625, _2507 + _15._m69.w);
        vec3 _2526 = exp(_15._m67.xyz * ((-spvNMax(0.0, (_380 * _15._m66.w) - _15._m65.w)) * (((1.0 - exp(-_2512)) / _2512) * exp(_2507 + _15._m70.w))));
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
            vec3 _2730 = _4 - _15._m11.xyz;
            float _2732 = (_15._m77.w * ((_2723 > 5.9604644775390625e-08) ? (1.0 / _2723) : 0.0)) * (1.0 / _380);
            float _2733 = _2730.y;
            float _2734 = _2732 * _2733;
            float _2736 = _15._m11.y + _2734;
            float _2737 = _2733 - _2734;
            float _2739 = (1.0 - _2732) * _380;
            float _2753 = spvNMax(-127.0, _15._m71.z * _2737);
            float _2777 = spvNMax(-127.0, _15._m74.x * _2737);
            float _2788 = ((_15._m71.y * exp2(-spvNMax(-127.0, _15._m71.z * (_2736 - _15._m71.x)))) * ((abs(_2753) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2753)) / _2753) : (0.693147182464599609375 - (0.2402265071868896484375 * _2753)))) + ((_15._m74.y * exp2(-spvNMax(-127.0, _15._m74.x * (_2736 - _15._m74.z)))) * ((abs(_2777) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2777)) / _2777) : (0.693147182464599609375 - (0.2402265071868896484375 * _2777))));
            float _2810 = clamp((_380 * _15._m72.w) + _15._m72.z, 0.0, 1.0);
            float _2813 = clamp((spvNMax(clamp(exp2(-(_2788 * _2739)), 0.0, 1.0), _15._m73.w) + clamp((_380 * _15._m72.y) + _15._m72.x, 0.0, 1.0)) + _2810, 0.0, 1.0);
            vec4 _2853 = mix(vec4(0.0, 0.0, 0.0, 1.0), textureLod(sampler3D(_61, _21), vec3((_1598 + ((((vec3(uvec3(_2701, _2697 + (_2699 * _2701), _344) >> uvec3(16u)) * vec3(1.525902189314365386962890625e-05)) * 2.0) - vec3(1.0)) * _15._m81.w).xy) * _15._m79.xy, (log2((_357 * _15._m78.x) + _15._m78.y) * _15._m78.z) / _15._m77.z), 0.0), vec4(clamp((_357 - _15._m80.z) * 1000000.0, 0.0, 1.0)));
            _2859 = _2853.xyz + (((_15._m73.xyz * (1.0 - _2813)) + (((_15._m76.xyz * pow(clamp(dot(_379, _15._m75.xyz), 0.0, 1.0), _15._m76.w)) * (1.0 - clamp(exp2(-(_2788 * spvNMax(_2739 - _15._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _2810))) * _2853.w);
            _2860 = _2853.w * _2813;
        }
        else
        {
            vec3 _2566 = _4 - _15._m11.xyz;
            float _2568 = _2566.y;
            float _2582 = spvNMax(-127.0, _15._m71.z * _2568);
            float _2606 = spvNMax(-127.0, _15._m74.x * _2568);
            float _2617 = ((_15._m71.y * exp2(-spvNMax(-127.0, _15._m71.z * (_15._m11.y - _15._m71.x)))) * ((abs(_2582) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2582)) / _2582) : (0.693147182464599609375 - (0.2402265071868896484375 * _2582)))) + ((_15._m74.y * exp2(-spvNMax(-127.0, _15._m74.x * (_15._m11.y - _15._m74.z)))) * ((abs(_2606) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2606)) / _2606) : (0.693147182464599609375 - (0.2402265071868896484375 * _2606))));
            float _2639 = clamp((_380 * _15._m72.w) + _15._m72.z, 0.0, 1.0);
            float _2642 = clamp((spvNMax(clamp(exp2(-(_2617 * _380)), 0.0, 1.0), _15._m73.w) + clamp((_380 * _15._m72.y) + _15._m72.x, 0.0, 1.0)) + _2639, 0.0, 1.0);
            _2859 = (_15._m73.xyz * (1.0 - _2642)) + (((_15._m76.xyz * pow(clamp(dot(_379, _15._m75.xyz), 0.0, 1.0), _15._m76.w)) * (1.0 - clamp(exp2(-(_2617 * spvNMax(_380 - _15._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _2639));
            _2860 = _2642;
        }
        vec3 _2865 = (_2482.xyz * (_2526 * _2860)) + ((((clamp(((_15._m68.xyz * (0.0596831031143665313720703125 * (1.0 + (_2529 * _2529)))) + _15._m70.xyz) + (_15._m69.xyz * ((1.0 - _2535) / spvNMax((12.56637096405029296875 * _2539) * sqrt(_2539), 0.001000000047497451305389404296875))), vec3(0.0), vec3(1.0)) * 255.0) * (vec3(1.0) - _2526)) * _2860) + _2859);
        _2867 = vec4(_2865.x, _2865.y, _2865.z, _2482.w);
    }
    else
    {
        _2867 = _2482;
    }
    _12 = _2867;
    _13 = _1162;
}

