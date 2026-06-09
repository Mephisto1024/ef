Shader hash 096f0c30-9ff42e3e-57a60c9a-26f6543e

// 少女前线：追放 - 托洛洛脸部顶点着色器（可读性注释版）
// 注意：这是 D3D vs_4_0 汇编形式的反编译结果，并非高层 GLSL。
// 常量缓冲区变量名 cb0/cb1/cb2 按要求保持不变，仅补充寄存器语义注释。
//
// 输入寄存器：
//   v0.xyz  = 模型空间顶点位置 localPosition
//   v1.xyz  = 模型空间法线 localNormal
//   v2.xyz  = 额外顶点向量/颜色 customVertexVector
//   v3.xy   = 主 UV mainUV
//   v4.xy   = 面部/偏移控制 UV 或权重 faceOffsetControl
//   v6.xyzw = 切线/副切线参考 tangentOrGuide，w 为手性/缩放
//   v7.xyz  = 替代位置/形变位置 alternatePosition
//
// 输出寄存器：
//   o0.xyzw  = 裁剪空间位置 clipPosition
//   o1.xyzw  = UV 与面部控制参数 packedUV
//   o2.xyzw  = 世界/视图空间法线 normalAndPosX
//   o3.xyzw  = 世界/视图空间切线 tangentAndPosY
//   o4.xyzw  = 世界/视图空间副切线 bitangentAndPosZ
//   o5.xyzw  = 世界空间位置 worldPosition
//   o6.xyzw  = 额外顶点向量 customVertexVectorOut
//   o7.xyzw  = 到相机/灯光向量与眨眼遮罩 viewVectorAndBlinkMask
//   o8.xyzw  = 固定辅助颜色/参数 constantAux
//   o9.xyzw  = 清零辅助参数 zeroAux
//   o10.xyzw = 标准裁剪空间位置 baseClipPosition
//   o11.xyzw = 替代/阴影裁剪空间位置 alternateClipPosition
//
// 临时寄存器主要含义：
//   r0 = 世界位置 worldPosition / 条件与中间标量
//   r1 = 面部形变位置 morphedFacePosition / 切线 tangent
//   r2 = 面部 UV 偏移 faceUvOffset / 副切线 bitangent / 矩阵行临时
//   r3 = 法线 normal
//   r4/r5 = 矩阵变换、归一化与输出打包临时

