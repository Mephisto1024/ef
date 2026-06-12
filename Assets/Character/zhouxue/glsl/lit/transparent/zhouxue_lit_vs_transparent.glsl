#version 460
#extension GL_EXT_spirv_intrinsics : require

struct _25
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

vec4 _106;

layout(set = 0, binding = 14, std140) uniform _22_23
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
} _23;

layout(set = 2, binding = 0, std140) uniform _24_26
{
    layout(row_major) _25 _m0[256];
} _26;

layout(set = 0, binding = 16, std430) readonly buffer _27_28
{
    vec4 _m0[];
} _28;

layout(set = 1, binding = 0, std140) uniform _29_30
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
} _30;

layout(location = 0) in vec3 _3;
layout(location = 1) in vec2 _4;
layout(location = 2) in vec3 _5;
layout(location = 3) in vec4 _6;
layout(location = 4) in vec4 _7;
layout(location = 5) in vec3 _8;
layout(location = 6) in vec4 _10;
layout(location = 7) in uvec4 _11;
layout(location = 0) out vec2 _12;
layout(location = 1) out vec3 _13;
layout(location = 2) out vec3 _14;
layout(location = 3) out vec4 _15;
layout(location = 4) out vec3 _16;
layout(location = 5) out vec3 _17;
layout(location = 6) out vec3 _18;
layout(location = 7) out vec3 _19;
layout(location = 8) flat out uint _21;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

