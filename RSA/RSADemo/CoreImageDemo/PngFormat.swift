//
//  PngFormat.swift
//  CoreImageDemo
//
//  Created by alexiuce on 2019/11/25.
//  Copyright © 2019 alexiuce. All rights reserved.
//


/**     headLineCurrentDot.png
 
        // 固定头部描述数据
        89 50 4e 47 0d 0a 1a 0a
       // 标准数据  IHDR
        00 00 00 0d 49 48 44 52
       <前四字节标识宽度,后四个字节标识高度>
        00 00 00 08 00 00 00 08
                       // IHDR CRC
        08 06 00 00 00 c4 0f be
           // sRGB 信息
        8b 00 00 00 01 73 52 47
                          // eXIf
        42 00 ae ce 1c e9 00 00
        00 78 65 58 49 66 4d 4d
        00 2a 00 00 00 08 00 04
        01 1a 00 05 00 00 00 01
        00 00 00 3e 01 1b 00 05
        00 00 00 01 00 00 00 46
        01 28 00 03 00 00 00 01
        00 02 00 00 87 69 00 04
        00 00 00 01 00 00 00 4e
        00 00 00 00 00 00 00 90
        00 00 00 01 00 00 00 90
        00 00 00 01 00 03 a0 01
        00 03 00 00 00 01 00 01
        00 00 a0 02 00 04 00 00
        00 01 00 00 00 08 a0 03
        00 04 00 00 00 01 00 00
        00 08 00 00 00 00 47 09
              // pHYs  物理像素尺寸数据块
        c3 f3 00 00 00 09 70 48
        59 73 00 00 16 25 00 00
                             // iDOT
        16 25 01 49 52 24 f0 00
        00 00 1c 69 44 4f 54 00
        00 00 02 00 00 00 00 00
        00 00 04 00 00 00 28 00
        00 00 04 00 00 00 04 00
                             // IDAT   图像数据
        00 00 70 b0 6c 16 2a 00
        00 00 3c 49 44 41 54 28
        15 62 60 00 02 e9 6d 0e
        32 e2 9b ac 96 89 6d b4
        7e 06 c2 20 36 48 0c 24
        07 93 7c 2b b6 d1 ea 3f
        32 06 2a 7a 0b 56 04 d1
        89 2a 09 53 08 92 63 80
        18 8b 5d 01 48 0e 00 00
                             // IDAT 图像数据
        00 ff ff d4 a5 ce 85 00 00 00 3b 49 44 41 54 63 10 db 68 fd 4c 6c a3 d5 7f ec d8 fa 19 83 f8 26
        ab 65 d8 25 ad fe 83 e4 18 a4 b7 39 c8 00 19 6f d1 15 81 c4 40 72 0c 20 00 55 04 34 09 64 9d f5
        33 90 4e 98 24 00 5f cc 6d b1 b7 49 ec 5a
        // IEND 图像结束数据(固定格式,必须在PNG文件最尾部)
         00 00 00 00 49 45 4e 44 ae 42 60 82
       
        */


 /**        cir_avatar.png
 固定头部描述数据           // IHDR
 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52
 00 00 00 50 00 00 00 50 08 04 00 00 00 24 18 3a
    // iCCP
 26 00 00 0c f3 69 43 43 50 6b 43 47 43 6f 6c 6f
 72 53 70 61 63 65 47 65 6e 65 72 69 63 47 72 61
 79 47 61 6d 6d 61 32 5f 32 00 00 58 85 a5 57 07
 58 53 c9 16 9e 5b 92 d0 12 7a 95 12 3a d2 0c 28
 5d 4a a4 06 90 5e 04 51 89 21 90 40 08 31 05 01
 b1 21 8b 2b b8 76 11 c1 b2 a2 a2 28 8b 1d 81 c5
 86 05 0b 6b 07 bb 0b ba 28 28 eb e2 2a 36 2c 6f
 12 8a 58 76 df fb be 77 f3 cd bd ff 9d 73 ce 9c
 3a 67 6e 00 50 e5 30 05 02 1e 0a 00 c8 e4 8b 85
 81 51 f4 84 29 09 89 54 d2 5d 20 07 b4 81 32 b0
 07 ca 4c 96 48 40 8f 88 08 85 2c 80 9f c5 67 83
 6f ae 57 ed 00 91 3e af d9 49 d7 fa 96 fe af 17
 21 85 2d 62 c1 e7 71 38 72 53 44 ac 4c 00 90 89
 00 90 ba 59 02 a1 18 00 79 33 38 6f 3a 5b 2c 90
 e2 20 88 35 32 62 a2 7c 21 4e 02 40 4e 69 48 56
 7a 19 05 b2 f9 6c 21 97 45 0d 14 32 73 a9 81 cc
 cc 4c 26 d5 d1 de 91 1a 21 cc 4a e5 f2 be 63 f5
 ff 7b 65 f2 24 23 ba e1 50 12 65 44 87 c0 a7 3d
 b4 bf 30 85 e9 27 c5 ae 10 ef 67 31 fd a3 87 f0
 93 6c 6e 5c 18 c4 3e 00 a0 26 02 f1 a4 28 88 83
 21 9e 29 c9 88 a5 43 6c 0b 71 4d aa 30 20 16 62
 2f 88 6f 72 24 41 52 3c 01 00 4c 2b 8f 13 13 0f
 b1 21 c4 c1 fc 99 61 e1 10 bb 43 cc 61 89 7c 13
 21 b6 82 b8 92 c3 66 48 f3 04 63 86 9d e7 8a 19
 31 10 43 7d d8 33 61 56 94 94 df 1a 00 7c 62 0a
 db cf 7f 70 1e 4f cd c8 0a 91 da 60 02 f1 41 51
 76 b4 ff b0 cd 79 1c df b0 41 5d 78 7b 3a 33 38
 02 62 0b 88 5f b2 79 81 51 83 eb 10 f4 04 e2 08
 e9 9a f0 9d e0 c7 e7 85 85 0e fa 45 28 65 8b 64
 fe c2 77 42 bb 98 13 23 cd 99 23 00 44 13 b1 30
 26 6a d0 36 62 4c 2a 37 80 01 71 00 c4 39 1c 61
 50 d4 a0 bf c4 a3 02 9e ac ce 60 4c 88 ef 85 92
 a8 d8 41 1f 49 01 6c 7e ac 74 4d 69 5d 2c 60 0a
 fd 03 07 63 45 6a 02 71 08 13 b0 41 16 98 09 ef
 2c c0 07 9d 80 0a 44 80 0b b2 65 28 0d 30 41 26
 1c 54 68 81 2d 1c 81 90 8b 0f 87 10 72 88 40 86
 8c 43 08 ba 46 e8 c3 12 52 19 01 a4 64 81 54 c8
 c9 83 72 c3 b3 54 90 02 e5 07 e5 a4 6b 64 c1 21
 7d 93 ae db 2d 9b 63 0d e9 b3 87 c3 d7 70 3b 90
 c0 37 0e e8 85 74 0e 44 93 41 87 6c 26 07 da 97
 09 9f be 70 56 02 69 69 10 8f d6 32 28 1f 21 b3
 75 d0 06 ea 90 f5 3d 43 5a b2 64 b6 30 47 e4 3e
 db e6 0b e9 7c 90 07 67 44 c3 9e e1 da 38 0d 1f
 0f 87 07 1e 8a 7b e2 34 99 94 10 72 e4 02 3b d9
 fc 44 d9 dc b0 d6 cf 9e 4b 7d eb 19 d1 3a 0b da
 3a da fb d1 f1 1a 8e e1 09 28 25 86 ef 3c e8 21
 7f 28 3e 22 68 cd 7b 28 93 31 24 fd 95 9f 2b f4
 24 56 02 41 e9 b2 48 c6 f4 aa 11 2b a8 05 c2 19
 5c d6 a5 e5 7d ff 92 b5 6f b5 db 7d 91 b7 f0 d1
 75 21 ab 94 94 6f ea 02 ea 22 5c 25 5c 26 dc 27
 5c 07 54 f8 fc 83 d0 46 e8 86 e8 0e e1 2e fc dd
 fa 6e 54 b2 46 62 90 06 47 d6 48 05 b0 bf c8 0d
 1b 72 f2 64 5a be b5 f3 73 ce 06 d7 f9 6a 05 04
 1b e1 a4 cb 56 91 52 33 e1 e0 ca 78 44 23 f9 93
 40 2c 86 f7 54 99 b4 dd 57 b9 0b fc 5a 6f 4b 7e
 93 0e a0 b6 2f 3d 7e 0e 50 6b 54 1a ce 7e 8e 76
 1b 5e 9f 74 4d a9 25 3f 95 bf 42 4f 20 98 5e 95
 3f c0 16 7c a6 4a f3 c0 5e 1c f6 2a 0c 14 d8 d2
 f6 d2 7a 69 db 68 35 b4 17 b4 fb 9f 39 68 37 68
 7f d2 da 68 5b 20 e5 29 b6 1a 3b 84 1d c1 1a b0
 46 ac 15 50 e1 5b 23 76 02 6b 90 a1 1a ac 09 fe
 f6 fd 43 85 a7 7d a7 c2 a5 15 c3 1a aa 68 29 55
 3c 54 53 a3 6b 7f 74 64 e9 a3 a2 25 e5 1f 8e 70
 fa 3f d4 eb e8 8a 91 66 ec 7f b3 68 f4 3a 5f 76
 04 f6 e7 5d 47 31 a5 38 50 48 14 6b 8a 13 85 4e
 41 28 c6 f0 e7 48 f1 81 c8 94 62 42 09 a5 68 43
 6a 10 c5 92 e2 47 19 33 12 8f e1 5a e7 0d 65 98
 fb c5 fe 1e b4 38 01 52 87 2b 81 2f eb 2e 4c c8
 29 e5 60 0e f9 fb b5 8f d4 2f bc 94 7a c6 1d bd
 ab 10 32 dc 55 dc 51 3d e1 7b bd 88 fa c5 ce 8a
 85 b2 5c 30 5b 26 2f 92 ed 76 be 4c 4e f0 45 fd
 89 64 5d 08 ce 20 53 65 39 fc 8e 6d b8 21 ee 80
 33 60 07 0a 07 54 9c 8e 3b e1 3e 43 78 b0 2b 0d
 f7 25 59 a6 70 6f 48 f5 c2 fd 70 57 69 1f fb a2
 2f b0 fe ab f5 a3 77 06 9b e8 4e b4 24 fa 13 2d
 3f d3 89 7e c4 20 62 00 7c 3a 48 e7 89 e3 88 c1
 10 bb 49 b9 c4 ec 1c b1 f4 90 f7 cd 12 e4 0a b9
 69 1c 31 95 0e bf 72 d8 54 06 9f 65 6f 4b 75 a4
 39 c0 d3 4d fa cd 34 f8 29 f0 22 52 f6 2d 84 68
 b5 b2 24 c2 ec c1 39 5c 7a 23 00 05 f8 3d a5 01
 74 e1 a9 6a 0a 4f 6b 3b a8 d5 05 78 c0 33 d3 1f
 9e 77 e1 20 06 e6 75 3a f4 83 03 ed 16 c2 c8 e6
 83 85 a0 08 94 80 15 60 2d 28 07 9b c1 36 50 0d
 6a c1 7e 70 18 34 c1 1e 7b 06 5c 00 97 41 1b b8
 03 cf 93 2e f0 14 f4 81 57 60 00 41 10 12 42 46
 d4 11 5d c4 08 31 47 6c 10 47 c4 15 f1 42 fc 91
 50 24 0a 49 40 92 91 34 84 8f 48 90 7c 64 11 52
 82 ac 42 ca 91 2d 48 35 b2 0f 69 40 4e 20 e7 90
 2b c8 2d a4 13 e9 41 fe 46 de a1 18 aa 84 6a a0
 06 a8 05 3a 0e 75 45 e9 68 08 1a 83 4e 43 d3 d0
 59 68 1e 5a 88 2e 43 cb d0 4a b4 06 ad 43 4f a0
 17 d0 36 b4 03 7d 8a f6 63 00 53 c4 b4 30 63 cc
 0e 73 c5 7c b1 70 2c 11 4b c5 84 d8 3c ac 18 2b
 c5 2a b1 5a d8 03 5a b0 6b 58 07 d6 8b bd c5 89
 b8 3a 4e c5 ed 60 16 83 f0 58 9c 85 cf c2 e7 e1
 4b f1 72 7c 27 5e 87 9f c2 af e1 9d 78 1f fe 91
 40 26 e8 13 6c 08 ee 04 06 61 0a 21 8d 30 9b 50
 44 28 25 54 11 0e 11 4e c3 0e dd 45 78 45 24 12
 b5 60 7e 5c 60 de 12 88 e9 c4 39 c4 a5 c4 8d c4
 3d c4 e3 c4 2b c4 87 c4 7e 12 89 a4 4b b2 21 79
 92 c2 49 4c 92 98 54 44 5a 4f aa 21 1d 23 5d 25
 75 91 de c8 29 ca 19 c9 39 ca 05 c8 25 ca f1 e5
 0a e4 4a e5 76 c9 1d 95 bb 2a f7 58 6e 40 5e 45
 de 5c de 5d 3e 5c 3e 45 3e 57 7e b9 fc 36 f9 46
 f9 4b f2 5d f2 03 0a aa 0a 96 0a 9e 0a 31 0a e9
 0a 0b 15 ca 14 6a 15 4e 2b dc 55 78 a1 a8 a8 68
 a2 e8 a6 18 a9 c8 55 5c a0 58 a6 b8 57 f1 ac 62
 a7 e2 5b 25 35 25 6b 25 5f a5 24 25 89 d2 32 a5
 1d 4a c7 95 6e 29 bd 20 93 c9 16 64 1f 72 22 59
 4c 5e 46 ae 26 9f 24 df 27 bf a1 a8 53 ec 29 0c
 4a 0a 65 3e a5 82 52 47 b9 4a 79 a6 2c af 6c ae
 4c 57 9e ae 9c a7 5c aa 7c 40 f9 92 72 af 8a bc
 8a 85 8a af 0a 53 65 9e 4a 85 4a 83 ca 0d 95 7e
 55 75 55 07 d5 70 d5 4c d5 a5 aa bb 54 cf a9 76
 ab 91 d4 2c d4 fc d5 52 d4 0a d5 b6 aa 9d 54 7b
 a8 8e a9 9b aa fb aa b3 d4 17 a9 6f 53 3f ad de
 a5 41 d4 b0 d4 60 68 a4 6b 94 68 fc a2 71 51 a3
 4f 53 4d 73 82 66 9c 66 8e 66 85 e6 11 cd 0e 2d
 4c cb 42 8b a1 c5 d3 5a ae b5 5f ab 5d eb 9d b6
 81 36 5d 9b ad bd 44 bb 56 fb aa f6 6b 9d 31 3a
 3e 3a 6c 9d 62 9d 3d 3a 6d 3a ef 74 a9 ba fe ba
 19 ba 2b 75 0f eb de d3 c3 f5 ac f5 22 f5 66 eb
 6d d2 3b ad d7 3b 46 63 8c c7 18 d6 98 e2 31 fb
 c7 dc d6 47 f5 ad f5 a3 f4 e7 e8 6f d5 6f d5 ef
 37 30 34 08 34 10 18 ac 37 38 69 d0 6b a8 65 e8
 63 98 6e b8 c6 f0 a8 61 8f 91 ba 91 97 11 d7 68
 8d d1 31 a3 27 54 4d 2a 9d ca a3 96 51 4f 51 fb
 8c f5 8d 83 8c 25 c6 5b 8c 2f 1a 0f 98 58 9a c4
 9a 14 98 ec 31 b9 67 aa 60 ea 6a 9a 6a ba c6 b4
 d9 b4 cf cc c8 6c b2 59 be d9 6e b3 db e6 f2 e6
 ae e6 1c f3 75 e6 2d e6 af 2d 2c 2d e2 2d 16 5b
 1c b6 e8 b6 d4 b1 64 58 e6 59 ee b6 bc 6b 45 b6
 f2 b6 9a 65 55 69 75 7d 2c 71 ac eb d8 8c b1 1b
 c7 5e b6 46 ad 9d ac 39 d6 15 d6 97 6c 50 1b 67
 1b ae cd 46 9b 2b b6 04 5b 37 5b be 6d a5 ed 0d
 3b 25 3b ba 5d b6 dd 6e bb 4e 7b 2d fb 50 fb 02
 fb c3 f6 cf c6 99 8d 4b 1c b7 72 5c cb b8 8f 34
 27 1a 0f 9e 6e 77 1c d4 1c 82 1d 0a 1c 1a 1d fe
 76 b4 76 64 39 56 38 5e 1f 4f 1e 1f 30 7e fe f8
 fa f1 cf 27 d8 4c 60 4f d8 34 e1 a6 93 ba d3 64
 a7 c5 4e cd 4e 1f 9c 5d 9c 85 ce b5 ce 3d 2e 66
 2e c9 2e 1b 5c 6e b8 6a b8 46 b8 2e 75 3d eb 46
 70 9b e4 36 df ad c9 ed ad bb b3 bb d8 7d bf fb
 5f 1e 76 1e 19 1e bb 3c ba 27 5a 4e 64 4f dc 36
 f1 a1 a7 89 27 d3 73 8b 67 87 17 d5 2b d9 eb 67
 af 0e 6f 63 6f a6 77 a5 f7 03 1f 53 9f 14 9f 2a
 9f c7 f4 b1 f4 74 7a 0d fd d9 24 da 24 e1 a4 43
 93 5e fb ba fb ce f5 3d ee 87 f9 05 fa 15 fb 5d
 f4 57 f3 8f f5 2f f7 bf 1f 60 12 90 16 b0 3b a0
 2f d0 29 70 4e e0 f1 20 42 50 48 d0 ca a0 1b 0c
 03 06 8b 51 cd e8 0b 76 09 9e 1b 7c 2a 44 29 24
 3a a4 3c e4 41 a8 75 a8 30 b4 71 32 3a 39 78 f2
 ea c9 77 c3 cc c3 f8 61 87 c3 41 38 23 7c 75 f8
 bd 08 cb 88 59 11 bf 46 12 23 23 22 2b 22 1f 45
 39 44 e5 47 b5 44 ab 47 cf 88 de 15 fd 2a 66 52
 cc f2 98 3b b1 56 b1 92 d8 e6 38 e5 b8 a4 b8 ea
 b8 d7 f1 7e f1 ab e2 3b a6 8c 9b 32 77 ca 85 04
 bd 04 6e 42 7d 22 29 31 2e b1 2a b1 7f aa ff d4
 b5 53 bb 92 9c 92 8a 92 da a7 59 4e cb 99 76 6e
 ba de 74 de f4 23 33 94 67 30 67 1c 48 26 24 c7
 27 ef 4a 7e cf 0c 67 56 32 fb 67 32 66 6e 98 d9
 c7 f2 65 ad 63 3d 4d f1 49 59 93 d2 c3 f6 64 af
 62 3f 4e f5 4c 5d 95 da 9d e6 99 b6 3a ad 87 e3
 cd 29 e5 f4 72 7d b9 e5 dc e7 e9 41 e9 9b d3 5f
 67 84 67 ec c8 f8 c4 8b e7 ed c9 94 cb 4c ce 6c
 e0 ab f1 33 f8 a7 b2 0c b3 72 b2 ae 08 6c 04 45
 82 8e 59 ee b3 d6 ce ea 13 86 08 ab 44 88 68 9a
 a8 5e ac 01 ff 60 b6 4a ac 24 3f 48 3a b3 bd b2
 2b b2 df cc 8e 9b 7d 20 47 35 87 9f d3 9a 6b 9d
 bb 24 f7 71 5e 40 de f6 39 f8 1c d6 9c e6 7c e3
 fc 85 f9 9d 73 e9 73 b7 cc 43 e6 cd 9c d7 3c df
 74 7e e1 fc ae 05 81 0b 76 2e 54 58 98 b1 f0 b7
 02 5a c1 aa 82 97 8b e2 17 35 16 1a 14 2e 28 7c
 f8 43 e0 0f bb 8b 28 45 c2 a2 1b 8b 3d 16 6f fe
 11 ff 91 fb e3 c5 25 e3 97 ac 5f f2 b1 38 a5 f8
 7c 09 ad a4 b4 e4 fd 52 d6 d2 f3 3f 39 fc 54 f6
 d3 a7 65 a9 cb 2e 2e 77 5e be 69 05 71 05 7f 45
 fb 4a ef 95 3b 57 a9 ae ca 5b f5 70 f5 e4 d5 75
 6b a8 6b 8a d7 bc 5c 3b 63 ed b9 d2 09 a5 9b d7
 29 ac 93 ac eb 28 0b 2d ab 5f 6f b6 7e c5 fa f7
 e5 9c f2 b6 8a 49 15 7b 36 e8 6f 58 b2 e1 f5 c6
 94 8d 57 37 f9 6c aa dd 6c b0 b9 64 f3 bb 9f b9
 3f df dc 12 b8 a5 ae d2 a2 b2 74 2b 71 6b f6 d6
 47 db e2 b6 b5 6c 77 dd 5e 5d a5 57 55 52 f5 61
 07 7f 47 c7 ce a8 9d a7 aa 5d aa ab 77 e9 ef 5a
 be 1b dd 2d d9 dd 53 93 54 73 f9 17 bf 5f ea 6b
 ed 6a b7 ec d1 da 53 b2 17 ec 95 ec 7d b2 2f 79
 5f fb fe 90 fd cd 07 5c 0f d4 1e 34 3f b8 e1 90
 fa a1 e2 3a a4 2e b7 ae ef 30 e7 70 47 7d 42 fd
 95 86 e0 86 e6 46 8f c6 43 bf da ff ba a3 c9 b8
 a9 e2 88 e6 91 e5 47 15 8e 16 1e fd 74 2c ef 58
 ff 71 c1 f1 de 13 69 27 1e 36 cf 68 be 73 72 ca
 c9 eb a7 22 4f 5d 3c 1d 72 fa ec 99 80 33 27 5b
 e8 2d c7 ce 7a 9e 6d 3a e7 7e ae e1 bc eb f9 c3
 17 9c 2f d4 b5 3a b5 1e fa cd e9 b7 43 17 9d 2f
 d6 5d 72 b9 54 7f d9 ed 72 e3 95 89 57 8e 5e f5
 be 7a e2 9a df b5 33 d7 19 d7 2f b4 85 b5 5d 69
 8f 6d bf 79 23 e9 46 c7 cd 94 9b dd b7 78 b7 9e
 df ce be 3d 70 67 01 fc 88 2f be a7 72 af f4 be
 fe fd ca df c7 fe be a7 c3 b9 e3 48 a7 5f 67 eb
 83 e8 07 77 1e b2 1e 3e fd 43 f4 c7 fb ae c2 47
 e4 47 a5 8f 8d 1e 57 77 3b 76 37 f5 04 f4 5c 7e
 32 f5 49 d7 53 c1 d3 81 de a2 3f 55 ff dc f0 cc
 ea d9 c1 bf 7c fe 6a ed 9b d2 d7 f5 5c f8 fc d3
 df 4b 5f e8 be d8 f1 72 c2 cb e6 fe 88 fe fb af
 32 5f 0d bc 2e 7e a3 fb 66 e7 5b d7 b7 2d ef e2
 df 3d 1e 98 fd 9e f4 be ec c3 d8 0f 8d 1f 43 3e
 de fd 94 f9 e9 d3 7f 00 2d 5d f0 1c ea b6 f5 80
 // eXIf
 00 00 00 6c 65 58 49 66 4d 4d 00 2a 00 00 00 08
 00 04 01 1a 00 05 00 00 00 01 00 00 00 3e 01 1b
 00 05 00 00 00 01 00 00 00 46 01 28 00 03 00 00
 00 01 00 02 00 00 87 69 00 04 00 00 00 01 00 00
 00 4e 00 00 00 00 00 00 00 90 00 00 00 01 00 00
 00 90 00 00 00 01 00 02 a0 02 00 04 00 00 00 01
 00 00 00 50 a0 03 00 04 00 00 00 01 00 00 00 50
                         // PHYs
 00 00 00 00 5b ca a5 49 00 00 00 09 70 48 59 73
                                        // iDOT
 00 00 16 25 00 00 16 25 01 49 52 24 f0 00 00 00
 1c 69 44 4f 54 00 00 00 02 00 00 00 00 00 00 00
 28 00 00 00 28 00 00 00 28 00 00 00 28 00 00 05
                // IDAT
 e5 96 31 6c bd 00 00 05 b1 49 44 41 54 68 05 ac
 99 dd 52 13 49 14 c7 03 55 a2 55 be 80 de 80 f2
 02 7a 83 2f 61 15 de 8b 2f a0 4f c0 43 ac de 59
 b1 bc d1 f2 0d fc b8 e4 5e 37 81 45 5d d9 5d 5c
 95 6c 22 b0 a0 10 be 92 4c f7 0c 39 fb 3f d3 39
 74 f7 4c 0f 99 c0 a6 2f 18 3b dd 7d 7e fd 3f 1f
 dd 13 2b 95 73 7d 68 bc 37 a5 67 92 39 5d 8d 16
 a2 65 d5 54 5d b4 66 b4 1c 2d e8 2a 7a 67 7a 53
 34 7e 2e 03 67 9f dc 9b 8e ee c4 8f a2 77 7a 5d
 25 44 c7 94 50 4c 9a 14 9a c6 53 82 1e 22 95 e8
 f5 e8 1d 46 dd e9 4d 9f dd d2 c8 33 e9 aa 9a d3
 2f f5 16 08 f0 39 1e 60 31 5a b6 e9 14 93 47 e9
 2d fd 52 cd d1 d5 91 8d 8d 3a 41 df 3c 7e 1c 37
 d8 64 92 c3 c9 e2 b9 ff 86 c8 f8 c4 8d e3 c7 fa
 e6 a8 36 4b 8f d7 b7 e2 e7 f1 01 6b e6 9a 1e e5
 99 dd 1e 1f c4 cf f5 ad d2 46 cb 0e ec 4e 26 4f
 92 0e 96 3f 33 9c 6c 24 06 64 d2 49 9e 74 27 cb
 da 1e 3a 8e 2e ea 07 ba f5 7f c0 b9 90 ba a5 1f
 d0 c5 a1 c6 87 0f e8 4d 27 af 89 fa e7 56 4e e0
 e4 6f 9f 95 7c 7d ee ec 8e 66 f5 1a ca 45 41 8b
 a8 5c 2b 9a 8f ec 5e 8b 66 87 8b 54 30 82 c6 e2
 f9 7e 14 d2 ae 1c 56 68 54 16 b5 4f fd 28 9e a7
 b1 02 84 d3 ba 69 42 3d ec 07 8a 49 c8 ec 28 7d
 59 c4 84 c3 e7 21 4d 9c c6 12 f8 8e 2e eb 67 70
 40 c6 b5 61 90 1e 15 b7 f0 8c c8 5b 57 23 1a a3
 67 74 39 80 51 d4 45 13 98 50 02 cf 82 75 29 df
 ec b7 21 4c 57 c9 01 62 59 15 69 3c fe 25 8b 97
 35 21 c6 05 ab 43 f9 26 df c9 d8 ec 1a 59 44 58
 2d 77 b1 40 6a 64 0a 72 76 69 31 d9 81 6e 02 76
 44 7e 93 7e 83 69 66 64 d7 71 11 63 c4 62 3c 5f
 e4 53 a7 3f be 9d e0 7a e2 4e f5 97 35 a6 8c 59
 86 10 ac 43 f2 9b e9 17 4c de 4a 08 d2 b5 93 50
 a2 e2 db 0e 4a e8 91 ae eb 35 bf b0 84 f0 c4 2c
 43 08 d6 01 f9 cd f4 f3 f7 47 03 95 87 23 f6 51
 17 e9 7a 88 6b d0 47 97 d4 1b bf 2c e7 f1 58 3b
 03 68 e0 2c d6 3e ed 0d da 3e 60 f7 d1 f8 3b 01
 e5 39 3c 37 af a3 ab 22 ac bf a1 4b 85 88 d1 7d
 3f 39 42 78 2e dc 61 8a b0 4f 3b b4 4e df 68 95
 56 e8 77 fa 44 7f d1 17 6a d1 0f c0 32 a6 40 fa
 3a fa 2b 5b c4 34 9f ef 17 00 b6 a7 74 cb bd 4a
 f9 8b f0 ce 45 3b a3 0a 9b de a3 0d fa 93 96 69
 91 6a 54 3f 69 fc fc 1b 70 5b d4 4e 95 64 4c 9e
 63 20 4f 57 11 17 e0 56 7b 2a 88 18 3d 2d 76 af
 c5 b3 8e dd 07 dc 0a d0 18 6c 31 d0 b8 ff 23 7d
 c7 26 8c bb b3 88 ae 00 56 43 c5 65 fb 69 00 10
 af 3e 5d ff b6 67 17 08 e1 fd 84 4b 19 2e 84 66
 fb 18 f2 0f b8 db 46 a4 ab a2 b5 e0 9e 2d 78 a3
 e9 ea 99 1c 62 f4 a2 48 bf 10 de 16 a2 6d 18 9c
 60 d6 e8 3d 6d 0e 55 31 a3 e1 8b 0c a0 ba 81 ab
 b8 53 fd dc bd 59 40 76 12 47 de 06 a2 ae 2c 1e
 63 d6 69 89 9a 40 e4 b4 e1 68 34 2a f2 ba 3d e7
 c2 66 11 63 bc 18 a8 1b 1e 62 54 1d ae 9f e0 6d
 8e 88 27 4a b6 d2 68 34 e9 62 6a 41 11 60 1a 87
 55 07 f0 e8 8a 6a ba f9 ab 4e f6 65 d5 e3 e4 e0
 b2 f1 03 0e 1b 45 3d c1 5b 84 8a eb 40 64 15 79
 ab a6 2e ba 88 56 41 c5 2f 66 cd a3 2b 27 88 c9
 5d ff f4 c8 03 1a bc 03 94 8d 95 33 e2 b1 a3 df
 a7 d5 d1 14 1d eb 66 1b 4e 2e 22 ee a2 77 07 80
 34 a6 5e 15 3b d8 9c 1c bc 67 ce c4 6f 23 e3 b9
 6a 73 46 b7 53 47 f3 7a 79 44 17 10 44 af 06 37
 6d ba a6 b6 c3 d7 03 76 00 bb 42 dc bb 8d f2 eb
 1a b4 ee 2b 7e 5a 85 6b ed b7 75 fa 27 e0 66 d1
 d0 05 04 d1 36 5d 4b 35 4c 66 7d fd 5c 07 9b b3
 43 f4 fb 3c 12 1e 6f 65 0b 97 28 57 75 76 f3 4e
 aa a1 64 b3 39 57 42 88 78 eb 33 2f 54 ea 91 0f
 28 83 25 41 5c fd ac 16 c3 9e ea c8 f5 9f 38 15
 f8 74 ff 84 83 50 c6 d7 a9 71 a2 e1 50 27 3f 82
 82 74 41 bf 2d 02 f4 e3 ef eb 08 fa d5 10 6d f8
 21 02 fa f1 fb ef a1 13 1a 7c fc ed a4 67 b4 c9
 65 73 c3 11 51 5c 27 63 6b 6f e9 42 85 26 d5 46
 51 89 61 07 8b 7e bb 58 b8 5c fc f1 a8 06 ee e4
 06 cf 20 6e 7a 73 bf a7 a9 22 4e ee 38 e5 da 05
 04 d5 06 4d 56 3a 33 b1 76 cf 10 89 c0 6c 82 fc
 eb 05 bb 38 2c ff b7 0e 87 b6 01 67 f1 18 91 23
 51 dc 5c c7 29 de 46 f3 eb a1 d1 d0 05 c4 79 a2
 3b 33 15 75 cf 77 b0 05 f4 13 a4 e1 69 90 07 e3
 9e 1a 5c d9 f2 b4 33 70 ec 66 8d 0a 6a 10 eb f4
 01 d1 c9 17 31 d1 90 13 25 0f c8 e7 89 ba 57 89
 aa 7e 91 96 68 30 b7 3f 71 70 9b fe 1e 02 c8 70
 5f d3 b8 cb 6a 67 20 09 c1 22 67 d0 12 b2 9b eb
 a1 0b 18 42 ec 53 54 ad a8 85 50 0d f4 1d bc 47
 bb a7 9c 20 f5 54 b9 2f 48 05 fe 88 66 f9 bf 84
 55 96 06 db e4 ab 2c df 13 f3 e5 da 75 32 c8 16
 2a 7a f9 b4 08 34 15 70 0f 79 17 4a 11 73 87 fe
 88 9b 0a 67 ec 69 70 a2 e2 46 0a 58 a3 35 00 ee
 a6 80 f6 54 16 df 59 44 fc ea bd 5c 51 4d f7 07
 0e 19 24 d7 7b 03 d8 46 cc 88 7b 4c f4 b1 6a 5c
 e9 56 69 1b d1 55 06 4e 14 6d 60 66 0d c1 b0 9b
 02 ba 4e 16 db 16 10 64 cd 0a fe db 20 70 0f 74
 23 70 0f bb 95 3b 0c 6b c6 a1 fe 81 3e 03 ad 97
 56 b9 e1 ca 09 1c 27 cb 31 f2 f9 57 bc 56 31 a0
 c9 64 29 d7 79 40 90 75 ff 03 00 00 ff ff bd 22
 76 f9 00 00 06 b3 49 44 41 54 c5 98 db 52 13 59
 14 86 1b ab 44 ab 7c 01 bd 01 f5 05 f4 06 5f c2
 2a bc 17 1f c0 f2 09 78 88 91 3b 0b cb 9b b1 7c
 04 f4 6a 8a 19 40 54 20 e9 a4 41 99 19 a7 1c 07
 0c 27 09 e1 90 90 74 d2 07 58 f3 af 5e 59 d9 9d
 4e 0b 21 30 35 ee 32 9d 74 ef de fb eb ff 5f 6b
 ed dd 58 9e eb 91 69 0d 92 56 a7 1a 5a 95 0e a9
 42 07 b4 47 3b e4 50 86 6c 5a a2 cf b4 8e 33 3e
 1d 13 ff 3b 3e 73 23 0a e9 6f fa 42 bb 18 75 1f
 a3 1f a2 f1 5c f5 e6 cc 8d 18 0d b8 5c cb 2b f8
 b1 53 ed 80 7c 73 05 c3 ec 61 b8 75 40 56 5b 60
 bd a0 e9 c3 30 e2 3e 95 12 80 6e 0b d1 c8 05 b2
 82 e5 e7 83 0e c0 3a 3a f3 53 29 e0 3e 05 91 5e
 bd 69 a6 60 f1 23 61 06 56 b0 dc 52 30 0d 30 20
 3f 6f 79 93 e1 a9 80 8d 9e cc 8c 03 75 7e 27 f8
 71 1a 20 c8 26 ad c6 f8 71 2a a0 db 54 b0 8c a7
 0c cf 1c 69 9d 40 c9 33 84 98 3b 0d f0 98 1a e3
 96 f7 88 fe 17 40 96 e5 20 96 24 69 16 83 ec 91
 55 1b 0a 7c 13 85 9a c3 f1 2c fe af 14 ac 43 41
 cd 62 c6 d3 3c d6 24 09 28 f0 6b 43 16 0d 78 9b
 47 2d 0d d3 00 0f 70 6b d2 a0 8b f8 cd 05 8c 01
 ab 08 a6 34 40 50 6d d2 80 45 97 fd 39 63 b2 29
 33 2e 6e 92 3c 2e 37 eb de 45 40 99 31 5c 64 71
 b9 05 98 56 07 89 40 76 d9 b2 2c 6f 2c 0d b0 1e
 01 6a a9 3e 40 48 87 74 74 01 e9 c2 63 04 50 6d
 0f 8f 9d 56 64 4c a1 06 d5 18 f0 2c 2b 1c 4e 07
 34 6b 49 19 d1 c2 55 6b 17 ed bc 19 5d 41 89 e6
 55 24 ae 5f dc e0 38 60 38 1c 01 d2 4d af a8 b5
 d0 58 2c 0a 6a b1 e6 e5 6e 17 43 6f c3 f6 f3 ac
 22 3e 15 b1 22 31 a0 66 70 32 02 15 10 44 45 ba
 29 80 7d de 84 6a a8 80 8d 28 ab 38 0a d9 e4 43
 98 21 88 3b 18 fa e8 1c 29 53 06 a0 ac c2 f1 f8
 4b 53 10 44 13 d4 17 01 c2 e4 87 5a ac 3b 01 75
 cb 20 36 ef 62 02 b7 47 0d 59 84 9d e6 1a 2c 78
 b2 4d 68 c7 53 05 8f 29 7c d8 c4 b3 ac ea 75 af
 20 a5 c6 00 8a 86 1c 87 c6 66 8e 44 8e a0 de e2
 f0 08 51 6c ec 4d 2b 30 32 3b d7 41 d0 14 aa d7
 5b 80 16 16 3c 31 39 09 28 05 5b 11 45 c5 12 8a
 83 29 17 dd 7e 23 3c 28 07 88 c9 5e 8e be f6 0a
 68 00 b1 10 8e c7 f0 50 6a ee 04 15 59 4f 92 88
 52 0f a5 dc 70 69 15 15 eb 67 b6 b9 d1 cc 5e 2e
 2e ba 7e fc 08 0f 6b 48 c5 bb d3 06 08 0d 5f 75
 6a 68 52 c5 24 0b ab c8 f9 7c 96 1d 0e 8f 2c c5
 e5 34 3c 89 40 e8 f7 2a 81 67 59 fe 50 e8 76 6a
 98 44 ac 34 f3 b9 04 bb ba 45 e4 7d 0b f7 97 fd
 5f 52 3d 5d 81 8d bd 01 85 ae 3f d4 01 08 0d 5f
 88 86 1e 06 8c 37 5e c6 b9 e0 70 24 56 d0 d8 66
 ce e6 22 ce f0 c6 ff a4 28 e4 ab 35 f4 d4 e4 10
 7b 25 f5 cc f6 40 67 93 6d 02 1e e8 45 0a 9e 65
 ed 0f fa 6b ba 6d d0 5b e4 d8 be c3 96 9a c8 45
 7b 0b aa f8 40 4c 87 e4 f3 1e 1e 65 0b 80 bc c1
 6f b7 97 c7 ec 54 8f f3 d7 5f db 1f 4c 05 84 cd
 8f b1 40 63 50 69 06 52 73 59 b3 99 8b 76 09 d3
 7e a7 35 b4 1d e8 2b c5 9b 91 f8 1f 6b 1a 42 b9
 6d 5c dd 40 2f 2e ce bc 39 15 7b 4d f6 9a 19 74
 4e 7e 5c ff f1 0f f0 2c 8b ae 7a 6f d4 66 be c5
 e8 c7 26 eb ba 22 ef 79 6c f2 77 4c 5f c0 3b da
 0a cc 77 d1 db 6f b6 06 7e 15 71 fe 2b 00 37 d1
 8b 0d 56 40 c5 e3 f2 dc 09 88 d9 df d0 d5 1f 02
 02 f1 96 bf a2 ab 0a 23 8a 11 fc a9 51 a8 2f a2
 a2 20 03 fe 43 ab 91 36 1c 9f da 0e 81 f5 15 e7
 0b a9 80 fc b0 c6 62 55 cf 83 ee fe 0a dd 3a 01
 8f 2f 05 f7 43 cf 6c 1d 14 30 ae 9f c6 60 11 d1
 f5 8d fe c2 bb f2 12 14 ac b6 35 17 68 8b 78 87
 fe 06 c0 6d 28 58 4a 28 a8 e3 f2 51 01 43 0a bd
 e0 fe 29 78 11 e2 e8 31 76 6c 71 83 e3 78 9a c5
 5b 78 f9 76 e8 03 cd d0 24 bd 85 72 1a 04 5c 7c
 5d dc fd 99 7e a1 69 5c 77 d0 6f 13 16 9b 97 4c
 35 b9 5d c3 00 fa 05 a3 5d e0 c1 e6 4b c1 4f 1c
 89 1a 81 62 6e 7c 57 b3 49 7f 50 16 93 cf 46 6d
 1a 90 9c cd 52 33 79 5a 2e b7 8b 00 9f 01 fa 2c
 bd 47 df 3f 01 c9 51 28 89 12 47 94 59 38 39 30
 eb a5 ae 00 81 d8 df f8 59 11 25 fa e4 15 9e cb
 f4 16 fd 8e 3f 82 cc 45 ed 03 bd 03 c0 0c fd 06
 bd cc 8b 97 87 ef 25 a0 4d e3 ff 3b b4 0f 51 cb
 a0 cf 76 07 a2 e0 79 c0 c3 8c fd 5d e2 71 37 ba
 26 88 82 27 2b 71 19 46 7d c1 df 67 16 00 b8 80
 36 0f 48 41 64 0d 0b 28 2c bc 9d 3f 42 ab 40 b3
 29 9c 9b 8d f0 e6 d0 53 fa e7 90 ef 7b 51 22 99
 57 25 56 3b c2 bb 76 06 bc 08 b1 bf fe 94 cb b6
 d9 0f 6e 22 19 16 30 35 37 05 9c 83 81 a2 e2 34
 2d a3 b4 f0 4a bd 02 6c c5 7b 1f 29 cd bd 33 d1
 7d 19 e8 5f 6c 22 ca 56 c1 c7 03 d5 9f 9e 49 3d
 7d 12 ea 73 47 fd 86 8f 0c e5 d2 b2 4e b9 e6 24
 0c 68 34 64 b3 05 71 0a 58 62 f8 54 14 7b 6c 2d
 5f 15 fd 04 90 ef 5c 44 3c ea 8a 8c 7d 4b c3 1b
 6d ed 9c 75 ea ee 8f b5 e1 da 4a 80 e1 d6 60 ad
 68 27 9f 0c 98 89 30 e3 d1 f8 16 60 9c 16 6a ad
 81 53 05 e5 e1 f2 a8 92 8c 78 44 ee 4a 45 5e 8c
 ba 47 4a f6 3c b8 5d 7d 5d 82 b9 59 20 1a 48 51
 50 3e 15 f1 3d ec 96 26 ca f1 79 36 57 0c 56 05
 79 9c 2c 8a cf 2e 87 cf eb 83 db c9 f9 7a f8 4d
 57 96 9e d8 6b cb 94 8f 10 15 53 27 e6 23 a7 4b
 b2 cd b7 ac 95 c7 10 e5 f9 6e 1b 23 7d a2 4f 6b
 7b 4f e8 4a 0f 38 e9 b7 d8 03 f9 e7 4e 2d 0e c9
 06 8b c9 82 18 87 54 38 d5 8e d5 13 34 86 5b 26
 a7 96 7f 6e 0f a4 cf 74 8e b3 8b f7 9c 97 f9 0a
 86 6f 4e a6 31 69 30 45 55 fd 34 a6 2a 9e 03 b8
 7c c5 79 b9 78 ef 1c 18 27 df 9a b9 eb 3c cb af
 2e d1 47 60 2a a0 1e 55 53 3e ea 39 39 da e8 fd
 11 71 9c 5f 75 9e 65 ee 9e 3c c3 05 5c b5 6f e4
 46 72 13 f6 f6 12 22 09 93 42 cf 76 1c f3 8b 0d
 95 5e f6 76 6e 22 37 62 df b8 80 e9 bb 1d 22 73
 3b fb c0 1e b3 e7 ed 8d 6c b8 04 85 72 68 8c ca
 b1 c6 df 1d ce fc 30 b7 81 1e 63 d9 07 99 8b c8
 d6 6e d1 e2 fd e8 52 7e d0 19 72 46 ec f1 ec af
 b6 63 17 6c 17 ad 60 3b f8 35 ee 8c 38 43 f9 c1
 ae 37 00 f1 61 63 df ff 05 66 3e 0d 2f 62 48 66
    // IEND
 12 00 00 00 00 49 45 4e 44 ae 42 60 82

 
 */
