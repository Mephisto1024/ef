#version 460
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_samplerless_texture_functions : require
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

struct _15
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

float _286;
float _288;
uint _289;

layout(set = 0, binding = 14, std140) uniform _12_13
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
} _13;

layout(set = 2, binding = 0, std140) uniform _14_16
{
    layout(row_major) _15 _m0[256];
} _16;

layout(set = 0, binding = 40, std430) readonly buffer _22_23
{
    uint _m0[];
} _23;

layout(set = 0, binding = 16, std430) readonly buffer _24_25
{
    vec4 _m0[];
} _25;

layout(set = 0, binding = 38, std140) uniform _26_27
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
} _27;

layout(set = 0, binding = 12, std140) uniform _28_29
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
    vec4 _m4;
    uvec4 _m5;
    vec4 _m6[2048];
} _29;

layout(set = 0, binding = 13, std140) uniform _30_31
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
} _31;

layout(set = 1, binding = 0, std140) uniform _41_42
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
} _42;

layout(set = 0, binding = 5) uniform sampler _18;
layout(set = 0, binding = 4) uniform sampler _19;
layout(set = 0, binding = 6) uniform samplerShadow _20;
layout(set = 0, binding = 20) uniform texture2D _32;
layout(set = 0, binding = 18) uniform texture2D _33;
layout(set = 0, binding = 28) uniform texture3D _35;
layout(set = 0, binding = 25) uniform texture3D _36;
layout(set = 0, binding = 27) uniform texture3D _37;
layout(set = 0, binding = 24) uniform texture3D _38;
layout(set = 0, binding = 26) uniform texture3D _39;
layout(set = 0, binding = 23) uniform texture3D _40;
layout(set = 1, binding = 2) uniform texture2D _43;
layout(set = 0, binding = 30) uniform texture2D _44;
layout(set = 1, binding = 3) uniform texture2D _45;
layout(set = 1, binding = 1) uniform sampler _46;
layout(set = 0, binding = 29) uniform texture3D _47;