vs_4_0
      dcl_constantbuffer cb0[1356], immediateIndexed                 // 全局/相机/矩阵等常量缓冲区，变量名保持原样
      dcl_constantbuffer cb1[33], immediateIndexed                   // 对象矩阵、法线矩阵、切线与替代位置矩阵，变量名保持原样
      dcl_constantbuffer cb2[31], immediateIndexed                   // 渲染状态/开关常量缓冲区，变量名保持原样
      dcl_input v0.xyz                                               // localPosition：模型空间顶点位置
      dcl_input v1.xyz                                               // localNormal：模型空间法线
      dcl_input v2.xyz                                               // customVertexVector：额外顶点向量
      dcl_input v3.xy                                                // mainUV：主纹理坐标
      dcl_input v4.xy                                                // faceOffsetControl：面部偏移控制
      dcl_input v6.xyzw                                              // tangentOrGuide：切线/参考方向，w 为方向手性或缩放
      dcl_input v7.xyz                                               // alternatePosition：替代/形变位置
      dcl_output_siv o0.xyzw, position                               // clipPosition：最终裁剪空间位置
      dcl_output o1.xyzw                                             // packedUV：UV 与控制参数
      dcl_output o2.xyzw                                             // normalAndPosX：法线 xyz + 世界位置 x
      dcl_output o3.xyzw                                             // tangentAndPosY：切线 xyz + 世界位置 y
      dcl_output o4.xyzw                                             // bitangentAndPosZ：副切线 xyz + 世界位置 z
      dcl_output o5.xyzw                                             // worldPosition：世界空间位置
      dcl_output o6.xyzw                                             // customVertexVectorOut：额外顶点向量输出
      dcl_output o7.xyzw                                             // viewVectorAndBlinkMask：视线向量 xyz + 眨眼遮罩 w
      dcl_output o8.xyzw                                             // constantAux：固定辅助参数
      dcl_output o9.xyzw                                             // zeroAux：清零辅助参数
      dcl_output o10.xyzw                                            // baseClipPosition：基础裁剪空间位置
      dcl_output o11.xyzw                                            // alternateClipPosition：替代裁剪空间位置
      dcl_temps 6                                                    // r0-r5 临时寄存器
   0: mul r0.xyz, v0.yyyy, cb1[1].xyzx                               // worldPosition = localPosition.y * objectToWorldRow1
   1: mad r0.xyz, cb1[0].xyzx, v0.xxxx, r0.xyzx                       // worldPosition += localPosition.x * objectToWorldRow0
   2: mad r0.xyz, cb1[2].xyzx, v0.zzzz, r0.xyzx                       // worldPosition += localPosition.z * objectToWorldRow2
   3: add r0.xyz, r0.xyzx, cb1[3].xyzx                                // worldPosition += objectToWorldTranslation
   4: lt r0.w, l(0.500000), cb2[30].y                                 // useFaceProjectionPath = cb2[30].y > 0.5
   5: if_nz r0.w                                                      // 如果启用脸部特殊投影/形变路径
   6:   mul r1.xyz, r0.yyyy, cb0[1338].xyzx                           // morphedFacePosition = worldPosition.y * faceMatrixRow1
   7:   mad r1.xyz, cb0[1337].xyzx, r0.xxxx, r1.xyzx                  // morphedFacePosition += worldPosition.x * faceMatrixRow0
   8:   mad r1.xyz, cb0[1339].xyzx, r0.zzzz, r1.xyzx                  // morphedFacePosition += worldPosition.z * faceMatrixRow2
   9:   add r1.xyz, r1.xyzx, cb0[1340].xyzx                           // morphedFacePosition += faceMatrixTranslation
  10:   add r2.xyzw, v3.xxyy, l(-0.500000, -0.500000, -0.500000, -0.500000) // faceUvCentered = mainUV duplicated - 0.5
  11:   mul r2.xyzw, r2.xyzw, v4.xxxx                                 // faceUvOffset = faceUvCentered * faceOffsetControl.x
  12:   mad r1.xyz, r2.xyyx, l(2.000000, 0.000000, 0.000000, 0.000000), r1.xyzx // 沿脸部 X 方向加入 UV 驱动偏移
  13:   mad r1.xyz, r2.zwzz, l(0.000000, 2.000000, 0.000000, 0.000000), r1.xyzx // 沿脸部 Y 方向加入 UV 驱动偏移
  14:   mul r2.xyz, r1.yyyy, cb0[1342].xyzx                           // worldPosition = morphedFacePosition.y * inverseFaceRow1
  15:   mad r2.xyz, cb0[1341].xyzx, r1.xxxx, r2.xyzx                  // worldPosition += morphedFacePosition.x * inverseFaceRow0
  16:   mad r2.xyz, cb0[1343].xyzx, r1.zzzz, r2.xyzx                  // worldPosition += morphedFacePosition.z * inverseFaceRow2
  17:   add r0.xyz, r2.xyzx, cb0[1344].xyzx                            // worldPosition = 形变后世界位置
  18:   mov r2.x, cb0[1333].x                                         // clipMatrixCustom row/column element
  19:   mov r2.y, cb0[1335].x                                         // clipMatrixCustom row/column element
  20:   mov r2.zw, cb0[1336].xxxz                                     // clipMatrixCustom row/column element
  21:   mov r1.w, l(1.000000)                                         // morphedFacePosition.w = 1
  22:   dp3 o0.x, r2.xyzx, r1.xzwx                                    // clipPosition.x = 自定义矩阵点乘
  23:   mov r2.x, cb0[1334].y                                         // clipMatrixCustom row/column element
  24:   mov r2.y, cb0[1335].y                                         // clipMatrixCustom row/column element
  25:   mov r2.z, cb0[1336].y                                         // clipMatrixCustom row/column element
  26:   dp3 o0.y, r2.xyzx, r1.yzwy                                    // clipPosition.y = 自定义矩阵点乘
  27:   mov r2.x, cb0[1333].z                                         // clipMatrixCustom row/column element
  28:   mov r2.y, cb0[1334].z                                         // clipMatrixCustom row/column element
  29:   mov r2.z, cb0[1335].z                                         // clipMatrixCustom row/column element
  30:   dp4 o0.z, r2.xyzw, r1.xyzw                                    // clipPosition.z = 自定义矩阵点乘
  31:   mov r1.x, cb0[1335].w                                         // clipMatrixCustom row/column element
  32:   mov r1.y, cb0[1336].w                                         // clipMatrixCustom row/column element
  33:   dp2 o0.w, r1.xyxx, r1.zwzz                                    // clipPosition.w = 自定义矩阵点乘
  34:   dp3 r0.w, cb0[1341].xyzx, cb0[1341].xyzx                      // 计算 inverseFaceRow0 长度平方
  35:   rsq r0.w, r0.w                                                // inverseLength(inverseFaceRow0)
  36:   mul r1.xyz, r0.wwww, cb0[1341].xyzx                           // tangent = normalize(inverseFaceRow0)
  37:   dp3 r0.w, cb0[1342].xyzx, cb0[1342].xyzx                      // 计算 inverseFaceRow1 长度平方
  38:   rsq r0.w, r0.w                                                // inverseLength(inverseFaceRow1)
  39:   mul r2.xyz, r0.wwww, cb0[1342].xyzx                           // bitangent = normalize(inverseFaceRow1)
  40:   dp3 r0.w, cb0[1343].xyzx, cb0[1343].xyzx                      // 计算 inverseFaceRow2 长度平方
  41:   rsq r0.w, r0.w                                                // inverseLength(inverseFaceRow2)
  42:   mul r3.xyz, r0.wwww, cb0[1343].xyzx                           // normal = normalize(inverseFaceRow2)
  43: else                                                            // 否则走常规对象到裁剪空间路径
  44:   mul r4.xyzw, r0.yyyy, cb0[1346].xyzw                          // clipPosition = worldPosition.y * viewProjRow1
  45:   mad r4.xyzw, cb0[1345].xyzw, r0.xxxx, r4.xyzw                 // clipPosition += worldPosition.x * viewProjRow0
  46:   mad r4.xyzw, cb0[1347].xyzw, r0.zzzz, r4.xyzw                 // clipPosition += worldPosition.z * viewProjRow2
  47:   add o0.xyzw, r4.xyzw, cb0[1348].xyzw                          // clipPosition += viewProjTranslation
  48:   mul r0.w, v6.w, cb1[9].w                                      // tangentHandedness = inputTangent.w * objectTangentScale
  49:   dp3 r4.x, v1.xyzx, cb1[4].xyzx                                // transformedNormal.x
  50:   dp3 r4.y, v1.xyzx, cb1[5].xyzx                                // transformedNormal.y
  51:   dp3 r4.z, v1.xyzx, cb1[6].xyzx                                // transformedNormal.z
  52:   dp3 r4.w, r4.xyzx, r4.xyzx                                    // normalLengthSq
  53:   max r4.w, r4.w, l(0.000000)                                   // 防止负长度平方
  54:   rsq r4.w, r4.w                                                // inverseNormalLength
  55:   mul r3.xyz, r4.wwww, r4.xyzx                                  // normal = normalize(transformedNormal)
  56:   mul r4.xyz, v6.yyyy, cb1[1].xyzx                              // transformedTangent = tangent.y * objectToWorldRow1
  57:   mad r4.xyz, cb1[0].xyzx, v6.xxxx, r4.xyzx                     // transformedTangent += tangent.x * objectToWorldRow0
  58:   mad r4.xyz, cb1[2].xyzx, v6.zzzz, r4.xyzx                     // transformedTangent += tangent.z * objectToWorldRow2
  59:   dp3 r4.w, r4.xyzx, r4.xyzx                                    // tangentLengthSq
  60:   max r4.w, r4.w, l(0.000000)                                   // 防止负长度平方
  61:   rsq r4.w, r4.w                                                // inverseTangentLength
  62:   mul r1.xyz, r4.wwww, r4.xyzx                                  // tangent = normalize(transformedTangent)
  63:   mul r4.xyz, r1.yzxy, r3.zxyz                                  // tangentNormalCrossPartA
  64:   mad r4.xyz, r3.yzxy, r1.zxyz, -r4.xyzx                        // bitangentBase = cross(normal, tangent)
  65:   mul r2.xyz, r0.wwww, r4.xyzx                                  // bitangent = bitangentBase * tangentHandedness
  66: endif                                                           // 结束脸部特殊路径分支
  67: add o7.xyz, -r0.xyzx, cb0[1295].xyzx                            // viewVector = cameraOrLightPosition - worldPosition
  68: add r0.w, -cb2[15].z, l(1.000000)                               // blinkStateInverse = 1 - cb2[15].z
  69: lt r0.w, r0.w, l(0.010000)                                      // blinkEnabled = blinkStateInverse < 0.01
  70: mul r4.x, cb0[1290].y, l(5.000000)                              // blinkWavePhase = time * 5
  71: sincos r4.x, null, r4.x                                         // blinkWave = sin(blinkWavePhase)
  72: add r4.x, r4.x, l(1.000000)                                     // blinkWave01_preScale = blinkWave + 1
  73: mad r4.x, r4.x, l(0.350000), l(0.200000)                        // blinkAmount = (wave + 1) * 0.35 + 0.2
  74: add r4.x, -r4.x, l(1.000000)                                    // blinkMaskValue = 1 - blinkAmount
  75: and o7.w, r0.w, r4.x                                            // blinkMask = blinkEnabled ? blinkMaskValue : 0
  76: mul r4.xyzw, v0.yyyy, cb1[1].xyzw                               // baseWorldPosition4 = localPosition.y * objectToWorldRow1
  77: mad r4.xyzw, cb1[0].xyzw, v0.xxxx, r4.xyzw                      // baseWorldPosition4 += localPosition.x * objectToWorldRow0
  78: mad r4.xyzw, cb1[2].xyzw, v0.zzzz, r4.xyzw                      // baseWorldPosition4 += localPosition.z * objectToWorldRow2
  79: add r4.xyzw, r4.xyzw, cb1[3].xyzw                               // baseWorldPosition4 += objectToWorldTranslation
  80: mul r5.xyzw, r4.yyyy, cb0[1346].xyzw                            // baseClipPosition = baseWorldPosition.y * viewProjRow1
  81: mad r5.xyzw, cb0[1345].xyzw, r4.xxxx, r5.xyzw                   // baseClipPosition += baseWorldPosition.x * viewProjRow0
  82: mad r5.xyzw, cb0[1347].xyzw, r4.zzzz, r5.xyzw                   // baseClipPosition += baseWorldPosition.z * viewProjRow2
  83: mad o10.xyzw, cb0[1348].xyzw, r4.wwww, r5.xyzw                  // baseClipPosition += baseWorldPosition.w * viewProjTranslation
  84: lt r0.w, l(0), cb1[32].x                                        // useAlternatePosition = cb1[32].x > 0
  85: movc r4.xyz, r0.wwww, v7.xyzx, v0.xyzx                          // selectedPosition = useAlternatePosition ? alternatePosition : localPosition
  86: mul r5.xyzw, r4.yyyy, cb1[25].xyzw                              // alternateWorldPosition = selectedPosition.y * alternateObjectRow1
  87: mad r5.xyzw, cb1[24].xyzw, r4.xxxx, r5.xyzw                     // alternateWorldPosition += selectedPosition.x * alternateObjectRow0
  88: mad r4.xyzw, cb1[26].xyzw, r4.zzzz, r5.xyzw                     // alternateWorldPosition += selectedPosition.z * alternateObjectRow2
  89: add r4.xyzw, r4.xyzw, cb1[27].xyzw                              // alternateWorldPosition += alternateObjectTranslation
  90: mul r5.xyzw, r4.yyyy, cb0[1353].xyzw                            // alternateClipPosition = alternateWorldPosition.y * alternateViewProjRow1
  91: mad r5.xyzw, cb0[1352].xyzw, r4.xxxx, r5.xyzw                   // alternateClipPosition += alternateWorldPosition.x * alternateViewProjRow0
  92: mad r5.xyzw, cb0[1354].xyzw, r4.zzzz, r5.xyzw                   // alternateClipPosition += alternateWorldPosition.z * alternateViewProjRow2
  93: mad o11.xyzw, cb0[1355].xyzw, r4.wwww, r5.xyzw                  // alternateClipPosition += alternateWorldPosition.w * alternateViewProjTranslation
  94: mov o1.xy, v3.xyxx                                             // packedUV.xy = mainUV
  95: mov o1.zw, v4.xxxy                                             // packedUV.zw = faceOffsetControl
  96: mov r3.w, r0.x                                                  // normalAndPosX.w = worldPosition.x
  97: mov o2.xyzw, r3.xyzw                                           // 输出 normalAndPosX
  98: mov r1.w, r0.y                                                  // tangentAndPosY.w = worldPosition.y
  99: mov o3.xyzw, r1.xyzw                                           // 输出 tangentAndPosY
 100: mov r2.w, r0.z                                                  // bitangentAndPosZ.w = worldPosition.z
 101: mov o4.xyzw, r2.xyzw                                           // 输出 bitangentAndPosZ
 102: mov o5.xyz, r0.xyzx                                            // worldPosition.xyz = worldPosition
 103: mov o5.w, l(0)                                                 // worldPosition.w = 0
 104: mov o6.xyz, v2.xyzx                                            // customVertexVectorOut.xyz = customVertexVector
 105: mov o6.w, l(0)                                                 // customVertexVectorOut.w = 0
 106: mov o8.xyzw, l(0.000000, 0.000000, 0.000000, 1.000000)          // constantAux = float4(0,0,0,1)
 107: mov o9.xyzw, l(0, 0, 0, 0)                                     // zeroAux = float4(0,0,0,0)
 108: ret                                                            // 结束顶点着色器
