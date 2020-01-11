//
//  ViewController.m
//  XCTimeClock
//
//  Created by alexiuce on 2019/12/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

#import "ViewController.h"



#define ScreenWidth   UIScreen.mainScreen.bounds.size.width
#define ScreenHeight  UIScreen.mainScreen.bounds.size.height




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *hourView;              /** 小时部分view */
@property (weak, nonatomic) IBOutlet UIView *minuteView;            /** 分钟部分view */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTimeText];
//    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(onChangeDirection:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

- (void)updateTimeText{
    
}

#pragma mark - view will transition
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            NSLog(@"protraint");
            
            NSLog(@"%@",NSStringFromCGSize(size));
            
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"landscapeLeft");
            NSLog(@"%@",NSStringFromCGSize(size));
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"landscapeRight");
            NSLog(@"%@",NSStringFromCGSize(size));
            break;
            
        default:
            break;
    }
    
}


#pragma mark - Notification handler
- (void)onChangeDirection:(NSNotification *)noti{
//    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
//    switch (orientation) {
//        case UIDeviceOrientationPortrait:
//            NSLog(@"protraint");
//
//            NSLog(@"width = %f, height = %f",ScreenWidth,ScreenHeight);
//
//            break;
//        case UIDeviceOrientationLandscapeLeft:
//            NSLog(@"landscapeLeft");
//            NSLog(@"width = %f, height = %f",ScreenWidth,ScreenHeight);
//            break;
//        case UIDeviceOrientationLandscapeRight:
//            NSLog(@"landscapeRight");
//            NSLog(@"width = %f, height = %f",ScreenWidth,ScreenHeight);
//            break;
//
//        default:
//            break;
//    }
}


@end