layout(location = 0) in vec2 _3;
layout(location = 1) in vec3 _4;
layout(location = 2) in vec3 _5;
layout(location = 4) in vec3 _6;
layout(location = 5) in vec3 _7;
layout(location = 6) flat in uint _9;
layout(location = 0) out vec4 _10;
layout(location = 1) out vec4 _11;

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
    float _298 = 1.0 / gl_FragCoord.w;
    vec3 _315 = mix(_13._m11.xyz - _4, vec3(_13._m0[2u].x, _13._m0[2u].y, _13._m0[2u].z), vec3(_13._m26.w));
    float _316 = dot(_315, _315);
    float _318 = inversesqrt(spvNMax(_316, 9.9999999392252902907785028219223e-09));
    vec3 _319 = _315 * _318;
    float _320 = _316 * _318;
    uint _323 = floatBitsToUint(_16._m0[_9]._m2.x);
    vec4 _341;
    vec4 _342;
    if ((floatBitsToUint(_16._m0[_9]._m1.w) & 16u) != 0u)
    {
        _341 = _25._m0[_323 + 2u];
        _342 = _25._m0[_323];
    }
    else
    {
        _341 = _16._m0[_9]._m0[2];
        _342 = _16._m0[_9]._m0[0];
    }
    vec4 _348 = texture(sampler2D(_45, _46), _3, _13._m38);
    vec3 _372 = (_348.xyz * _42._m20.xyz) * _42._m28;
    vec3 _377 = mix(mix(vec3(dot(_372, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _372, vec3(_42._m29)), vec3(_42._m34.xyz), bvec3(_42._m33 != 0.0));
    float _379 = clamp((_348.w * _42._m20.w) * 2.0, 0.0, 1.0);
    vec3 _384 = _377 * _42._m18;
    vec3 _392 = _4 - vec3(_342.w, _288, _341.w);
    _392.y = 6.103515625e-05;
    vec3 _394 = normalize(_5);
    vec3 _395 = normalize(_392);
    vec3 _405 = vec3(0.0, 0.0, 1.0) * mat3(_13._m1[0].xyz, _13._m1[1].xyz, _13._m1[2].xyz);
    vec3 _406 = _4 - _13._m11.xyz;
    float _410 = _406.y;
    vec4 _413 = vec4(_406.x, _410, _406.z, 1.0) * _13._m8;
    float _418 = _413.w;
    vec2 _421 = _413.xy - ((_13._m31.zw * vec2(2.0, -2.0)) * _418);
    vec3 _425 = vec4(_421.x, _421.y, _413.z, _413.w).xyz / vec3(_418);
    vec2 _428 = (_425.xy * 0.5) + vec2(0.5);
    vec3 _429 = vec3(_428.x, _428.y, _425.z);
    _429.y = 1.0 - _428.y;
    uvec2 _438 = uvec2(_429.xy * _13._m22.xy);
    int _441 = int(_438.x);
    int _442 = int(_438.y);
    ivec2 _444 = ivec3(_441, _442, 0).xy;
    vec2 _449 = (texelFetch(_44, _444, 0).xy * 2.0) - vec2(1.0);
    float _453 = 1.0 - dot(vec2(1.0), abs(_449));
    vec3 _455 = vec3(_449.x, _453, _449.y);
    vec3 _467;
    if (_453 < 0.0)
    {
        vec2 _465 = (vec2(1.0) - abs(_455.zx)) * mix(vec2(-1.0), vec2(1.0), greaterThanEqual(_455.xz, vec2(0.0)));
        _467 = vec3(_465.x, _455.y, _465.y);
    }
    else
    {
        _467 = _455;
    }
    vec3 _468 = normalize(_467);
    float _476 = mix(_13._m44.x, 1.0, _13._m113.w) * _13._m42.x;
    vec3 _926;
    float _927;
    if (_13._m102.y < 0.5)
    {
        vec3 _491 = _4 - (_13._m126.xyz + (_405 * (-_13._m128.w)));
        float _505 = spvNMax(clamp((spvNMax(abs(_491.x), abs(_491.z)) - 464.0) * 0.03125, 0.0, 1.0), clamp((abs(_491.y) - 208.0) * 0.03125, 0.0, 1.0));
        vec4 _807;
        vec4 _808;
        vec4 _809;
        float _810;
        float _811;
        if ((_13._m126.w != 0.0) && (_505 < 1.0))
        {
            vec3 _518 = _4 - (_13._m126.xyz + (_405 * (-_13._m128.y)));
            float _532 = spvNMax(clamp((spvNMax(abs(_518.x), abs(_518.z)) - 29.0) * 0.5, 0.0, 1.0), clamp((abs(_518.y) - 13.0) * 0.5, 0.0, 1.0));
            float _608;
            vec4 _609;
            vec4 _610;
            vec4 _611;
            if (_532 < 1.0)
            {
                vec3 _541 = ((_4 * 2.0) + vec3(0.5)) * _13._m127.xyz;
                vec3 _543 = _541 - floor(_541);
                vec4 _547 = textureLod(sampler3D(_35, _19), _543, 0.0);
                float _548 = 1.0 - _532;
                float _552 = _13._m127.y * 0.5;
                float _557 = _543.x;
                float _558 = clamp(_543.y, _552, 1.0 - _552) * 0.3333333432674407958984375;
                float _559 = _543.z;
                vec4 _562 = textureLod(sampler3D(_36, _18), vec3(_557, _558, _559), 0.0);
                float _578 = _547.x;
                float _588 = _547.y;
                float _598 = _547.z;
                _608 = _505 + (_562.w * _548);
                _609 = vec4(((textureLod(sampler3D(_36, _18), vec3(_557, _558 + 0.666666686534881591796875, _559), 0.0).xyz * 4.0) - vec3(2.0)) * _598, _598) * _548;
                _610 = vec4(((textureLod(sampler3D(_36, _18), vec3(_557, _558 + 0.3333333432674407958984375, _559), 0.0).xyz * 4.0) - vec3(2.0)) * _588, _588) * _548;
                _611 = vec4(((_562.xyz * 4.0) - vec3(2.0)) * _578, _578) * _548;
            }
            else
            {
                _608 = _505;
                _609 = vec4(0.0);
                _610 = vec4(0.0);
                _611 = vec4(0.0);
            }
            vec3 _617 = _4 - (_13._m126.xyz + (_405 * (-_13._m128.z)));
            float _631 = spvNMax(clamp((spvNMax(abs(_617.x), abs(_617.z)) - 116.0) * 0.125, 0.0, 1.0), clamp((abs(_617.y) - 52.0) * 0.125, 0.0, 1.0));
            float _711;
            vec4 _712;
            vec4 _713;
            vec4 _714;
            if (_631 < 1.0)
            {
                vec3 _640 = ((_4 * 0.5) + vec3(0.5)) * _13._m127.xyz;
                vec3 _642 = _640 - floor(_640);
                vec4 _646 = textureLod(sampler3D(_37, _19), _642, 0.0);
                float _648 = _532 * (1.0 - _631);
                float _652 = _13._m127.y * 0.5;
                float _657 = _642.x;
                float _658 = clamp(_642.y, _652, 1.0 - _652) * 0.3333333432674407958984375;
                float _659 = _642.z;
                vec4 _662 = textureLod(sampler3D(_38, _18), vec3(_657, _658, _659), 0.0);
                float _678 = _646.x;
                float _689 = _646.y;
                float _700 = _646.z;
                _711 = _608 + (_662.w * _648);
                _712 = _609 + (vec4(((textureLod(sampler3D(_38, _18), vec3(_657, _658 + 0.666666686534881591796875, _659), 0.0).xyz * 4.0) - vec3(2.0)) * _700, _700) * _648);
                _713 = _610 + (vec4(((textureLod(sampler3D(_38, _18), vec3(_657, _658 + 0.3333333432674407958984375, _659), 0.0).xyz * 4.0) - vec3(2.0)) * _689, _689) * _648);
                _714 = _611 + (vec4(((_662.xyz * 4.0) - vec3(2.0)) * _678, _678) * _648);
            }
            else
            {
                _711 = _608;
                _712 = _609;
                _713 = _610;
                _714 = _611;
            }
            vec4 _797;
            vec4 _798;
            vec4 _799;
            float _800;
            if (_631 > 0.0)
            {
                vec3 _723 = ((_4 * 0.125) + vec3(0.5)) * _13._m127.xyz;
                vec3 _726 = _13._m127.xyz * 0.5;
                vec3 _728 = clamp(_723 - floor(_723), _726, vec3(1.0) - _726);
                vec4 _732 = textureLod(sampler3D(_39, _19), _728, 0.0);
                float _734 = _631 * (1.0 - _505);
                float _738 = _13._m127.y * 0.5;
                float _743 = _728.x;
                float _744 = clamp(_728.y, _738, 1.0 - _738) * 0.3333333432674407958984375;
                float _745 = _728.z;
                vec4 _748 = textureLod(sampler3D(_40, _18), vec3(_743, _744, _745), 0.0);
                float _764 = _732.x;
                float _775 = _732.y;
                float _786 = _732.z;
                _797 = _712 + (vec4(((textureLod(sampler3D(_40, _18), vec3(_743, _744 + 0.666666686534881591796875, _745), 0.0).xyz * 4.0) - vec3(2.0)) * _786, _786) * _734);
                _798 = _713 + (vec4(((textureLod(sampler3D(_40, _18), vec3(_743, _744 + 0.3333333432674407958984375, _745), 0.0).xyz * 4.0) - vec3(2.0)) * _775, _775) * _734);
                _799 = _714 + (vec4(((_748.xyz * 4.0) - vec3(2.0)) * _764, _764) * _734);
                _800 = _711 + (_748.w * _734);
            }
            else
            {
                _797 = _712;
                _798 = _713;
                _799 = _714;
                _800 = _711;
            }
            float _803 = clamp((_800 * 2.0) - 1.0, 0.0, 1.0);
            _807 = _797;
            _808 = _798;
            _809 = _799;
            _810 = _803 - _505;
            _811 = (_803 + _505) * 0.5;
        }
        else
        {
            _807 = vec4(0.0);
            _808 = vec4(0.0);
            _809 = vec4(0.0);
            _810 = 0.0;
            _811 = 1.0;
        }
        vec4 _831 = _809 + vec4(_13._m129.x * _811, (_13._m129.y * _811) + ((_13._m129.w * _810) * 0.5), _13._m129.z * _811, (_13._m129.w * _811) + ((_13._m129.y * _810) * 0.375));
        vec4 _851 = _808 + vec4(_13._m130.x * _811, (_13._m130.y * _811) + ((_13._m130.w * _810) * 0.5), _13._m130.z * _811, (_13._m130.w * _811) + ((_13._m130.y * _810) * 0.375));
        vec4 _871 = _807 + vec4(_13._m131.x * _811, (_13._m131.y * _811) + ((_13._m131.w * _810) * 0.5), _13._m131.z * _811, (_13._m131.w * _811) + ((_13._m131.y * _810) * 0.375));
        vec4 _875 = vec4(_468, 1.0);
        vec3 _881 = spvNMax(vec3(dot(_831, _875), dot(_851, _875), dot(_871, _875)), vec3(0.0)) * _476;
        vec3 _889 = ((_831.xyz * 0.2125999927520751953125) + (_851.xyz * 0.715200006961822509765625)) + (_871.xyz * 0.072200000286102294921875);
        vec3 _893 = _889 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_889, _889)));
        vec4 _898 = vec4(_893.x, abs(_893.y), _893.z, 1.0);
        vec3 _903 = spvNMax(vec3(dot(_831, _898), dot(_851, _898), dot(_871, _898)), vec3(0.0));
        vec3 _913 = mix(vec3(dot(_881, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _881, vec3(0.5));
        _926 = spvNMax(_913, vec3(0.001000000047497451305389404296875)) / vec3(spvNMax(spvNMax(spvNMax(_913.x, _913.y), _913.z), 0.001000000047497451305389404296875));
        _927 = spvNMax(spvNMax(spvNMax(_903.x, _903.y), _903.z), 0.0) * _476;
    }
    else
    {
        _926 = _13._m103.xyz;
        _927 = _476;
    }
    vec3 _943 = _377 * 0.959999978542327880859375;
    vec3 _944 = mix(vec3(dot(_384, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _384, vec3(_42._m19)) * 0.959999978542327880859375;
    bool _951 = (1.0 - spvNMax(_16._m0[_9]._m1.y, _16._m0[_9]._m1.z)) < 0.9900000095367431640625;
    vec2 _964 = (_6.xy / vec2(spvNMax(_6.z, 9.9999999392252902907785028219223e-09))) - (_7.xy / vec2(spvNMax(_7.z, 9.9999999392252902907785028219223e-09)));
    _964.y = -_964.y;
    vec2 _980 = mix(((sqrt(sqrt(abs(_964 * 0.5))) * vec2(ivec2(sign(_964)))) * 0.5) + vec2(0.5), vec2(0.5), vec2(float(_951)));
    vec4 _982 = vec4(_980.x, _980.y, vec4(0.0).z, vec4(0.0).w);
    _982.z = 1.0;
    _982.w = _951 ? 0.699999988079071044921875 : 0.4000000059604644775390625;
    vec3 _995 = mix(-_29._m0.xyz, _13._m112.xyz, vec3(_13._m102.w));
    vec3 _1009 = mix(_29._m3.xyz, _13._m106.xyz, vec3(_13._m113.y));
    vec3 _1013 = _1009 * mix(_29._m3.w, 1.0, _13._m113.w);
    vec4 _1016 = texelFetch(_33, _444, 0);
    float _1021 = _1016.y;
    float _1024 = mix(mix(1.0, _1016.x, _31._m6.x), 1.0, _13._m102.z);
    float _1025 = dot(_468, _995);
    vec3 _1032 = _944 * _13._m101.z;
    vec3 _1033 = _1032 * 0.64999997615814208984375;
    vec4 _1068 = textureLod(sampler2D(_43, _18), vec2((clamp(mix(_1025, ((-_1025) * ((_1025 * 0.5) - 1.0)) + 0.5, (clamp(-dot(normalize(vec3(_995.x, 6.103515625e-05, _995.z)).xz, normalize(_405.xz)), 0.0, 1.0) * smoothstep(0.25, 0.75, 1.0 - abs(_405.y))) * (1.0 - _13._m113.x)) + (_13._m112.w * _13._m113.x), -1.0, 1.0) * 0.5) + 0.5, 0.5), 0.0);
    float _1069 = _1068.w;
    float _1071 = _1068.x;
    float _1072 = _1068.y;
    float _1073 = _1068.z;
    float _1078 = spvNMax(spvNMax(_1071, _1072), _1073) - spvNMin(spvNMin(_1071, _1072), _1073);
    float _1080 = smoothstep(0.25, 1.0, dot(_468, _405));
    float _1087 = spvNMin(spvNMin(_1021, 1.0), _1069);
    vec3 _1092 = vec3((clamp(dot(_468, _13._m107.xyz) + _13._m108.x, 0.0, 1.0) * _13._m108.y) + _13._m108.z) * mix(_926, vec3(1.0), vec3(_13._m102.y * _1087));
    vec3 _1094 = vec3(_1087);
    vec3 _1117 = vec3(_1024);
    vec3 _1119 = mix(mix(mix(vec3(dot(_1033, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1033, vec3(1.2000000476837158203125)), _1032, vec3(clamp((_1021 * _1080) + _1069, 0.0, 1.0))), _943, _1094);
    vec3 _1125 = _1119 * (vec3(1.0 - _1078) + (_1068.xyz * _1078));
    vec3 _1134 = mix(mix(_1032, mix(vec3(dot(_943, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _943, vec3(1.2000000476837158203125)), vec3(_1080 * _1021)), _1125 * clamp(dot(_1119, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)) * (1.0 / spvNMax(dot(_1125, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625)), 0.001000000047497451305389404296875)), 0.0, 1.5), _1117);
    vec4 _1138 = vec4(_1134, _1024);
    float _1144 = (1.0 - _42._m6) + (_379 * _42._m6);
    vec3 _1145 = (mix((_1092 * mix(spvNMin(mix(0.64999997615814208984375, 1.0, _927), 1.5), clamp(_927, 1.25, 1.75), _13._m102.x)) * _13._m101.w, (mix(vec3(dot(_1013, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1013, _1094) + ((_1092 * clamp(_927, 0.0, 1.5)) * (vec3(1.0 - _13._m113.y) + (_1009 * _13._m113.y)))) * _13._m101.y, _1117) * _1134) * _1144;
    float _1146 = dot(_1145, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625));
    float _1149 = clamp(_1146 - 0.5, 0.0, 0.5);
    vec3 _1160 = normalize(cross(_405, vec3(_13._m110.xy, 0.0)));
    float _1166 = dot(_319, _468);
    float _1168 = 1.0 - abs(_1166);
    vec2 _1191 = vec2(_438);
    vec2 _1193 = floor(_1191 * 0.03125);
    int _1201 = int((_1193.x + (_1193.y * _27._m5)) * 8.0);
    float _1208 = floor(_298 - (_13._m25.y * _27._m11));
    float _1212 = clamp(_1208, 0.0, _27._m7 - 1.0);
    int _1214 = int(_1212 * 8.0);
    vec3 _1216;
    _1216 = mix(vec3(_1146), _1145, vec3((_1149 * _1149) + 1.0)) + ((((_13._m109.xyz * smoothstep(mix(0.800000011920928955078125, 0.20000000298023223876953125, _13._m110.w), mix(0.89999997615814208984375, 0.5, _13._m110.w), _1168)) * _13._m109.w) * spvNMin(spvNMin(clamp(dot(_395, _1160) + 1.0, 0.0, 1.0), 1.0), _1021)) * (mix(vec3(0.25), _943, vec3(_13._m110.z)) * clamp(dot(_1160, _468), 0.0, 1.0)));
    vec3 _1217;
    SPIRV_CROSS_LOOP
    for (int _1219 = 0; _1219 <= 7; _1216 = _1217, _1219++)
    {
        uint _1237 = (_1208 <= _1212) ? (_23._m0[uint(_1201 + _1219)] & _23._m0[uint((_13._m43.y + _1214) + _1219)]) : 0u;
        uint _1238 = uint(_1219);
        _1217 = _1216;
        uint _1243;
        vec3 _1240;
        SPIRV_CROSS_LOOP
        for (uint _1242 = _1237; _1242 != 0u; _1217 = _1240, _1242 = _1243)
        {
            uint _1247 = uint(findLSB(_1242));
            _1243 = _1242 ^ (1u << (_1247 & 31u));
            int _1253 = int((32u * _1238) + _1247) * 8;
            int _1256 = _1253 + 1;
            int _1259 = _1253 + 2;
            int _1262 = _1253 + 3;
            int _1265 = _1253 + 4;
            int _1268 = _1253 + 5;
            int _1271 = _1253 + 6;
            float _1352;
            if (uint(_29._m6[_1268].w) == 1u)
            {
                uint _1283 = floatBitsToUint(_29._m6[_1268].x);
                uint _1290 = floatBitsToUint(_29._m6[_1268].y);
                uint _1297 = floatBitsToUint(_29._m6[_1268].z);
                uint _1304 = floatBitsToUint(_29._m6[_1271].x);
                uint _1311 = floatBitsToUint(_29._m6[_1271].y);
                uint _1318 = floatBitsToUint(_29._m6[_1271].z);
                vec3 _1337 = abs((mat4(vec4(unpackHalf2x16(_1283).x, unpackHalf2x16(_1297).x, unpackHalf2x16(_1311).x, 0.0), vec4(unpackHalf2x16(_1283 >> 16u).x, unpackHalf2x16(_1297 >> 16u).x, unpackHalf2x16(_1311 >> 16u).x, 0.0), vec4(unpackHalf2x16(_1290).x, unpackHalf2x16(_1304).x, unpackHalf2x16(_1318).x, 0.0), vec4(unpackHalf2x16(_1290 >> 16u).x, unpackHalf2x16(_1304 >> 16u).x, unpackHalf2x16(_1318 >> 16u).x, 0.0)) * vec4(_4 - _29._m6[_1256].xyz, 1.0)).xyz);
                float _1344 = _29._m6[_1253 + 7].x * 0.5;
                float _1350 = 1.0 - clamp((spvNMax(spvNMax(_1337.x, _1337.y), _1337.z) - (_1344 + 0.5)) / (0.5 - _1344), 0.0, 1.0);
                _1352 = _1350 * _1350;
            }
            else
            {
                _1352 = 1.0;
            }
            if (false || (_1352 < 0.001000000047497451305389404296875))
            {
                _1240 = _1217;
                continue;
            }
            vec3 _1865;
            if (_29._m6[_1253].w < 1.5)
            {
                vec3 _1864;
                do
                {
                    uint _1365 = floatBitsToUint(_29._m6[_1262].w);
                    if ((_1365 == 16u) || ((_29._m6[_1262].z + _13._m113.z) < 0.5))
                    {
                        _1864 = _1217;
                        break;
                    }
                    bool _1377 = (uint(_29._m6[_1253].w) & 1u) == 0u;
                    bool _1381 = (!_1377) && (_29._m6[_1259].z > 0.0);
                    bool _1382 = _1365 == 4u;
                    float _1383 = float(_1377);
                    float _1391 = (0.5 + (0.5 * _29._m6[_1259].y)) - abs(_29._m6[_1259].x);
                    float _1392 = _29._m6[_1259].y - _1391;
                    float _1399 = abs(spvNMax((1.0 - abs(_1391)) - abs(_1392), 0.00048828125));
                    vec3 _1403 = normalize(vec3(_1391, _1392, (_29._m6[_1259].x >= 0.0) ? _1399 : (-_1399)));
                    float _1409 = mix(_29._m6[_1271].w, spvNMax(2.0 * _29._m6[_1265].y, 0.100000001490116119384765625), float(_1382));
                    vec3 _1414 = _29._m6[_1256].xyz - _4;
                    vec3 _1415 = -_1403;
                    vec3 _1420 = mix(_1414, _1415 * dot(_1414, _1415), vec3(float(_1382 && (_29._m6[_1265].z > 0.5)) * _1383));
                    float _1421 = dot(_1420, _1420);
                    float _1422 = inversesqrt(_1421);
                    vec3 _1423 = _1420 * _1422;
                    vec3 _1456;
                    float _1457;
                    if (_1381)
                    {
                        vec3 _1427 = (_1403 * _29._m6[_1259].z) * 0.5;
                        vec3 _1428 = _1420 - _1427;
                        vec3 _1429 = _1420 + _1427;
                        float _1430 = length(_1428);
                        float _1431 = length(_1429);
                        vec3 _1440 = normalize(cross(cross(_1403, _1423), _1403));
                        _1456 = _1440;
                        _1457 = ((1.0 / ((((_1430 * _1431) + dot(_1428, _1429)) * 0.5) + 1.0)) * clamp(0.5 * ((dot(_1440, _1428) / _1430) + (dot(_1440, _1429) / _1431)), 0.0, 1.0)) * (1.0 / clamp(1.0 + (0.5 * clamp(_29._m6[_1259].z * _1422, 0.0, 1.0)), 0.0, 1.0));
                    }
                    else
                    {
                        _1456 = _1423;
                        _1457 = 1.0;
                    }
                    float _1479;
                    if (_1409 < 0.0)
                    {
                        float _1467 = _1421 * (_29._m6[_1256].w * _29._m6[_1256].w);
                        float _1470 = clamp(1.0 - (_1467 * _1467), 0.0, 1.0);
                        _1479 = mix(1.0 / (_1421 + 1.0), _1457, float(_1381)) * (_1470 * _1470);
                    }
                    else
                    {
                        vec3 _1473 = _1420 * _29._m6[_1256].w;
                        _1479 = _1457 * pow(1.0 - clamp(dot(_1473, _1473), 0.0, 1.0), _1409);
                    }
                    float _1484 = clamp((dot(_1456, _1415) - _29._m6[_1259].z) * _29._m6[_1259].w, 0.0, 1.0);
                    float _1488 = (_1479 * mix(1.0, _1484 * _1484, _1383)) * _1352;
                    vec3 _1863;
                    do
                    {
                        vec3 _1862;
                        SPIRV_CROSS_BRANCH
                        if (_1488 > 9.9999997473787516355514526367188e-05)
                        {
                            SPIRV_CROSS_BRANCH
                            if (_1382)
                            {
                                _1863 = mix(_1217, _29._m6[_1253].xyz, vec3(_1488 * _29._m6[_1265].x));
                                break;
                            }
                            float _1501 = dot(_468, _1456);
                            float _1502 = clamp(_1501, 0.0, 1.0);
                            float _1789;
                            if (_1365 != 0u)
                            {
                                int _1554;
                                if (_1377)
                                {
                                    _1554 = int(_29._m6[_1262].x);
                                }
                                else
                                {
                                    uint _1511 = floatBitsToUint(_29._m6[_1259].w);
                                    uint _1513 = floatBitsToUint(_29._m6[_1262].x);
                                    vec3 _1514 = _4 - _29._m6[_1256].xyz;
                                    vec3 _1515 = abs(_1514);
                                    float _1516 = _1515.x;
                                    float _1517 = _1515.y;
                                    float _1519 = _1515.z;
                                    int _1551;
                                    if ((_1516 > _1517) && (_1516 > _1519))
                                    {
                                        _1551 = int((_1514.x > 0.0) ? (_1511 >> 24u) : ((_1511 >> 16u) & 255u));
                                    }
                                    else
                                    {
                                        int _1550;
                                        if (_1517 > _1519)
                                        {
                                            _1550 = int((_1514.y > 0.0) ? ((_1511 >> 8u) & 255u) : (_1511 & 255u));
                                        }
                                        else
                                        {
                                            _1550 = int((_1514.z > 0.0) ? ((_1513 >> 8u) & 255u) : (_1513 & 255u));
                                        }
                                        _1551 = _1550;
                                    }
                                    _1554 = (_1551 < 80) ? _1551 : (-1);
                                }
                                bool _1555 = _1554 >= 0;
                                float _1788;
                                if (_1555)
                                {
                                    vec3 _1559 = _4 - _29._m6[_1256].xyz;
                                    vec4 _1579 = vec4((_4 - ((_1559 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_1559, _1559)))) * _31._m10[_1554].x)) + (_394 * (_31._m10[_1554].y * 5.0)), 1.0) * _31._m9[_1554];
                                    vec3 _1583 = _1579.xyz / vec3(_1579.w);
                                    vec3 _1594 = _1583.xyz;
                                    bvec3 _1595 = lessThanEqual(_1594, vec3(0.0));
                                    bvec3 _1596 = greaterThanEqual(_1594, vec3(1.0));
                                    float _1599 = _1583.z;
                                    vec2 _1608 = ((_1583.xy * (_31._m11[_1554].zw - _31._m11[_1554].xy)) + _31._m11[_1554].xy).xy * _31._m12.zw;
                                    vec2 _1610 = floor(_1608 + vec2(0.5));
                                    vec2 _1611 = _1608 - _1610;
                                    float _1612 = _1611.x;
                                    float _1613 = _1612 + 0.5;
                                    float _1614 = _1613 * _1613;
                                    float _1617 = 1.0 - _1612;
                                    float _1618 = spvNMin(_1612, 0.0);
                                    float _1621 = _1612 + 1.0;
                                    float _1622 = spvNMax(_1612, 0.0);
                                    float _1633 = _1611.y;
                                    float _1634 = _1633 + 0.5;
                                    float _1635 = _1634 * _1634;
                                    float _1638 = 1.0 - _1633;
                                    float _1639 = spvNMin(_1633, 0.0);
                                    float _1642 = _1633 + 1.0;
                                    float _1643 = spvNMax(_1633, 0.0);
                                    vec3 _1655 = vec3(0.1599999964237213134765625 * _1617, 0.1599999964237213134765625 * ((_1621 - (_1622 * _1622)) + 1.0), _1614 * 0.07999999821186065673828125);
                                    vec3 _1656 = vec3(0.1599999964237213134765625 * ((_1614 * 0.5) - _1612), 0.1599999964237213134765625 * ((_1617 - (_1618 * _1618)) + 1.0), 0.1599999964237213134765625 * _1621) + _1655;
                                    vec3 _1658 = vec3(0.1599999964237213134765625 * _1638, 0.1599999964237213134765625 * ((_1642 - (_1643 * _1643)) + 1.0), _1635 * 0.07999999821186065673828125);
                                    vec3 _1659 = vec3(0.1599999964237213134765625 * ((_1635 * 0.5) - _1633), 0.1599999964237213134765625 * ((_1638 - (_1639 * _1639)) + 1.0), 0.1599999964237213134765625 * _1642) + _1658;
                                    vec3 _1665 = ((_1655 / _1656) + vec3(-2.5, -0.5, 1.5)) * _31._m12.xxx;
                                    vec3 _1667 = ((_1658 / _1659) + vec3(-2.5, -0.5, 1.5)) * _31._m12.yyy;
                                    vec2 _1669 = _1610 * _31._m12.xy;
                                    float _1670 = _1665.x;
                                    float _1671 = _1667.x;
                                    vec2 _1673 = _1669 + vec2(_1670, _1671);
                                    float _1674 = _1665.y;
                                    vec2 _1676 = _1669 + vec2(_1674, _1671);
                                    float _1677 = _1665.z;
                                    vec2 _1679 = _1669 + vec2(_1677, _1671);
                                    float _1680 = _1667.y;
                                    vec2 _1682 = _1669 + vec2(_1670, _1680);
                                    vec2 _1684 = _1669 + vec2(_1674, _1680);
                                    vec2 _1686 = _1669 + vec2(_1677, _1680);
                                    float _1687 = _1667.z;
                                    vec2 _1689 = _1669 + vec2(_1670, _1687);
                                    vec2 _1691 = _1669 + vec2(_1674, _1687);
                                    vec2 _1693 = _1669 + vec2(_1677, _1687);
                                    float _1694 = _1656.x;
                                    float _1695 = _1659.x;
                                    float _1697 = _1656.y;
                                    float _1699 = _1656.z;
                                    float _1701 = _1659.y;
                                    float _1705 = _1659.z;
                                    float _1771 = ((((((((_1694 * _1695) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1673, _286).xy, _1599), 0.0)) + ((_1697 * _1695) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1676, _286).xy, _1599), 0.0))) + ((_1699 * _1695) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1679, _286).xy, _1599), 0.0))) + ((_1694 * _1701) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1682, _286).xy, _1599), 0.0))) + ((_1697 * _1701) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1684, _286).xy, _1599), 0.0))) + ((_1699 * _1701) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1686, _286).xy, _1599), 0.0))) + ((_1694 * _1705) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1689, _286).xy, _1599), 0.0))) + ((_1697 * _1705) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1691, _286).xy, _1599), 0.0));
                                    _1788 = _1555 ? mix(1.0, (any(bvec3(_1595.x || _1596.x, _1595.y || _1596.y, _1595.z || _1596.z)) || ((floatBitsToUint(_1599) & 2147483647u) > 2139095040u)) ? 1.0 : (_1771 + ((_1699 * _1705) * textureLod(sampler2DShadow(_32, _20), vec3(vec3(_1693, _286).xy, _1599), 0.0))), _31._m10[_1554].w) : 1.0;
                                }
                                else
                                {
                                    _1788 = clamp(dot(_395, _1456) + 1.0, 0.0, 1.0);
                                }
                                _1789 = _1788;
                            }
                            else
                            {
                                _1789 = 1.0;
                            }
                            float _1851;
                            vec3 _1852;
                            float _1853;
                            vec3 _1854;
                            vec3 _1855;
                            SPIRV_CROSS_BRANCH
                            if (_1365 == 0u)
                            {
                                vec3 _1796 = _29._m6[_1253].xyz * _1488;
                                vec3 _1809 = _1138.xyz;
                                _1851 = _1488;
                                _1852 = (_29._m6[_1253].xyz * ((1.0 - _29._m6[_1265].y) + ((1.0 / spvNMax(1.0, spvNMax(spvNMax(_1796.x, _1796.y), _1796.z) * mix(0.75, 0.5, 1.0 - _1024))) * _29._m6[_1265].y))) * mix(0.25 * _29._m6[_1265].x, 1.0, clamp(_1501 + 0.5, 0.0, 1.0));
                                _1853 = _1502;
                                _1854 = _1809;
                                _1855 = _1809;
                            }
                            else
                            {
                                float _1847;
                                float _1848;
                                vec3 _1849;
                                vec3 _1850;
                                if (_1365 == 3u)
                                {
                                    _1847 = _1488 * (smoothstep(mix(0.800000011920928955078125, 0.20000000298023223876953125, _29._m6[_1265].x), mix(0.89999997615814208984375, 0.5, _29._m6[_1265].x), _1168) * _1789);
                                    _1848 = clamp(dot(_468, -normalize(cross(_405, cross(_405, _1456)))), 0.0, 1.0);
                                    _1849 = mix(vec3(0.5), _943, vec3(_29._m6[_1265].y));
                                    _1850 = vec3(0.0);
                                }
                                else
                                {
                                    bool _1834 = _1365 == 1u;
                                    float _1843;
                                    vec3 _1844;
                                    if (_1834)
                                    {
                                        _1843 = clamp(clamp(_1501 + _29._m6[_1265].x, -1.0, 1.0), 0.0, 1.0) * _1789;
                                        _1844 = _944 * _29._m6[_1265].y;
                                    }
                                    else
                                    {
                                        _1843 = _1502;
                                        _1844 = vec3(0.0);
                                    }
                                    _1847 = _1488;
                                    _1848 = _1843;
                                    _1849 = mix(vec3(0.0), _943, bvec3(_1834));
                                    _1850 = _1844;
                                }
                                _1851 = _1847;
                                _1852 = _29._m6[_1253].xyz;
                                _1853 = _1848;
                                _1854 = _1849;
                                _1855 = _1850;
                            }
                            _1862 = _1217 + (((_1852 * _1851) * mix(_1855, _1854, vec3(_1853))) * _1144);
                        }
                        else
                        {
                            _1862 = _1217;
                        }
                        _1863 = _1862;
                        break;
                    } while(false);
                    _1864 = _1863;
                    break;
                } while(false);
                _1865 = _1864;
            }
            else
            {
                _1865 = _1217;
            }
            _1240 = _1865;
        }
    }
    vec3 _1905;
    SPIRV_CROSS_BRANCH
    if (_42._m12 > 0.5)
    {
        _1905 = mix(mix(vec3(0.5), mix(vec3(dot(_1216, vec3(0.21267290413379669189453125, 0.715152204036712646484375, 0.072175003588199615478515625))), _1216, vec3(_42._m14)), vec3(_42._m15)) * _42._m13, _42._m22.xyz, vec3(_42._m22.w)) + ((_42._m23.xyz * smoothstep(1.0 - _42._m16, 1.0, 1.0 - clamp(_1166, 0.0, 1.0))) * _42._m17);
    }
    else
    {
        _1905 = _1216;
    }
    vec4 _1911 = vec4(_1905 / vec3(_13._m42.x), _379);
    _1911.w = (_42._m8 == 1.0) ? _379 : 1.0;
    vec4 _2297;
    SPIRV_CROSS_BRANCH
    if (_13._m113.w < 0.5)
    {
        vec3 _1920 = -_319;
        float _1938 = _4.y * _13._m68.w;
        float _1943 = spvNMax(0.00999999977648258209228515625, _1938 + _13._m69.w);
        vec3 _1957 = exp(_13._m67.xyz * ((-spvNMax(0.0, (_320 * _13._m66.w) - _13._m65.w)) * (((1.0 - exp(-_1943)) / _1943) * exp(_1938 + _13._m70.w))));
        float _1960 = dot(_1920, _13._m66.xyz);
        float _1966 = _13._m67.w * _13._m67.w;
        float _1970 = (1.0 + _1966) - ((2.0 * _13._m67.w) * _1960);
        vec3 _2289;
        float _2290;
        if (_13._m77.z > 0.0)
        {
            uvec3 _2015 = (uvec3(ivec3(_441, _442, int(_13._m41 & 7u))) * uvec3(1664525u)) + uvec3(1013904223u);
            uint _2016 = _2015.y;
            uint _2017 = _2015.z;
            uint _2020 = _2015.x + (_2016 * _2017);
            uint _2022 = _2016 + (_2017 * _2020);
            uint _2024 = _2017 + (_2020 * _2022);
            uint _2026 = _2020 + (_2022 * _2024);
            float _2051 = dot(_1920, -_13._m0[2].xyz);
            float _2059 = (_13._m77.w * ((_2051 > 5.9604644775390625e-08) ? (1.0 / _2051) : 0.0)) * (1.0 / _320);
            float _2060 = _2059 * _410;
            float _2062 = _13._m11.y + _2060;
            float _2063 = _410 - _2060;
            float _2065 = (1.0 - _2059) * _320;
            float _2079 = spvNMax(-127.0, _13._m71.z * _2063);
            float _2103 = spvNMax(-127.0, _13._m74.x * _2063);
            float _2114 = ((_13._m71.y * exp2(-spvNMax(-127.0, _13._m71.z * (_2062 - _13._m71.x)))) * ((abs(_2079) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2079)) / _2079) : (0.693147182464599609375 - (0.2402265071868896484375 * _2079)))) + ((_13._m74.y * exp2(-spvNMax(-127.0, _13._m74.x * (_2062 - _13._m74.z)))) * ((abs(_2103) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2103)) / _2103) : (0.693147182464599609375 - (0.2402265071868896484375 * _2103))));
            float _2136 = clamp((_320 * _13._m72.w) + _13._m72.z, 0.0, 1.0);
            float _2139 = clamp((spvNMax(clamp(exp2(-(_2114 * _2065)), 0.0, 1.0), _13._m73.w) + clamp((_320 * _13._m72.y) + _13._m72.x, 0.0, 1.0)) + _2136, 0.0, 1.0);
            vec4 _2179 = mix(vec4(0.0, 0.0, 0.0, 1.0), textureLod(sampler3D(_47, _18), vec3((_1191 + ((((vec3(uvec3(_2026, _2022 + (_2024 * _2026), _289) >> uvec3(16u)) * vec3(1.525902189314365386962890625e-05)) * 2.0) - vec3(1.0)) * _13._m81.w).xy) * _13._m79.xy, (log2((_298 * _13._m78.x) + _13._m78.y) * _13._m78.z) / _13._m77.z), 0.0), vec4(clamp((_298 - _13._m80.z) * 1000000.0, 0.0, 1.0)));
            float _2181 = _2179.w;
            _2289 = _2179.xyz + (((_13._m73.xyz * (1.0 - _2139)) + (((_13._m76.xyz * pow(clamp(dot(_319, _13._m75.xyz), 0.0, 1.0), _13._m76.w)) * (1.0 - clamp(exp2(-(_2114 * spvNMax(_2065 - _13._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _2136))) * _2181);
            _2290 = _2181 * _2139;
        }
        else
        {
            float _2199 = spvNMax(-127.0, _13._m71.z * _410);
            float _2223 = spvNMax(-127.0, _13._m74.x * _410);
            float _2234 = ((_13._m71.y * exp2(-spvNMax(-127.0, _13._m71.z * (_13._m11.y - _13._m71.x)))) * ((abs(_2199) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2199)) / _2199) : (0.693147182464599609375 - (0.2402265071868896484375 * _2199)))) + ((_13._m74.y * exp2(-spvNMax(-127.0, _13._m74.x * (_13._m11.y - _13._m74.z)))) * ((abs(_2223) > 5.9604644775390625e-08) ? ((1.0 - exp2(-_2223)) / _2223) : (0.693147182464599609375 - (0.2402265071868896484375 * _2223))));
            float _2256 = clamp((_320 * _13._m72.w) + _13._m72.z, 0.0, 1.0);
            float _2259 = clamp((spvNMax(clamp(exp2(-(_2234 * _320)), 0.0, 1.0), _13._m73.w) + clamp((_320 * _13._m72.y) + _13._m72.x, 0.0, 1.0)) + _2256, 0.0, 1.0);
            _2289 = (_13._m73.xyz * (1.0 - _2259)) + (((_13._m76.xyz * pow(clamp(dot(_319, _13._m75.xyz), 0.0, 1.0), _13._m76.w)) * (1.0 - clamp(exp2(-(_2234 * spvNMax(_320 - _13._m75.w, 0.0))), 0.0, 1.0))) * (1.0 - _2256));
            _2290 = _2259;
        }
        vec3 _2295 = (_1911.xyz * (_1957 * _2290)) + ((((clamp(((_13._m68.xyz * (0.0596831031143665313720703125 * (1.0 + (_1960 * _1960)))) + _13._m70.xyz) + (_13._m69.xyz * ((1.0 - _1966) / spvNMax((12.56637096405029296875 * _1970) * sqrt(_1970), 0.001000000047497451305389404296875))), vec3(0.0), vec3(1.0)) * 255.0) * (vec3(1.0) - _1957)) * _2290) + _2289);
        _2297 = vec4(_2295.x, _2295.y, _2295.z, _1911.w);
    }
    else
    {
        _2297 = _1911;
    }
    _10 = _2297;
    _11 = _982;
}

