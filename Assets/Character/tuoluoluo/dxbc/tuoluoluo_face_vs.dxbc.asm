Shader hash 096f0c30-9ff42e3e-57a60c9a-26f6543e

vs_4_0
      dcl_constantbuffer cb0[1356], immediateIndexed
      dcl_constantbuffer cb1[33], immediateIndexed
      dcl_constantbuffer cb2[31], immediateIndexed
      dcl_input v0.xyz
      dcl_input v1.xyz
      dcl_input v2.xyz
      dcl_input v3.xy
      dcl_input v4.xy
      dcl_input v6.xyzw
      dcl_input v7.xyz
      dcl_output_siv o0.xyzw, position
      dcl_output o1.xyzw
      dcl_output o2.xyzw
      dcl_output o3.xyzw
      dcl_output o4.xyzw
      dcl_output o5.xyzw
      dcl_output o6.xyzw
      dcl_output o7.xyzw
      dcl_output o8.xyzw
      dcl_output o9.xyzw
      dcl_output o10.xyzw
      dcl_output o11.xyzw
      dcl_temps 6
   0: mul r0.xyz, v0.yyyy, cb1[1].xyzx
   1: mad r0.xyz, cb1[0].xyzx, v0.xxxx, r0.xyzx
   2: mad r0.xyz, cb1[2].xyzx, v0.zzzz, r0.xyzx
   3: add r0.xyz, r0.xyzx, cb1[3].xyzx
   4: lt r0.w, l(0.500000), cb2[30].y
   5: if_nz r0.w
   6:   mul r1.xyz, r0.yyyy, cb0[1338].xyzx
   7:   mad r1.xyz, cb0[1337].xyzx, r0.xxxx, r1.xyzx
   8:   mad r1.xyz, cb0[1339].xyzx, r0.zzzz, r1.xyzx
   9:   add r1.xyz, r1.xyzx, cb0[1340].xyzx
  10:   add r2.xyzw, v3.xxyy, l(-0.500000, -0.500000, -0.500000, -0.500000)
  11:   mul r2.xyzw, r2.xyzw, v4.xxxx
  12:   mad r1.xyz, r2.xyyx, l(2.000000, 0.000000, 0.000000, 0.000000), r1.xyzx
  13:   mad r1.xyz, r2.zwzz, l(0.000000, 2.000000, 0.000000, 0.000000), r1.xyzx
  14:   mul r2.xyz, r1.yyyy, cb0[1342].xyzx
  15:   mad r2.xyz, cb0[1341].xyzx, r1.xxxx, r2.xyzx
  16:   mad r2.xyz, cb0[1343].xyzx, r1.zzzz, r2.xyzx
  17:   add r0.xyz, r2.xyzx, cb0[1344].xyzx
  18:   mov r2.x, cb0[1333].x
  19:   mov r2.y, cb0[1335].x
  20:   mov r2.zw, cb0[1336].xxxz
  21:   mov r1.w, l(1.000000)
  22:   dp3 o0.x, r2.xyzx, r1.xzwx
  23:   mov r2.x, cb0[1334].y
  24:   mov r2.y, cb0[1335].y
  25:   mov r2.z, cb0[1336].y
  26:   dp3 o0.y, r2.xyzx, r1.yzwy
  27:   mov r2.x, cb0[1333].z
  28:   mov r2.y, cb0[1334].z
  29:   mov r2.z, cb0[1335].z
  30:   dp4 o0.z, r2.xyzw, r1.xyzw
  31:   mov r1.x, cb0[1335].w
  32:   mov r1.y, cb0[1336].w
  33:   dp2 o0.w, r1.xyxx, r1.zwzz
  34:   dp3 r0.w, cb0[1341].xyzx, cb0[1341].xyzx
  35:   rsq r0.w, r0.w
  36:   mul r1.xyz, r0.wwww, cb0[1341].xyzx
  37:   dp3 r0.w, cb0[1342].xyzx, cb0[1342].xyzx
  38:   rsq r0.w, r0.w
  39:   mul r2.xyz, r0.wwww, cb0[1342].xyzx
  40:   dp3 r0.w, cb0[1343].xyzx, cb0[1343].xyzx
  41:   rsq r0.w, r0.w
  42:   mul r3.xyz, r0.wwww, cb0[1343].xyzx
  43: else
  44:   mul r4.xyzw, r0.yyyy, cb0[1346].xyzw
  45:   mad r4.xyzw, cb0[1345].xyzw, r0.xxxx, r4.xyzw
  46:   mad r4.xyzw, cb0[1347].xyzw, r0.zzzz, r4.xyzw
  47:   add o0.xyzw, r4.xyzw, cb0[1348].xyzw
  48:   mul r0.w, v6.w, cb1[9].w
  49:   dp3 r4.x, v1.xyzx, cb1[4].xyzx
  50:   dp3 r4.y, v1.xyzx, cb1[5].xyzx
  51:   dp3 r4.z, v1.xyzx, cb1[6].xyzx
  52:   dp3 r4.w, r4.xyzx, r4.xyzx
  53:   max r4.w, r4.w, l(0.000000)
  54:   rsq r4.w, r4.w
  55:   mul r3.xyz, r4.wwww, r4.xyzx
  56:   mul r4.xyz, v6.yyyy, cb1[1].xyzx
  57:   mad r4.xyz, cb1[0].xyzx, v6.xxxx, r4.xyzx
  58:   mad r4.xyz, cb1[2].xyzx, v6.zzzz, r4.xyzx
  59:   dp3 r4.w, r4.xyzx, r4.xyzx
  60:   max r4.w, r4.w, l(0.000000)
  61:   rsq r4.w, r4.w
  62:   mul r1.xyz, r4.wwww, r4.xyzx
  63:   mul r4.xyz, r1.yzxy, r3.zxyz
  64:   mad r4.xyz, r3.yzxy, r1.zxyz, -r4.xyzx
  65:   mul r2.xyz, r0.wwww, r4.xyzx
  66: endif
  67: add o7.xyz, -r0.xyzx, cb0[1295].xyzx
  68: add r0.w, -cb2[15].z, l(1.000000)
  69: lt r0.w, r0.w, l(0.010000)
  70: mul r4.x, cb0[1290].y, l(5.000000)
  71: sincos r4.x, null, r4.x
  72: add r4.x, r4.x, l(1.000000)
  73: mad r4.x, r4.x, l(0.350000), l(0.200000)
  74: add r4.x, -r4.x, l(1.000000)
  75: and o7.w, r0.w, r4.x
  76: mul r4.xyzw, v0.yyyy, cb1[1].xyzw
  77: mad r4.xyzw, cb1[0].xyzw, v0.xxxx, r4.xyzw
  78: mad r4.xyzw, cb1[2].xyzw, v0.zzzz, r4.xyzw
  79: add r4.xyzw, r4.xyzw, cb1[3].xyzw
  80: mul r5.xyzw, r4.yyyy, cb0[1346].xyzw
  81: mad r5.xyzw, cb0[1345].xyzw, r4.xxxx, r5.xyzw
  82: mad r5.xyzw, cb0[1347].xyzw, r4.zzzz, r5.xyzw
  83: mad o10.xyzw, cb0[1348].xyzw, r4.wwww, r5.xyzw
  84: lt r0.w, l(0), cb1[32].x
  85: movc r4.xyz, r0.wwww, v7.xyzx, v0.xyzx
  86: mul r5.xyzw, r4.yyyy, cb1[25].xyzw
  87: mad r5.xyzw, cb1[24].xyzw, r4.xxxx, r5.xyzw
  88: mad r4.xyzw, cb1[26].xyzw, r4.zzzz, r5.xyzw
  89: add r4.xyzw, r4.xyzw, cb1[27].xyzw
  90: mul r5.xyzw, r4.yyyy, cb0[1353].xyzw
  91: mad r5.xyzw, cb0[1352].xyzw, r4.xxxx, r5.xyzw
  92: mad r5.xyzw, cb0[1354].xyzw, r4.zzzz, r5.xyzw
  93: mad o11.xyzw, cb0[1355].xyzw, r4.wwww, r5.xyzw
  94: mov o1.xy, v3.xyxx
  95: mov o1.zw, v4.xxxy
  96: mov r3.w, r0.x
  97: mov o2.xyzw, r3.xyzw
  98: mov r1.w, r0.y
  99: mov o3.xyzw, r1.xyzw
 100: mov r2.w, r0.z
 101: mov o4.xyzw, r2.xyzw
 102: mov o5.xyz, r0.xyzx
 103: mov o5.w, l(0)
 104: mov o6.xyz, v2.xyzx
 105: mov o6.w, l(0)
 106: mov o8.xyzw, l(0.000000, 0.000000, 0.000000, 1.000000)
 107: mov o9.xyzw, l(0, 0, 0, 0)
 108: ret
