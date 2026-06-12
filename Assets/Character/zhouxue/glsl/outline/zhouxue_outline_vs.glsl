#version 460
#extension GL_EXT_spirv_intrinsics : require

struct _23
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

vec4 _116;

layout(set = 0, binding = 14, std140) uniform _20_21
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
} _21;

layout(set = 2, binding = 0, std140) uniform _22_24
{
    layout(row_major) _23 _m0[256];
} _24;

layout(set = 0, binding = 16, std430) readonly buffer _25_26
{
    vec4 _m0[];
} _26;

layout(set = 1, binding = 0, std140) uniform _27_28
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
} _28;

layout(location = 0) in vec3 _3;
layout(location = 1) in vec2 _4;
layout(location = 2) in vec3 _5;
layout(location = 3) in vec4 _6;
layout(location = 4) in vec2 _7;
layout(location = 5) in vec4 _8;
layout(location = 6) in vec4 _10;
layout(location = 7) in uvec4 _11;
layout(location = 0) out vec2 _12;
layout(location = 1) out vec3 _13;
layout(location = 2) out vec3 _14;
layout(location = 4) out vec3 _16;
layout(location = 5) out vec3 _17;
layout(location = 6) flat out uint _19;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    uint _136 = floatBitsToUint(_5.x);
    bool _138 = (_136 & 1073741824u) > 0u;
    vec3 _211;
    vec4 _212;
    if (_138)
    {
        float _144 = float((_136 << 22u) >> 22u);
        float _147 = float((_136 << 12u) >> 22u);
        float _150 = float((_136 << 2u) >> 22u);
        vec3 _164 = vec3((_144 >= 512.0) ? (_144 - 1024.0) : _144, (_147 >= 512.0) ? (_147 - 1024.0) : _147, 0.0) * 0.001956947147846221923828125;
        float _170 = (1.0 - abs(_164.x)) - abs(_164.y);
        vec3 _171 = _164;
        _171.z = _170;
        vec2 _182 = mix(_171.xy, (vec2(1.0) - abs(_171.yx)) * ((step(vec2(0.0), _171.xy) * 2.0) - vec2(1.0)), bvec2(_170 < 0.0));
        vec3 _184 = normalize(vec3(_182.x, _182.y, _171.z));
        float _185 = ((_150 >= 512.0) ? (_150 - 1024.0) : _150) * 0.001956947147846221923828125;
        vec3 _188 = _184.yzx - _184.zxy;
        vec3 _192 = normalize(_188 - vec3(dot(_188, _184)));
        float _196 = (_185 < 0.0) ? (-1.0) : 1.0;
        float _199 = 1.0 - ((_185 * _196) * 2.0);
        vec3 _206 = mat2x3(_192, normalize(cross(_184, _192))) * normalize(vec2(_199, _196 * (1.0 - abs(_199))));
        vec4 _207 = vec4(_206.x, _206.y, _206.z, _116.w);
        _207.w = (float((_136 >> 31u) & 1u) * 2.0) - 1.0;
        _211 = _184;
        _212 = _207;
    }
    else
    {
        _211 = _5;
        _212 = vec4(0.0);
    }
    vec4 _214 = mix(_6, _212, bvec4(_138));
    vec4 _402;
    vec3 _403;
    vec3 _404;
    vec3 _405;
    do
    {
        vec4 _221 = vec4(_3, 1.0);
        uint _224 = floatBitsToUint(_24._m0[uint(gl_InstanceIndex)]._m1.w);
        uint _225 = _224 & 4294967247u;
        if (((_224 & 32u) == 0u) || (_225 == 0u))
        {
            _402 = _214;
            _403 = _211;
            _404 = _3;
            _405 = _8.xyz;
            break;
        }
        uvec4 _241 = _11 * uvec4(3u);
        uvec4 _242 = uvec4(floatBitsToUint(_24._m0[uint(gl_InstanceIndex)]._m2.x) + 3u) + _241;
        uvec4 _244 = uvec4(floatBitsToUint(_24._m0[uint(gl_InstanceIndex)]._m2.y) + 3u) + _241;
        uint _245 = _242.x;
        uint _248 = _245 + 1u;
        uint _251 = _245 + 2u;
        uint _254 = _244.x;
        uint _257 = _254 + 1u;
        uint _260 = _254 + 2u;
        vec4 _304;
        vec4 _305;
        vec4 _306;
        vec4 _307;
        vec4 _308;
        vec4 _309;
        if (_225 >= 2u)
        {
            uint _268 = _242.y;
            uint _287 = _244.y;
            _304 = (_26._m0[_260] * _10.x) + (_26._m0[_287 + 2u] * _10.y);
            _305 = (_26._m0[_257] * _10.x) + (_26._m0[_287 + 1u] * _10.y);
            _306 = (_26._m0[_254] * _10.x) + (_26._m0[_287] * _10.y);
            _307 = (_26._m0[_251] * _10.x) + (_26._m0[_268 + 2u] * _10.y);
            _308 = (_26._m0[_248] * _10.x) + (_26._m0[_268 + 1u] * _10.y);
            _309 = (_26._m0[_245] * _10.x) + (_26._m0[_268] * _10.y);
        }
        else
        {
            _304 = _26._m0[_260];
            _305 = _26._m0[_257];
            _306 = _26._m0[_254];
            _307 = _26._m0[_251];
            _308 = _26._m0[_248];
            _309 = _26._m0[_245];
        }
        vec4 _375;
        vec4 _376;
        vec4 _377;
        vec4 _378;
        vec4 _379;
        vec4 _380;
        if (_225 >= 4u)
        {
            uint _313 = _242.z;
            uint _318 = _242.w;
            uint _345 = _244.z;
            uint _349 = _244.w;
            _375 = _304 + ((_26._m0[_345 + 2u] * _10.z) + (_26._m0[_349 + 2u] * _10.w));
            _376 = _305 + ((_26._m0[_345 + 1u] * _10.z) + (_26._m0[_349 + 1u] * _10.w));
            _377 = _306 + ((_26._m0[_345] * _10.z) + (_26._m0[_349] * _10.w));
            _378 = _307 + ((_26._m0[_313 + 2u] * _10.z) + (_26._m0[_318 + 2u] * _10.w));
            _379 = _308 + ((_26._m0[_313 + 1u] * _10.z) + (_26._m0[_318 + 1u] * _10.w));
            _380 = _309 + ((_26._m0[_313] * _10.z) + (_26._m0[_318] * _10.w));
        }
        else
        {
            _375 = _304;
            _376 = _305;
            _377 = _306;
            _378 = _307;
            _379 = _308;
            _380 = _309;
        }
        vec3 _396 = _214.xyz;
        vec3 _400 = vec3(dot(_380.xyz, _396), dot(_379.xyz, _396), dot(_378.xyz, _396));
        _402 = vec4(_400.x, _400.y, _400.z, _214.w);
        _403 = vec3(dot(_380.xyz, _211), dot(_379.xyz, _211), dot(_378.xyz, _211));
        _404 = vec3(dot(_380, _221), dot(_379, _221), dot(_378, _221));
        _405 = vec3(dot(_377, _221), dot(_376, _221), dot(_375, _221));
        break;
    } while(false);
    mat3 _414 = mat3(_24._m0[uint(gl_InstanceIndex)]._m0[0].xyz, _24._m0[uint(gl_InstanceIndex)]._m0[1].xyz, _24._m0[uint(gl_InstanceIndex)]._m0[2].xyz);
    vec3 _424 = (_404 * _414) + (vec3(_24._m0[uint(gl_InstanceIndex)]._m0[0].w, _24._m0[uint(gl_InstanceIndex)]._m0[1].w, _24._m0[uint(gl_InstanceIndex)]._m0[2].w) - _21._m11.xyz);
    vec4 _432 = vec4(_424, 1.0) * _21._m8;
    float _437 = _432.w;
    vec3 _447 = _403 * _414;
    vec3 _451 = _447 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_447, _447)));
    vec3 _453 = _402.xyz * _414;
    vec4 _494 = vec4((mix(_405.xyz, _404, bvec3(_24._m0[uint(gl_InstanceIndex)]._m4.x < 1.0)) * mat3(_24._m0[uint(gl_InstanceIndex)]._m3[0].xyz, _24._m0[uint(gl_InstanceIndex)]._m3[1].xyz, _24._m0[uint(gl_InstanceIndex)]._m3[2].xyz)) + (vec3(_24._m0[uint(gl_InstanceIndex)]._m3[0].w, _24._m0[uint(gl_InstanceIndex)]._m3[1].w, _24._m0[uint(gl_InstanceIndex)]._m3[2].w) - _21._m21.xyz), 1.0) * _21._m15;
    vec3 _514;
    if (_28._m30 > 0.5)
    {
        vec3 _502 = vec3(_7, 0.0);
        vec2 _503 = _502.xy;
        _502.z = sqrt(1.0 - clamp(dot(_503, _503), 0.0, 1.0));
        vec3 _509 = vec4(_453 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_453, _453))), _402.w).xyz;
        _514 = mat3(_509, cross(_451, _509) * _402.w, _451) * _502;
    }
    else
    {
        _514 = _451;
    }
    float _528 = (-1.0) / _21._m2[1].y;
    float _529 = abs(_528);
    bool _530 = _529 < 1.0;
    float _532 = _530 ? _529 : (1.0 / _529);
    float _533 = _532 * _532;
    float _538 = (1.0 + (((-0.3018949925899505615234375) + (0.087292902171611785888671875 * _533)) * _533)) * _532;
    float _540 = _530 ? _538 : (1.57079637050628662109375 - _538);
    float _543 = (_528 < 0.0) ? (-_540) : _540;
    vec2 _564 = (((normalize((_514 * mat3(_21._m8[0].xyz, _21._m8[1].xyz, _21._m8[2].xyz)).xy) * vec2(_21._m23.y / _21._m23.x, 1.0)) * (_28._m26 * (0.3926990330219268798828125 / _543))) * clamp((_437 * (_543 * 114.5915679931640625)) * 0.039999999105930328369140625, 0.0, 1.0)) * 0.004999999888241291046142578125;
    vec2 _569 = _21._m23.zw * clamp(_437, 0.0, 1.57079613208770751953125 / _543);
    vec2 _577 = mix(_564, _569 * vec2(ivec2(sign(_564))), lessThan(abs(_564), _569)) * 1.0;
    vec2 _579 = (_432.xy - ((_21._m31.zw * vec2(2.0, -2.0)) * _437)).xy + _577;
    vec4 _580 = vec4(_579.x, _579.y, _432.z, _432.w);
    vec4 _606;
    if (_21._m26.w == 0.0)
    {
        float _597 = (-_437) + (_28._m27 * (-0.100000001490116119384765625));
        vec4 _605 = _580;
        _605.z = (((_597 * _21._m2[2].z) + _21._m2[2].w) * _437) / (-_597);
        _606 = _605;
    }
    else
    {
        vec4 _593 = _580;
        _593.z = _432.z + ((_28._m27 * (-0.100000001490116119384765625)) / _21._m25.z);
        _606 = _593;
    }
    vec2 _608 = _432.xy + _577;
    vec2 _611 = _494.xy + _577;
    _12 = (_4 * _28._m24.xy) + _28._m24.zw;
    _13 = _424 + _21._m11.xyz;
    _14 = _514;
    _16 = vec3(_608.x, _608.y, _432.w);
    _17 = vec3(_611.x, _611.y, _494.w);
    vec4 _615 = _606;
    _615.y = -_606.y;
    gl_Position = _615;
    _19 = uint(gl_InstanceIndex);
}

