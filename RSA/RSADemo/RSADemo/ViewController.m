//
//  ViewController.m
//  RSADemo
//
//  Created by alexiuce on 2019/7/11.
//  Copyright © 2019 alexiuce. All rights reserved.
//

#import "RSATool.h"
#import <BmobSDK/Bmob.h>
#import <AFNetworking.h>
#import "ViewController.h"
#import <CocoaSecurity.h>
#import "XCMatchesManager.h"


static NSString * const url = @"http://192.168.101.24:7000/api/power/RequestHeadsController/test1.html";


@interface ViewController ()

@property (nonatomic, strong) NSString *pubKey;
@property (nonatomic, strong) NSString *privKey;
@property (nonatomic, strong) NSString *headerString;
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) AFHTTPSessionManager *payManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //往GameScore表添加一条playerName为小明，分数为78的数据
    BmobObject *gameScore = [BmobObject objectWithClassName:@"t_app_control"];
    [gameScore setObject:@"10.0.0.1" forKey:@"ipaddress"];
    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        //进行操作
        NSString *msg = isSuccessful ? @"ok":@"error";
        NSLog(@"%@",msg);
    }];
    _manager = [AFHTTPSessionManager manager];
    _payManager = [AFHTTPSessionManager manager];
    [_manager.requestSerializer setValue:@"1.0.0" forHTTPHeaderField:@"version"];
    [_manager.requestSerializer setValue:@"ios" forHTTPHeaderField:@"encryptType"];
    [_manager.requestSerializer setValue:@"5be2f6c02ce94d1abc0e3a3a219a867d" forHTTPHeaderField:@"appId"];
    [_manager.requestSerializer setValue:@"/power/RequestHeadsController/test1.html" forHTTPHeaderField:@"method"];
    
    _headerString = @"appId=5be2f6c02ce94d1abc0e3a3a219a867d&method=/power/RequestHeadsController/test1.html&version=1.0.0&timestamp=";
    // Do any additional setup after loading the view.
}

- (IBAction)test:(UIButton *)sender {
    
    /**
     * @usage
     */
    NSArray * matches = @[
                   @[@"胜", @"平",@"负"],
                   @[@"让胜", @"让平", @"让负"],
                   @[@"2:1", @"1:1", @"平其它"],
                   @[@(2), @(3), @(1)],
                   @[@"胜胜", @"平胜"]
                   ];
    
    NSArray *result =  [XCMatchesManager.shareManager generateMatches:matches count:4 mode:6];
    
    NSLog(@"result = %d", (int)result.count);
}


- (IBAction)clickButton:(UIButton *)sender {
    NSDictionary *param = @{@"a":@"a1",
                            @"b":@"b1",
                            @"c":@"c1",
                            @"d":@"d1"
                            };
    NSString *sortJson = [self keySortQuery:param];
    /** 设置 http header 时间戳 字段  */
    NSDate *date = [NSDate date];
    NSTimeInterval milsec = [date timeIntervalSince1970];
    NSString *ms = [NSString stringWithFormat:@"%.0f",milsec];
    [_manager.requestSerializer setValue:ms forHTTPHeaderField:@"timestamp"];
    
    NSString *postString = [NSString stringWithFormat:@"%@%@&%@",self.headerString,ms,sortJson];
    
    CocoaSecurityResult *result = [CocoaSecurity md5:postString];
    NSString *md5Text = [result.hex lowercaseString];
    
    NSData *plainData = [@"1" dataUsingEncoding:NSUTF8StringEncoding];//[md5Text dataUsingEncoding:NSUTF8StringEncoding];
    
    
    /** RSA 加签 */
    NSString *path = [NSBundle.mainBundle pathForResource:@"rsa_private_key.pem" ofType:nil];
    NSString *ps = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    SecKeyRef private_ref = [RSATool addPrivateKey:ps];
    NSData *signed_data = [RSATool PKCSSignBytesSHA1withRSA:plainData secKey:private_ref];
    /** 设置 Http header 签名字段 */
     [_manager.requestSerializer setValue:[signed_data base64EncodedStringWithOptions:0] forHTTPHeaderField:@"signature"];
    /** 发送Http post 请求 */
    [_manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

/** 按key 字母顺序排序,返回query 格式的字符串  */
- (NSString *)keySortQuery:(NSDictionary *)param{
    if (param.allKeys == nil || param.allKeys.count == 0) {return nil;}
    NSMutableString *str = [NSMutableString string];
    NSArray <NSString *>*sortKeys = param.allKeys ;
    sortKeys = [sortKeys sortedArrayUsingSelector:@selector(localizedCompare:)];
    
    NSUInteger count = sortKeys.count;
    for (int i = 0; i < count; ++i) {
        NSString *key = sortKeys[i];
        id value = param[key];
        if (value == nil) {continue;}
        BOOL isString = [value isKindOfClass:NSString.class];
        if (isString && ((NSString*)value).length == 0) {continue;}
        [str appendString:key];
        [str appendString:@"="];
        if (isString) {
            NSString *s = (NSString *)value;
            [str appendString:s];
        }else if ([value isKindOfClass:NSValue.class]){
            
        }
        if (i < count - 1) {
            [str appendString:@"&"];
        }
    }
    return [str copy];
    
}
/** 支付按钮 */
- (IBAction)clickPay:(UIButton *)sender {
    
    [_payManager POST:@"https://lckt.zcai.pro:443/api/pay/DongHuiController/test361Pay.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}
    


@end
