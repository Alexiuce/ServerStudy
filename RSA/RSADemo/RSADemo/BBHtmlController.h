//
//  BBHtmlController.h
//  BestBuyApp
//
//  Created by Alexcai on 2019/6/8.
//  Copyright © 2019 com.liangwu.bestbuy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBHtmlController : UIViewController

@property (copy, nonatomic) NSString *htmlURL;
@property (weak, nonatomic,) id<UIScrollViewDelegate> scrollDelegate;
/** 加载html */
- (void)loadHtml:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
