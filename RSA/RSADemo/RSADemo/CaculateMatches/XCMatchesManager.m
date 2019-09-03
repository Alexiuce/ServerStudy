//
//  XCMatchesManager.m
//  RSADemo
//
//  Created by alexiuce on @(2)019/8/10.
//  Copyright © 2019 alexiuce. All rights reserved.
//

#import "XCMatchesManager.h"

@interface XCMatchesManager ()

/**
 * 按照串关场数分组，3场串、4场串。。。8场串。
 * 每组串关场次包含多个串关方式，如3串3、3串4，多个串关方式对应不同的再分组区间。
 * [串N, Max, Min]表示比赛场次按N场分组后，每组再进行串Max分组，然后对每组进行组合；以上操作循环至Min
 */
@property (nonatomic, strong) NSArray<NSArray *> *passModeMap;

@end


@implementation XCMatchesManager

+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    static XCMatchesManager *_mIns;
    dispatch_once(&onceToken, ^{
        _mIns = [self new];
        _mIns.passModeMap = @[@[
                               @[@(3), @(2), @(2)], //3x3
                               @[@(4), @(3), @(2)] //3x4
                               ],
                              @[
                               @[@(4), @(3), @(3)], //4x4
                               @[@(5), @(4), @(3)], //4x5
                               @[@(6), @(2), @(2)], //4x6
                               @[@(11), @(4), @(2)] //4x11
                               ],
                              @[
                               @[@(5), @(4), @(4)], //5x5
                               @[@(6), @(5), @(4)], //5x6
                               @[@(10), @(2), @(2)], //5x10
                               @[@(16), @(5), @(3)], //5x16
                               @[@(20), @(3), @(2)], //5x20
                               @[@(26), @(5), @(2)] //5x26
                               ],
                              @[
                               @[@(6), @(5), @(5)], //6x6
                               @[@(7), @(6), @(5)], //6x7
                               @[@(15), @(2), @(2)], //6x15
                               @[@(20), @(3), @(3)], //6x20
                               @[@(22), @(6), @(4)], //6x22
                               @[@(35), @(3), @(2)], //6x35
                               @[@(42), @(6), @(3)], //6x42
                               @[@(50), @(4), @(2)], //6x50
                               @[@(57), @(6), @(2)] //6x57
                               ],
                              @[
                               @[@(7), @(6), @(6)], //7x7
                               @[@(8), @(7), @(6)], //7x8
                               @[@(21), @(5), @(5)], //7x21
                               @[@(35), @(4), @(4)], //7x35
                               @[@(120), @(7), @(2)] //7x120
                               ],
                              @[
                               @[@(8), @(7), @(7)], //8x8
                               @[@(9), @(8), @(7)], //8x9
                               @[@(28), @(6), @(6)], //8x28
                               @[@(56), @(5), @(5)], //8x56
                               @[@(70), @(4), @(4)], //8x70
                               @[@(247), @(8), @(2)] //8x247
                               ]
                              ];
    });
    return _mIns;
}
/** 生成结果
 * (NSArray*) matches 投注场次
 * (int) cgCount 串关场数
 * (int) cgMode 串关方式
 */
- (NSArray *)generateMatches:(NSArray *)matches count:(int)cgCount mode:(int)cgMode{
    NSArray * cgGroup = self.passModeMap[cgCount - 3];
    NSArray * range= @[];
    
    for (int i = 0,len = (int)cgGroup.count; i < len; i++) {
        if ([cgGroup[i][0] intValue] == cgMode) {
            NSArray *temp = cgGroup[i];
            range = [temp subarrayWithRange:NSMakeRange(1, temp.count - 1)];
            break;
        }
    }
    //按照串关场数进行组合
    NSArray *ret = [self combo:matches number:cgCount count:0 conArray:nil];
    
    
    NSMutableArray *total = @[].mutableCopy; //串关结果
    
    int max = [[range valueForKeyPath:@"@max.intValue"] intValue];
    int min = [[range valueForKeyPath:@"@min.intValue"] intValue];
     //遍历组合，生成串关方式
    for(int j = 0, jen = (int)ret.count; j < jen; j++ ){
        //遍历串关方式对应的分组区间
        for(int k = min; k <= max; k++){
            NSArray *partial = [self combo:ret[j] number:k count:0 conArray:nil];
            //遍历最终的分组，进行每组元素中每场比赛选项的混合，如有三场比赛，则从每场比赛中选一个选项
            for(int p = 0, pen = (int)partial.count; p < pen; p++){
                NSArray *partArray = partial[p];
                NSArray *grp = [self mix:partArray limit:(int)partArray.count index:0 conArray:nil];
                [total addObjectsFromArray:grp];
            }
        }
    }
    return [total copy];
}

//计算total场比赛的排列组合
- (NSArray *)combo:(NSArray *)total number:(int)num count:(int)i conArray:(NSArray *)concat{
    int len = (int)total.count;
    NSMutableArray *ret = @[].mutableCopy;
    for (; i < len; i++) {
        NSArray *rest;
        if (concat == nil) {
            rest = @[total[i]];
        }else{
            id lt = @[total[i]];
            rest = [concat arrayByAddingObjectsFromArray:lt];
        }
        
        if (num > 1) {
            [ret addObjectsFromArray:[self combo:total number:num - 1 count:i + 1 conArray:rest]];
        }else{
            [ret addObject:rest];
        }
    }
    return [ret copy];
}

//遍历每组比赛，取每场比赛的一个选项进行组合
- (NSArray *)mix:(NSArray<NSArray *> *)list limit:(int)limit index:(int)idx conArray:(NSArray *)concat{
    
    NSMutableArray *ret = @[].mutableCopy;
    NSLog(@"----- %@",list[idx]);
    for (int i=0,len =(int)list[idx].count; i < len; i++) {
        NSArray *rest;
        if (concat == nil) {
            rest = @[list[idx][i]];
        }else{
            id lt = list[idx][i];
            if ([lt isKindOfClass:NSArray.class]) {
                rest = [concat arrayByAddingObjectsFromArray:(NSArray *)lt];
            }else{
                rest = [concat arrayByAddingObject:lt];
            }
        }
        if (limit > 1) {
            [ret addObjectsFromArray:[self mix:list limit:limit - 1 index:idx+1  conArray:rest]];
        }else{
            [ret addObject:rest];
        }
    }
    return [ret copy];
}

@end
