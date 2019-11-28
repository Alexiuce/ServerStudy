//
//  JPGFormat.swift
//  CoreImageDemo
//
//  Created by alexiuce on 2019/11/27.
//  Copyright © 2019 alexiuce. All rights reserved.
//


 /**    pc_avatar.jpg        (一行32byte)
 段的一般结构
 -----------------------------------------------------------------
 名称    字节数 数据  说明
 -----------------------------------------------------------------
 段标识   1     FF    每个新段的开始标识
 段类型   1           类型编码（称作“标记码”）
 段长度   2           包括段内容和段长度本身,不包括段标识和段类型
 段内容               ≤65533字节
 -----------------------------------------------------------------
 　　说明：
 ①JPG 文件中所有关于宽度高度长度间隔这一类数据，凡是＞１字节的，均采用Motorola格式，即：高位在前，低位在后。
 ②有些段没有长度描述也没有内容，只有段标识和段类型。文件头和文件尾均属于这种段。
 ③段与段之间无论有多少FF都是合法的，这些FF称为“填充字节”，必须被忽略掉。
 
 
 
 <头部> <APP0（图像识别信息）>                                   <E1段>
 ff d8 ff e0 00 10 4a 46 49 46 00 01 01 00 00 48 00 48 00 00 ff e1 00 58 45 78 69 66 00 00 4d 4d
 00 2a 00 00 00 08 00 02 01 12 00 03 00 00 00 01 00 01 00 00 87 69 00 04 00 00 00 01 00 00 00 26
 00 00 00 00 00 03 a0 01 00 03 00 00 00 01 00 01 00 00 a0 02 00 04 00 00 00 01 00 00 00 50 a0 03
                                           <ED段>
 00 04 00 00 00 01 00 00 00 50 00 00 00 00 ff ed 00 38 50 68 6f 74 6f 73 68 6f 70 20 33 2e 30 00
 38 42 49 4d 04 04 00 00 00 00 00 00 38 42 49 4d 04 25 00 00 00 00 00 10 d4 1d 8c d9 8f 00 b2 04
                         <桢开始>        <⇣高度><⇣宽度>                              <DHT> <霍夫曼表>
 e9 80 09 98 ec f8 42 7e ff c0 00 11 08 00 50 00 50 03 01 22 00 02 11 01 03 11 01 ff c4 00 1f 00
 00 01 05 01 01 01 01 01 01 00 00 00 00 00 00 00 00 01 02 03 04 05 06 07 08 09 0a 0b ff c4 00 b5
 10 00 02 01 03 03 02 04 03 05 05 04 04 00 00 01 7d 01 02 03 00 04 11 05 12 21 31 41 06 13 51 61
 07 22 71 14 32 81 91 a1 08 23 42 b1 c1 15 52 d1 f0 24 33 62 72 82 09 0a 16 17 18 19 1a 25 26 27
 28 29 2a 34 35 36 37 38 39 3a 43 44 45 46 47 48 49 4a 53 54 55 56 57 58 59 5a 63 64 65 66 67 68
 69 6a 73 74 75 76 77 78 79 7a 83 84 85 86 87 88 89 8a 92 93 94 95 96 97 98 99 9a a2 a3 a4 a5 a6
 a7 a8 a9 aa b2 b3 b4 b5 b6 b7 b8 b9 ba c2 c3 c4 c5 c6 c7 c8 c9 ca d2 d3 d4 d5 d6 d7 d8 d9 da e1
 e2 e3 e4 e5 e6 e7 e8 e9 ea f1 f2 f3 f4 f5 f6 f7 f8 f9 fa ff c4 00 1f 01 00 03 01 01 01 01 01 01
 01 01 01 00 00 00 00 00 00 01 02 03 04 05 06 07 08 09 0a 0b ff c4 00 b5 11 00 02 01 02 04 04 03
 04 07 05 04 04 00 01 02 77 00 01 02 03 11 04 05 21 31 06 12 41 51 07 61 71 13 22 32 81 08 14 42
 91 a1 b1 c1 09 23 33 52 f0 15 62 72 d1 0a 16 24 34 e1 25 f1 17 18 19 1a 26 27 28 29 2a 35 36 37
 38 39 3a 43 44 45 46 47 48 49 4a 53 54 55 56 57 58 59 5a 63 64 65 66 67 68 69 6a 73 74 75 76 77
 78 79 7a 82 83 84 85 86 87 88 89 8a 92 93 94 95 96 97 98 99 9a a2 a3 a4 a5 a6 a7 a8 a9 aa b2 b3
 b4 b5 b6 b7 b8 b9 ba c2 c3 c4 c5 c6 c7 c8 c9 ca d2 d3 d4 d5 d6 d7 d8 d9 da e2 e3 e4 e5 e6 e7 e8
 e9 ea f2 f3 f4 f5 f6 f7 f8 f9 fa ff db 00 43 00 02 02 02 02 02 02 03 02 02 03 04 03 03 03 04 05
 04 04 04 04 05 07 05 05 05 05 05 07 08 07 07 07 07 07 07 08 08 08 08 08 08 08 08 0a 0a 0a 0a 0a
 0a 0b 0b 0b 0b 0b 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d ff db 00 43 01 02 02 02 03 03 03 06 03 03 06 0d
 09 07 09 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d
 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d 0d ff dd 00 04 00 05 ff da 00 0c 03
 01 00 02 11 03 11 00 3f 00 fd fc a2 8a fc ee fd a7 7f 69 cb 9b 6b 9b bf 87 1f 0e 6e cc 4d 19 68
 75 4d 4e 16 c3 87 1c 34 10 30 e9 8e 8e e3 9c fc aa 46 09 3e 76 67 99 d1 c0 d1 75 ab 3f 45 d5 b3
 e7 78 9f 89 f0 59 16 09 e3 31 8f c9 25 bc 9f 65 fa be 87 bc fc 5a fd a8 fc 03 f0 ca 49 b4 8b 36
 3a f6 b9 1e 55 ad 2d 5c 08 a1 71 da 69 b0 42 90 7a aa 86 61 dc 0a f8 2b c6 5f b5 af c6 1f 15 4a
 eb 63 a8 a6 83 68 d9 0b 0e 9a 82 36 00 fa ca db a5 cf b8 60 3d ab e6 66 66 76 2e e4 b3 13 92 4f
 24 d3 57 2e eb 14 60 bb b9 c2 aa 8c b3 13 d8 01 c9 35 f9 6e 61 c4 d8 ec 54 9a 52 e5 8f 65 a7 e3
 bb fe b4 3f 95 b8 8b c4 dc f3 36 a8 d4 2a 3a 54 fa 46 0d af be 5b bf c1 79 23 7f 56 f1 57 89 b5
 e9 0c ba de ad 7d 7e e7 8c dc dc 49 31 c7 fc 0d 8f 14 69 3e 2a f1 36 83 20 97 44 d5 af ac 1c 71
 9b 6b 89 21 38 ff 00 80 30 e2 bb 6d 13 e0 67 c6 2f 11 44 93 e9 3e 10 d5 1e 29 06 52 49 a2 fb 32
 30 f5 06 63 18 c5 1a df c0 cf 8c 5e 1d 89 e7 d5 bc 21 aa 24 51 8c bc 90 c5 f6 94 51 ea 4c 26 41
 8a f3 3e ab 8c fe 2f 24 bd 6c ff 00 33 e6 7f b2 73 ab 7d 6f d8 d4 ff 00 17 2c bf 3b 1e 8d e0 df
 da d7 e3 0f 85 65 45 be d4 53 5e b4 5c 06 87 52 41 23 10 3d 25 5d b2 e7 dc b1 1e d5 f7 af c2 5f
 da 8f c0 3f 13 64 87 48 bc 63 a0 eb 92 61 56 d2 e9 c1 8a 67 3d a1 9b 00 31 27 a2 b0 56 3d 81 af
 c6 f6 ca 3b 45 20 28 e8 70 ca c3 0c a4 76 20 f2 0d 39 59 91 83 a1 2a c0 e4 11 c1 15 e9 e5 fc 4d
 8e c2 c9 27 2e 68 f6 7a fe 3b af eb 43 e9 b8 77 c4 dc f3 29 a8 94 ea 3a b4 fa c6 6d bf ba 5b af
 c5 79 33 fa 26 a2 bf 3b bf 66 2f da 72 e6 e6 e6 d3 e1 c7 c4 6b b3 2b 48 56 1d 2f 53 99 b2 e5 cf
 0b 04 ec 7a e7 a2 39 e7 3f 2b 13 90 47 e8 8d 7e a5 96 66 74 71 d4 55 6a 2f d5 75 4c fe a9 e1 8e
 27 c1 67 b8 25 8c c1 bf 26 9e f1 7d 9f e8 fa 9f ff d0 fd 64 fd a8 fe 2d 49 f0 cb c0 26 cf 48 9b
 cb d6 f5 e2 f6 b6 8c a7 0f 0c 40 7e fa 61 df 2a 08 55 3d 99 81 ed 5f 8e 0c cc ec 5d c9 24 9c 92
 7b 9a fa 67 f6 b5 f1 94 be 2a f8 c5 a8 d9 23 ee b4 d0 91 34 d8 40 39 1b a3 1b a5 3f 5f 35 98 1f
 60 2b e6 26 de c5 63 89 4b bb 90 aa ab c9 66 27 00 0f 72 6b f1 ce 26 cc 65 8a c7 49 27 ee c7 45
 f2 dd fc df e8 7f 1a 78 99 c4 35 33 6c f6 a4 13 fd dd 26 e1 15 e8 ed 27 f3 7f 82 5d 8f 41 f8 6f
 f0 df 5e f8 9f ae be 93 a4 bc 76 76 76 71 9b 9d 4f 53 b9 3b 6d 6c 2d 57 96 92 46 38 19 c0 3b 57
 20 92 3b 00 48 fd 7b f8 49 f0 2f e1 b7 c3 1d 32 da eb c3 96 91 df df cb 12 3b 6a f7 2a 24 b9 97
 70 07 72 12 31 12 1c f0 a9 8e 3a e4 f3 5f 99 5f 1b af ae be 17 f8 2b 47 fd 9c fc 22 8e fa c6 a5
 14 1a 97 8a de d5 4b cf 77 7b 72 03 43 66 02 65 99 22 5c 1d a3 af cb ea 73 fa f3 e0 8d 5b 4a d6
 3c 2f a7 4f a4 5d 45 77 14 56 f1 40 e6 36 c9 49 62 40 ae 8e 3e f2 3a 91 86 56 01 81 ea 2b ea b8
 5b 01 87 a5 52 71 9c 6f 52 36 bb 7d 1b e8 bd 3a be fe 47 ea de 16 64 19 7e 17 13 56 95 5a 6a 58
 8a 6a 37 93 d7 96 4e f7 8c 57 f7 74 52 7b f3 36 b6 b5 fe 56 fd a3 3f 67 ff 00 1a f8 aa 1b df 19
 f8 13 c6 9a b5 a5 c5 bc 6f 71 2e 91 77 7d 30 b2 65 8d 4b 37 90 ca d9 84 e0 70 a4 32 93 fd da 4f
 d9 cf e0 07 8c bc 33 6d a7 f8 d7 c6 fe 36 d5 ef 27 ba 8a 3b a8 b4 9b 4b e9 fe c6 ab 22 86 5f 3d
 9d 89 98 e0 8c a8 0a b9 fe f5 7d 3d f1 1f 58 d3 b4 5f 04 6b 57 3a 95 cc 76 c2 5b 1b 98 21 f3 18
 03 2c d2 44 cb 1c 68 3a bb bb 70 aa a0 92 78 02 9d f0 ef 57 d2 b5 8f 06 69 12 e9 37 51 dd 24 16
 70 5b cb e5 9f 9a 29 a2 8d 55 e3 91 4f cc 8e 84 61 95 80 60 7a 8a fa 0f ec ac 2f d7 3d b5 bd eb
 5e d7 76 bf 7b 7f 48 fd 07 fd 55 ca ff 00 b6 be bb 67 ed 2d 7b 73 3b 5e fb f2 df fe 07 91 c3 7c
 59 f8 13 f0 e3 e2 8e 9d 71 3f 88 2c d2 c7 51 8e 36 64 d5 ed 55 63 b9 8b 68 ce 5d b1 89 50 77 57
 c8 c7 4c 1e 6b f2 0f e2 4f c3 7d 7b e1 86 bc 9a 4e ac f1 de 59 de 46 2e 74 cd 4a d8 ee b5 bf b5
 6c 15 92 36 19 19 c1 1b 97 27 04 f7 04 13 fb 7b e3 ad 63 4d d1 3c 27 aa 5d ea 77 31 5a a3 5a cd
 14 66 46 0b be 57 46 08 88 3a b3 b1 e1 54 64 93 c0 15 f9 13 f0 4a f2 f3 e2 77 82 b5 8f d9 cb c6
 09 24 7a ce 9b 0c da 97 85 5a e9 4a 4f 69 7b 6e a5 a6 b3 21 f0 ca 92 ae 4e d3 d3 e6 e3 81 8f 9f
 e2 9c 06 1e ad 48 46 11 b5 49 5e cd 75 6b 64 fd 7a 3e fe 47 e7 de 29 e4 19 7e 2b 11 4a 95 2a 6a
 38 8a 8a 56 92 d3 9a 4a d6 8c 97 57 2d 54 5e fc c9 2d af 6f 9e d5 99 18 3a 12 08 39 04 76 35 fb
 1f fb 2e 7c 5a 93 e2 6f 80 45 9e af 37 99 ad e8 25 2d 6e d9 8e 5e 68 88 fd cc c7 be 58 02 ac 7b
 b2 93 de bf 1b 17 7a 96 8e 55 28 e8 4a b2 b7 05 58 1c 10 7d c1 af a7 7f 64 af 19 4b e1 5f 8c 5a
 75 93 be db 4d 75 1f 4d 98 13 81 ba 41 ba 23 f5 f3 55 40 f6 26 be 57 86 73 19 61 71 d1 4d fb b2
 d1 fc f6 7f 27 fa 9f 94 f8 67 c4 35 32 9c f6 9c 1b fd dd 56 a1 25 ea ed 17 f2 7f 83 7d cf ff d1
 a5 e2 ad 5a 4d 7b c4 da b6 b7 29 cb df de dc 5c b1 f7 9a 46 7f eb 5d 4f c0 fd 1e 2f 11 fc 69 f0
 76 8f 3a 09 22 93 55 8a 69 10 f4 64 b6 cc e4 1f 6c 47 5c af 8a b4 99 34 1f 13 6a da 24 a3 0f 61
 7b 71 6c 40 f5 8a 46 4f e9 5b bf 04 f5 e8 fc 33 f1 bb c1 7a bd c4 82 28 53 56 86 09 5c f4 54 ba
 cc 04 9f 6c 49 5f 85 e0 d5 f1 b0 f6 bf cc af f7 ea 7f 09 64 b1 4f 3a a5 f5 bf f9 f9 1e 6f fc 09
 5c fd aa f0 ff 00 c2 bf 03 f8 6f c4 fa af 8d 6c 74 e4 97 5f d6 6e 1e 7b ad 4a e3 f7 d7 1f 3f 02
 38 d9 bf d5 c6 aa 02 85 40 38 03 39 3c d5 2f 1d f8 4e c6 1b 3d 4b c6 fa 14 d2 e8 ba fd 95 9c b3
 fd ba cf 0b f6 81 02 33 ac 77 51 10 63 b8 8f 8c 7c ea 59 47 dc 64 3c d5 1f 0b fc 71 f8 7d e2 7f
 1a 6b 1f 0e 12 fc 69 fe 28 d1 6e e4 b5 9b 4c bd c4 33 4c 13 95 96 df 27 6c d1 ba 90 c3 69 2c 01
 f9 94 54 fe 35 f1 6d b6 af 65 ab f8 1b c2 70 49 ae 6b 77 36 b3 d9 c9 1d a9 02 de c9 a7 8d 90 35
 dd c1 fd dc 3b 73 9d 99 69 48 fb b1 b5 7e ce bd 87 b2 7e ce d6 bb db bf f9 fe 27 f6 9a 78 07 86
 92 c3 72 da ef e1 df 9f 5b ed af 35 f7 eb 72 6f 02 78 46 c2 4b 3d 33 c6 ba ec 92 eb 3e 21 bc b3
 86 76 be be 21 da dc cf 1a b3 47 6b 18 02 2b 68 f2 71 88 d5 4b 0f be cc 79 a9 3c 6f e1 0b 01 05
 ff 00 8d 34 59 a5 d1 75 fb 4b 59 26 fb 7d 96 14 ce 20 42 cb 1d d4 44 18 ee 63 e3 18 91 4b 28 fb
 8c 87 9a 87 c1 de 32 b4 b2 4d 3b c1 1e 28 b7 93 41 d7 60 b7 8e da 2b 7b a6 06 0b df 25 02 96 b3
 b8 18 8e 70 40 ce c1 b6 55 1f 7a 35 a6 78 d3 c6 36 9a 8d b6 ab e0 7f 0a c3 26 bb ae dc 5b 4d 6b
 24 36 84 79 16 4d 32 15 0d 79 70 7f 77 00 19 ce c2 4c a4 7d d8 da ab f7 7e ca df f0 f7 fc ef f8
 95 7c 37 d5 6d d7 f1 e6 b7 df cd f8 8e f0 0f 84 ec 6e 34 fd 2b c7 1a fc 92 eb 3e 20 bd b2 82 e4
 de de 90 ff 00 67 37 11 ab b4 76 b1 00 22 b7 8c 13 8c 46 a1 98 7d f6 63 cd 68 78 8b e1 5f 82 7c
 4b e2 7d 27 c6 b7 ba 7a c3 af e8 b7 09 3d ae a5 6d fb ab 8f 93 83 1c 8c 3f d6 46 ca 4a 95 70 78
 27 18 3c d6 6f 83 3c 61 6b a6 c1 a5 f8 17 c5 76 ef a1 6b 96 f6 d1 5a c3 0d cb 06 b7 be 30 a0 5d
 d6 77 03 11 cd 90 33 b3 e5 95 47 de 8c 55 7f 12 fc 71 f8 77 e1 af 1a 69 1f 0e 1f 51 5b ff 00 13
 eb 37 71 da c3 a6 58 e2 69 a1 df cb 49 71 83 b6 14 45 05 8e e2 18 81 f2 a9 a9 6f 0f ec d2 a9 6b
 5d 6f df fc ff 00 12 1b cb d6 16 2b 11 cb 6b af 8b f9 f4 b6 fa f3 5f 6e b7 3f 1f 7e 38 68 f1 78
 73 e3 4f 8c b4 78 10 47 14 7a ac d3 46 83 a2 a5 ce 27 00 7b 62 4a e5 bc 2b ab 49 a0 f8 9b 49 d6
 e2 38 7b 0b db 7b 95 3e f0 c8 af fd 2b 6f e3 66 bd 1f 89 be 37 78 d3 57 b7 90 4b 0b ea d3 41 13
 8e 8c 96 b8 80 11 ed 88 eb 0f c2 ba 4c 9a f7 89 b4 9d 12 21 97 bf bd b7 b6 00 fa cb 22 a7 f5 af
 c6 31 8a d8 d9 fb 2f e6 76 fb f4 3f 8b 73 a8 a5 9d 55 fa a7 fc fc 97 2f fe 04 ec 7f ff d2 f6 ef
 da d7 c1 b2 f8 57 e3 16 a3 7a 89 b6 d3 5d 44 d4 a1 20 60 6e 90 6d 94 7d 7c d5 62 7d 88 af 93 af
 a3 90 11 2c 4c 51 d0 86 56 53 82 ac 0e 41 1e e0 f2 2b f6 9f f6 a3 f8 4b 27 c4 df 00 9b cd 22 1f
 33 5b d0 4b dd 5a 2a 8c bc d1 11 fb e8 47 7c b0 01 94 77 65 03 bd 7e 35 cf 09 e5 1c 10 c0 e0 83
 d4 1a fc 77 89 32 f9 61 31 d2 92 5e ec b5 5f 3d d7 c9 fe 87 f1 bf 89 3c 3f 53 28 cf 6a 4d 2f dd
 d5 6e 71 7e af de 5f 27 f8 5b b9 ed 7f 1d 74 77 f8 bb e0 7d 1f f6 90 f0 b8 6f ed 6d 3e 18 34 bf
 18 45 6e 48 9a d6 f6 d8 05 86 f7 e5 c3 2a 4a b8 1b 87 dd f9 79 e1 b1 fb 3d e1 1d 37 4e d2 bc 33
 a6 59 69 56 d1 5a 5b ad ac 4c b1 42 82 34 05 90 12 70 00 e4 9e 49 ea 4f 26 bf 05 7e 1e fc 4e f1
 1f c2 4f 10 3e b3 a3 47 1d ed 8d e4 66 db 54 d2 ee 86 eb 4d 42 d1 b8 68 a5 53 91 9c 13 b5 b0 4a
 93 dc 12 0f ec 77 c1 9f da 2b e1 67 c5 ed 36 de db c3 57 f1 e9 fa a4 71 aa 49 a2 dd b2 c5 77 09
 51 8c 46 a4 e2 54 1d 9a 3c 8c 75 00 f1 5f 5b c3 18 ea 15 67 29 ca 56 a9 2b 5d 77 6b aa f5 ea bb
 9f ae 78 5f 9e e0 71 55 ea d6 a9 35 1a f5 14 54 a2 fe d4 95 ef 28 bf ef 68 e4 b7 bd de d6 b7 a6
 7c 43 d3 74 dd 53 c0 fa e5 be ad 6b 15 dc 0b 61 73 2e c9 90 3a 87 8e 36 65 71 9e 8c a4 65 58 72
 0f 20 e6 93 e1 d6 99 61 a4 78 13 41 b3 d3 ad e2 b5 88 69 d6 ae c9 12 04 06 47 89 4b b1 03 ab 33
 12 58 9e 49 39 3c d7 c6 3f b4 cf ed 29 f1 1f c3 f1 6a 5e 03 f8 7d f0 ff 00 5a 73 73 1c b6 93 6b
 7a 86 9f 39 b6 29 20 28 c6 d6 34 53 e6 64 13 87 76 03 fd 93 55 7f 66 bf da 67 e2 9e b8 34 ff 00
 04 7c 44 f8 7b ad 4a 21 48 ed 62 d6 f4 dd 3a 64 85 55 00 55 37 51 3a aa a0 03 19 74 6c 7f b1 5e
 ef f6 a6 1b eb 7e cb 5b da d7 b3 fb af fd 23 ee 9f 14 e5 ab 36 fa ad df 3d ad 7e 57 6b df 6b db
 f1 db cc fb 97 c6 7a 4e 9b ad 78 5b 54 b0 d5 6d 61 bc 81 ad 66 6f 2a 64 0e bb 95 09 56 00 f4 65
 3c a9 1c 83 c8 39 af c6 4f 81 1a 2b 7c 20 f0 36 b1 fb 47 78 9c 11 ab 6a 10 4f a5 f8 3e 19 c9 33
 5d 5e dc 82 b3 5e fc df 31 48 97 3f 31 fb df 37 3c 8c fe a2 7c 65 fd a2 be 16 fc 20 d3 a7 b7 f1
 25 fc 7a 86 ab 24 6c b1 e8 b6 8c b2 dd ca 48 c6 1d 41 c4 48 7b b4 98 18 e8 09 e2 bf 1c 7e 21 7c
 4e f1 1f c5 bf 10 26 b3 ac c7 1d 95 8d 9c 62 db 4b d2 ed 46 db 4d 3e d1 78 58 a2 51 81 9c 01 b9
 b0 0b 11 d8 00 07 85 c4 f8 ea 14 a7 19 c6 57 a9 14 ec bb 37 d5 fa 74 5d cf 85 f1 43 3c c0 e1 6b
 d2 ad 4e 6a 58 8a 6a 49 45 74 93 b5 a5 27 fd dd 5c 56 f7 b3 d9 3b f1 96 31 c8 49 96 56 2e ee 4b
 33 31 c9 66 27 24 9f 72 6b eb 1f d9 2b c1 b2 f8 ab e3 16 9d 7a e9 ba d3 42 47 d4 a6 24 64 6e 8c
 6d 88 7d 7c d6 52 3d 81 af 98 60 84 f0 88 09 62 70 00 ea 4d 7e ca 7e cb 9f 09 64 f8 65 e0 11 79
 ab c3 e5 eb 7a f1 4b ab b5 61 87 86 20 3f 73 09 ef 95 04 b3 0e cc c4 76 af 92 e1 bc be 58 bc 74
 64 d7 bb 1d 5f cb 65 f3 7f a9 f9 1f 86 dc 3f 53 37 cf 69 cd af dd d2 6a 72 7e 8f dd 5f 37 f8 5f
 b1 ff d3 fd fc af ce ef da 77 f6 63 b9 b9 b8 bb f8 8f f0 e6 d0 ca d2 96 9b 54 d3 21 5c b9 73 cb
 4f 02 8e b9 ea e8 39 cf cc b9 c9 03 f4 46 8a f3 b3 3c b2 8e 3a 8b a3 59 7a 3e a9 9f 3b c4 fc 31
 83 cf 70 6f 07 8c 5e 69 ad e2 fb af d5 75 3f 9c cb bb 3d db 91 d7 0c 38 20 f5 06 b9 4b 9d 15 96
 65 9e 12 63 91 0e e4 74 3b 59 48 e8 41 1c 82 2b f7 1b e2 d7 ec b9 e0 1f 89 b2 4d ab d9 a9 d0 75
 c9 32 cd 77 6a 80 c5 33 9e f3 43 90 18 93 d5 94 ab 1e e4 d7 c1 1e 33 fd 92 3e 30 78 5a 57 6b 2d
 35 35 eb 45 ce d9 b4 d7 12 31 1e f1 36 d9 73 ec 14 8f 7a fc c3 1d c3 b8 fc 1c 9b 8c 79 a3 dd 6b
 f8 6e 8f e5 dc f7 c3 ac fb 26 a8 dc 29 ba b4 fa 4a 09 bf be 2b 55 f9 79 b3 c3 3c 39 f1 cb e3 9f
 85 a1 8e db 49 f1 ae ae b0 c4 30 91 4f 37 da 91 47 a0 13 89 06 29 7c 45 f1 cb e3 9f 8a 61 92 db
 56 f1 ae ae d0 ca 30 f1 c1 37 d9 51 81 ec 44 02 31 8a a1 ab f8 3b c4 9a 14 86 2d 73 49 bd d3 dc
 73 b6 e6 de 48 4e 3d 7e 75 1c 51 a4 78 3b c4 7a f4 82 2d 13 49 bd d4 1c f3 b6 da de 49 8e 3d 7e
 45 3c 57 9d f5 fc 67 f0 b9 a5 e9 77 f9 1f 3d fd bb 9c ff 00 bb 7b 5a 9f e1 e6 97 e4 79 8d be 8c
 cd 33 4f 31 2f 23 9d ce ee 4b 33 13 d4 92 79 26 ba bb 4b 3d bb 51 17 2c 78 00 75 26 be a4 f0 67
 ec 91 f1 83 c5 32 a3 5e e9 a9 a0 da 36 37 4d a9 38 8d 80 f6 89 77 4b 9f 62 a0 7b d7 de ff 00 09
 7f 65 cf 00 fc 32 92 1d 5e f1 4e bd ae 47 86 5b bb a4 02 28 5c 77 86 1c 90 a4 1e 8c c5 98 76 22
 bd 1c 0f 0e e3 f1 92 4e 51 e5 8f 77 a7 e1 bb fe b5 3e 87 22 f0 eb 3e ce 6a 27 3a 6e 95 3e b2 9a
 6b ee 8b d5 fe 5e 68 f0 6f d9 8b f6 63 b9 b6 b8 b4 f8 8f f1 1a d0 c4 d1 15 9b 4b d3 26 5c 38 71
 ca cf 3a 9e 98 ea 88 79 cf cc d8 c0 07 f4 46 8a 2b f4 fc b3 2c a3 81 a2 a8 d1 5e af ab 67 f5 17
                                                       <结尾>
 0c 70 c6 0f 22 c1 ac 1e 0d 79 b6 f7 93 ee ff 00 45 d0 ff d9
 
 
 
 
 
 
 */
