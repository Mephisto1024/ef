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

vec4 _122;

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

layout(set = 0, binding = 4) uniform sampler _27;
layout(set = 1, binding = 0) uniform texture2D _33;

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
layout(location = 3) out vec4 _15;
layout(location = 4) out vec2 _16;
layout(location = 5) out vec3 _17;
layout(location = 6) out vec3 _18;
layout(location = 7) flat out uint _20;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    uint _137 = floatBitsToUint(_5.x);
    bool _139 = (_137 & 1073741824u) > 0u;
    vec3 _212;
    vec4 _213;
    if (_139)
    {
        float _145 = float((_137 << 22u) >> 22u);
        float _148 = float((_137 << 12u) >> 22u);
        float _151 = float((_137 << 2u) >> 22u);
        vec3 _165 = vec3((_145 >= 512.0) ? (_145 - 1024.0) : _145, (_148 >= 512.0) ? (_148 - 1024.0) : _148, 0.0) * 0.001956947147846221923828125;
        float _171 = (1.0 - abs(_165.x)) - abs(_165.y);
        vec3 _172 = _165;
        _172.z = _171;
        vec2 _183 = mix(_172.xy, (vec2(1.0) - abs(_172.yx)) * ((step(vec2(0.0), _172.xy) * 2.0) - vec2(1.0)), bvec2(_171 < 0.0));
        vec3 _185 = normalize(vec3(_183.x, _183.y, _172.z));
        float _186 = ((_151 >= 512.0) ? (_151 - 1024.0) : _151) * 0.001956947147846221923828125;
        vec3 _189 = _185.yzx - _185.zxy;
        vec3 _193 = normalize(_189 - vec3(dot(_189, _185)));
        float _197 = (_186 < 0.0) ? (-1.0) : 1.0;
        float _200 = 1.0 - ((_186 * _197) * 2.0);
        vec3 _207 = mat2x3(_193, normalize(cross(_185, _193))) * normalize(vec2(_200, _197 * (1.0 - abs(_200))));
        vec4 _208 = vec4(_207.x, _207.y, _207.z, _122.w);
        _208.w = (float((_137 >> 31u) & 1u) * 2.0) - 1.0;
        _212 = _185;
        _213 = _208;
    }
    else
    {
        _212 = _5;
        _213 = vec4(0.0);
    }
    vec4 _215 = mix(_6, _213, bvec4(_139));
    vec4 _403;
    vec3 _404;
    vec3 _405;
    vec3 _406;
    do
    {
        vec4 _222 = vec4(_3, 1.0);
        uint _225 = floatBitsToUint(_25._m0[uint(gl_InstanceIndex)]._m1.w);
        uint _226 = _225 & 4294967247u;
        if (((_225 & 32u) == 0u) || (_226 == 0u))
        {
            _403 = _215;
            _404 = _212;
            _405 = _3;
            _406 = _8.xyz;
            break;
        }
        uvec4 _242 = _11 * uvec4(3u);
        uvec4 _243 = uvec4(floatBitsToUint(_25._m0[uint(gl_InstanceIndex)]._m2.x) + 3u) + _242;
        uvec4 _245 = uvec4(floatBitsToUint(_25._m0[uint(gl_InstanceIndex)]._m2.y) + 3u) + _242;
        uint _246 = _243.x;
        uint _249 = _246 + 1u;
        uint _252 = _246 + 2u;
        uint _255 = _245.x;
        uint _258 = _255 + 1u;
        uint _261 = _255 + 2u;
        vec4 _305;
        vec4 _306;
        vec4 _307;
        vec4 _308;
        vec4 _309;
        vec4 _310;
        if (_226 >= 2u)
        {
            uint _269 = _243.y;
            uint _288 = _245.y;
            _305 = (_30._m0[_261] * _10.x) + (_30._m0[_288 + 2u] * _10.y);
            _306 = (_30._m0[_258] * _10.x) + (_30._m0[_288 + 1u] * _10.y);
            _307 = (_30._m0[_255] * _10.x) + (_30._m0[_288] * _10.y);
            _308 = (_30._m0[_252] * _10.x) + (_30._m0[_269 + 2u] * _10.y);
            _309 = (_30._m0[_249] * _10.x) + (_30._m0[_269 + 1u] * _10.y);
            _310 = (_30._m0[_246] * _10.x) + (_30._m0[_269] * _10.y);
        }
        else
        {
            _305 = _30._m0[_261];
            _306 = _30._m0[_258];
            _307 = _30._m0[_255];
            _308 = _30._m0[_252];
            _309 = _30._m0[_249];
            _310 = _30._m0[_246];
        }
        vec4 _376;
        vec4 _377;
        vec4 _378;
        vec4 _379;
        vec4 _380;
        vec4 _381;
        if (_226 >= 4u)
        {
            uint _314 = _243.z;
            uint _319 = _243.w;
            uint _346 = _245.z;
            uint _350 = _245.w;
            _376 = _305 + ((_30._m0[_346 + 2u] * _10.z) + (_30._m0[_350 + 2u] * _10.w));
            _377 = _306 + ((_30._m0[_346 + 1u] * _10.z) + (_30._m0[_350 + 1u] * _10.w));
            _378 = _307 + ((_30._m0[_346] * _10.z) + (_30._m0[_350] * _10.w));
            _379 = _308 + ((_30._m0[_314 + 2u] * _10.z) + (_30._m0[_319 + 2u] * _10.w));
            _380 = _309 + ((_30._m0[_314 + 1u] * _10.z) + (_30._m0[_319 + 1u] * _10.w));
            _381 = _310 + ((_30._m0[_314] * _10.z) + (_30._m0[_319] * _10.w));
        }
        else
        {
            _376 = _305;
            _377 = _306;
            _378 = _307;
            _379 = _308;
            _380 = _309;
            _381 = _310;
        }
        vec3 _397 = _215.xyz;
        vec3 _401 = vec3(dot(_381.xyz, _397), dot(_380.xyz, _397), dot(_379.xyz, _397));
        _403 = vec4(_401.x, _401.y, _401.z, _215.w);
        _404 = vec3(dot(_381.xyz, _212), dot(_380.xyz, _212), dot(_379.xyz, _212));
        _405 = vec3(dot(_381, _222), dot(_380, _222), dot(_379, _222));
        _406 = vec3(dot(_378, _222), dot(_377, _222), dot(_376, _222));
        break;
    } while(false);
    mat3 _415 = mat3(_25._m0[uint(gl_InstanceIndex)]._m0[0].xyz, _25._m0[uint(gl_InstanceIndex)]._m0[1].xyz, _25._m0[uint(gl_InstanceIndex)]._m0[2].xyz);
    vec3 _425 = (_405 * _415) + (vec3(_25._m0[uint(gl_InstanceIndex)]._m0[0].w, _25._m0[uint(gl_InstanceIndex)]._m0[1].w, _25._m0[uint(gl_InstanceIndex)]._m0[2].w) - _22._m11.xyz);
    vec3 _426 = _425 + _22._m11.xyz;
    vec4 _433 = vec4(_425, 1.0) * _22._m8;
    vec2 _441 = _433.xy - ((_22._m31.zw * vec2(2.0, -2.0)) * _433.w);
    vec3 _449 = _404 * _415;
    vec3 _453 = _449 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_449, _449)));
    vec3 _455 = _403.xyz * _415;
    vec4 _496 = vec4((mix(_406.xyz, _405, bvec3(_25._m0[uint(gl_InstanceIndex)]._m4.x < 1.0)) * mat3(_25._m0[uint(gl_InstanceIndex)]._m3[0].xyz, _25._m0[uint(gl_InstanceIndex)]._m3[1].xyz, _25._m0[uint(gl_InstanceIndex)]._m3[2].xyz)) + (vec3(_25._m0[uint(gl_InstanceIndex)]._m3[0].w, _25._m0[uint(gl_InstanceIndex)]._m3[1].w, _25._m0[uint(gl_InstanceIndex)]._m3[2].w) - _22._m21.xyz), 1.0) * _22._m15;
    mat3 _514 = mat3(_22._m8[0].xyz, _22._m8[1].xyz, _22._m8[2].xyz);
    vec3 _515 = _453 * _514;
    float _544 = mix(_32._m31, spvNMax(0.800000011920928955078125, _32._m31), spvNMax(mix(_25._m0[uint(gl_InstanceIndex)]._m6.x, _22._m111.y, _22._m111.x), spvNMax(_25._m0[uint(gl_InstanceIndex)]._m6.w, smoothstep(-0.20000000298023223876953125, 0.1500000059604644775390625, mix(_25._m0[uint(gl_InstanceIndex)]._m6.z, _22._m111.w, _22._m111.x) - _426.y) * mix(_25._m0[uint(gl_InstanceIndex)]._m6.y, 1.0, _22._m111.x))));
    vec3 _554 = mix(_515, ((vec3(0.0, -1.0, 0.0) * _514) * _544) + (_515 * (1.0 - _544)), vec3(_7.x * (0.5 - (_453.y * 0.5)))) * (((_32._m26 * _7.x) * 0.00999999977648258209228515625) * textureLod(sampler2D(_33, _27), _4, 0.0).w);
    vec3 _556 = vec4(_441.x, _441.y, _433.z, _433.w).xyz + _554;
    vec4 _557 = vec4(_556.x, _556.y, _556.z, _433.w);
    vec2 _558 = _554.xy;
    vec2 _560 = _433.xy + _558;
    vec2 _563 = _496.xy + _558;
    _12 = (_4 * _32._m24.xy) + _32._m24.zw;
    _13 = _426;
    _14 = _453;
    _15 = vec4(_455 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_455, _455))), _403.w);
    _16 = _7;
    _17 = vec3(_560.x, _560.y, _433.w);
    _18 = vec3(_563.x, _563.y, _496.w);
    _557.y = -_556.y;
    gl_Position = _557;
    _20 = uint(gl_InstanceIndex);
}

