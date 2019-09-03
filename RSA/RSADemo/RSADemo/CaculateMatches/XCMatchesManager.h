//
//  XCMatchesManager.h
//  RSADemo
//
//  Created by alexiuce on 2019/8/10.
//  Copyright © 2019 alexiuce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCMatchesManager : NSObject
/** 单利 */
+ (instancetype)shareManager;

/** 生成结果
 * (NSArray*) matches 投注场次
 * (int) cgCount 串关场数
 * (int) cgMode 串关方式
 */
- (NSArray *)generateMatches:(NSArray *)matches count:(int)cgCount mode:(int)cgMode;

@end

NS_ASSUME_NONNULL_END