void main()
{
    uint _121 = floatBitsToUint(_5.x);
    bool _123 = (_121 & 1073741824u) > 0u;
    vec3 _196;
    vec4 _197;
    if (_123)
    {
        float _129 = float((_121 << 22u) >> 22u);
        float _132 = float((_121 << 12u) >> 22u);
        float _135 = float((_121 << 2u) >> 22u);
        vec3 _149 = vec3((_129 >= 512.0) ? (_129 - 1024.0) : _129, (_132 >= 512.0) ? (_132 - 1024.0) : _132, 0.0) * 0.001956947147846221923828125;
        float _155 = (1.0 - abs(_149.x)) - abs(_149.y);
        vec3 _156 = _149;
        _156.z = _155;
        vec2 _167 = mix(_156.xy, (vec2(1.0) - abs(_156.yx)) * ((step(vec2(0.0), _156.xy) * 2.0) - vec2(1.0)), bvec2(_155 < 0.0));
        vec3 _169 = normalize(vec3(_167.x, _167.y, _156.z));
        float _170 = ((_135 >= 512.0) ? (_135 - 1024.0) : _135) * 0.001956947147846221923828125;
        vec3 _173 = _169.yzx - _169.zxy;
        vec3 _177 = normalize(_173 - vec3(dot(_173, _169)));
        float _181 = (_170 < 0.0) ? (-1.0) : 1.0;
        float _184 = 1.0 - ((_170 * _181) * 2.0);
        vec3 _191 = mat2x3(_177, normalize(cross(_169, _177))) * normalize(vec2(_184, _181 * (1.0 - abs(_184))));
        vec4 _192 = vec4(_191.x, _191.y, _191.z, _106.w);
        _192.w = (float((_121 >> 31u) & 1u) * 2.0) - 1.0;
        _196 = _169;
        _197 = _192;
    }
    else
    {
        _196 = _5;
        _197 = vec4(0.0);
    }
    vec4 _199 = mix(_6, _197, bvec4(_123));
    vec4 _387;
    vec3 _388;
    vec3 _389;
    vec3 _390;
    do
    {
        vec4 _206 = vec4(_3, 1.0);
        uint _209 = floatBitsToUint(_26._m0[uint(gl_InstanceIndex)]._m1.w);
        uint _210 = _209 & 4294967247u;
        if (((_209 & 32u) == 0u) || (_210 == 0u))
        {
            _387 = _199;
            _388 = _196;
            _389 = _3;
            _390 = _7.xyz;
            break;
        }
        uvec4 _226 = _11 * uvec4(3u);
        uvec4 _227 = uvec4(floatBitsToUint(_26._m0[uint(gl_InstanceIndex)]._m2.x) + 3u) + _226;
        uvec4 _229 = uvec4(floatBitsToUint(_26._m0[uint(gl_InstanceIndex)]._m2.y) + 3u) + _226;
        uint _230 = _227.x;
        uint _233 = _230 + 1u;
        uint _236 = _230 + 2u;
        uint _239 = _229.x;
        uint _242 = _239 + 1u;
        uint _245 = _239 + 2u;
        vec4 _289;
        vec4 _290;
        vec4 _291;
        vec4 _292;
        vec4 _293;
        vec4 _294;
        if (_210 >= 2u)
        {
            uint _253 = _227.y;
            uint _272 = _229.y;
            _289 = (_28._m0[_245] * _10.x) + (_28._m0[_272 + 2u] * _10.y);
            _290 = (_28._m0[_242] * _10.x) + (_28._m0[_272 + 1u] * _10.y);
            _291 = (_28._m0[_239] * _10.x) + (_28._m0[_272] * _10.y);
            _292 = (_28._m0[_236] * _10.x) + (_28._m0[_253 + 2u] * _10.y);
            _293 = (_28._m0[_233] * _10.x) + (_28._m0[_253 + 1u] * _10.y);
            _294 = (_28._m0[_230] * _10.x) + (_28._m0[_253] * _10.y);
        }
        else
        {
            _289 = _28._m0[_245];
            _290 = _28._m0[_242];
            _291 = _28._m0[_239];
            _292 = _28._m0[_236];
            _293 = _28._m0[_233];
            _294 = _28._m0[_230];
        }
        vec4 _360;
        vec4 _361;
        vec4 _362;
        vec4 _363;
        vec4 _364;
        vec4 _365;
        if (_210 >= 4u)
        {
            uint _298 = _227.z;
            uint _303 = _227.w;
            uint _330 = _229.z;
            uint _334 = _229.w;
            _360 = _289 + ((_28._m0[_330 + 2u] * _10.z) + (_28._m0[_334 + 2u] * _10.w));
            _361 = _290 + ((_28._m0[_330 + 1u] * _10.z) + (_28._m0[_334 + 1u] * _10.w));
            _362 = _291 + ((_28._m0[_330] * _10.z) + (_28._m0[_334] * _10.w));
            _363 = _292 + ((_28._m0[_298 + 2u] * _10.z) + (_28._m0[_303 + 2u] * _10.w));
            _364 = _293 + ((_28._m0[_298 + 1u] * _10.z) + (_28._m0[_303 + 1u] * _10.w));
            _365 = _294 + ((_28._m0[_298] * _10.z) + (_28._m0[_303] * _10.w));
        }
        else
        {
            _360 = _289;
            _361 = _290;
            _362 = _291;
            _363 = _292;
            _364 = _293;
            _365 = _294;
        }
        vec3 _381 = _199.xyz;
        vec3 _385 = vec3(dot(_365.xyz, _381), dot(_364.xyz, _381), dot(_363.xyz, _381));
        _387 = vec4(_385.x, _385.y, _385.z, _199.w);
        _388 = vec3(dot(_365.xyz, _196), dot(_364.xyz, _196), dot(_363.xyz, _196));
        _389 = vec3(dot(_365, _206), dot(_364, _206), dot(_363, _206));
        _390 = vec3(dot(_362, _206), dot(_361, _206), dot(_360, _206));
        break;
    } while(false);
    mat3 _399 = mat3(_26._m0[uint(gl_InstanceIndex)]._m0[0].xyz, _26._m0[uint(gl_InstanceIndex)]._m0[1].xyz, _26._m0[uint(gl_InstanceIndex)]._m0[2].xyz);
    vec3 _409 = (_389 * _399) + (vec3(_26._m0[uint(gl_InstanceIndex)]._m0[0].w, _26._m0[uint(gl_InstanceIndex)]._m0[1].w, _26._m0[uint(gl_InstanceIndex)]._m0[2].w) - _23._m11.xyz);
    vec4 _417 = vec4(_409, 1.0) * _23._m8;
    vec2 _425 = _417.xy - ((_23._m31.zw * vec2(2.0, -2.0)) * _417.w);
    vec4 _426 = vec4(_425.x, _425.y, _417.z, _417.w);
    vec3 _433 = _388 * _399;
    vec3 _439 = _387.xyz * _399;
    _12 = (_4 * _30._m24.xy) + _30._m24.zw;
    _13 = _409 + _23._m11.xyz;
    _14 = _433 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_433, _433)));
    _15 = vec4(_439 * inversesqrt(spvNMax(1.1754943508222875079687365372222e-38, dot(_439, _439))), _387.w);
    _16 = _417.xyw;
    _17 = (vec4((mix(_390.xyz, _389, bvec3(_26._m0[uint(gl_InstanceIndex)]._m4.x < 1.0)) * mat3(_26._m0[uint(gl_InstanceIndex)]._m3[0].xyz, _26._m0[uint(gl_InstanceIndex)]._m3[1].xyz, _26._m0[uint(gl_InstanceIndex)]._m3[2].xyz)) + (vec3(_26._m0[uint(gl_InstanceIndex)]._m3[0].w, _26._m0[uint(gl_InstanceIndex)]._m3[1].w, _26._m0[uint(gl_InstanceIndex)]._m3[2].w) - _23._m21.xyz), 1.0) * _23._m15).xyw;
    _18 = _196;
    _19 = _8;
    _426.y = -_425.y;
    gl_Position = _426;
    _21 = uint(gl_InstanceIndex);
}

