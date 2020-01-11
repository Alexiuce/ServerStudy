//
//  ViewController.m
//  XCTimeClock
//
//  Created by alexiuce on 2019/12/28.
//  Copyright © 2019 alexiuce. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *hourView;              /** 小时部分view */
@property (weak, nonatomic) IBOutlet UIView *minuteView;            /** 分钟部分view */

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateTimeText];
    
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(onChangeDirection:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

- (void)updateTimeText{
    
}

#pragma mark - Notification handler
- (void)onChangeDirection:(NSNotification *)noti{
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    switch (orientation) {
        case UIDeviceOrientationPortrait:
            NSLog(@"protraint");
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"landscapeLeft");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"landscapeRight");
            break;
            
        default:
            break;
    }
}


@end
