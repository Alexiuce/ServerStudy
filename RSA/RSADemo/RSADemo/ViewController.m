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

static NSData *base64_decode(NSString *str){
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}

static NSString *base64_encode_data(NSData *data){
    data = [data base64EncodedDataWithOptions:0];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return ret;
}


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
    
//    //往GameScore表添加一条playerName为小明，分数为78的数据
//    BmobObject *gameScore = [BmobObject objectWithClassName:@"t_app_control"];
//
//    NSString *tweak = @"YES04";
//    NSData *data = [tweak dataUsingEncoding:NSUTF8StringEncoding];
//    CocoaSecurityResult *result = [CocoaSecurity hmacSha512WithData:data hmacKey:@"rsa_private_key"];
//    NSString *md5Text = [result.hex lowercaseString];
//
//
//    [gameScore setObject:md5Text forKey:@"rsa_private_pem"];
//    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//        //进行操作
//        NSString *msg = isSuccessful ? @"ok":@"error";
//        NSLog(@"%@",msg);
//    }];
    
    
    
    
    //查找t_app_control表
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"t_app_control"];
//    查找GameScore表里面id为25d9c46b1c的数据
    [bquery getObjectInBackgroundWithId:@"e8f76f2daa" block:^(BmobObject *object,NSError *error){
      if (error){
              //进行错误处理
      }else{
            //表里有id为e8f76f2daa的数据
          if (object) {
              //得到playerName和cheatMode
              NSString *playerName = [object objectForKey:@"rsa_private_pem"];
              NSLog(@"%@",playerName);
              exit(1);
          }
      }
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
    

/**
 苹果从 iOS 10 开始支持直接从公私钥数据来生成 SecKeyRef。步骤如下：
1.对于 PEM 编码的数据，需要先将多余的信息给剔除，主要是头尾两行 （begin 和 end ）以及去掉换行。
2.构造一个 attribute 属性字典，指定密钥算法（比如 RSA），密钥格式（公钥还是私钥），还有密钥大小
3.调用 SecKeyCreateWithData，返回一个 SecKeyRef
 */
- (SecKeyRef) getPrivateKeyFromPem {
    // 下面是对于 PEM 格式的密钥文件的密钥多余信息的处理，通常 DER 不需要这一步
    NSString *key = @"PEM 格式的密钥文件";
    NSRange spos;
    NSRange epos;
    spos = [key rangeOfString:@"-----BEGIN RSA PRIVATE KEY-----"];
    if(spos.length > 0){
        epos = [key rangeOfString:@"-----END RSA PRIVATE KEY-----"];
    }else{
        spos = [key rangeOfString:@"-----BEGIN PRIVATE KEY-----"];
        epos = [key rangeOfString:@"-----END PRIVATE KEY-----"];
    }
    if(spos.location != NSNotFound && epos.location != NSNotFound){
        NSUInteger s = spos.location + spos.length;
        NSUInteger e = epos.location;
        NSRange range = NSMakeRange(s, e-s);
        key = [key substringWithRange:range];
    }
    key = [key stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    key = [key stringByReplacingOccurrencesOfString:@" "  withString:@""];
    
    // This will be base64 encoded, decode it.
    NSData *data = base64_decode(key);
    if(!data){return nil;}
    
    // 设置属性字典
    NSMutableDictionary *options = [NSMutableDictionary dictionary];
    /** 声明密钥算法类型为RSA */
    options[(__bridge id)kSecAttrKeyType] = (__bridge id) kSecAttrKeyTypeRSA;
    /** 声明密钥为私钥 */
    options[(__bridge id)kSecAttrKeyClass] = (__bridge id) kSecAttrKeyClassPrivate;
    NSNumber *size = @2048;
    /** 声明密钥长度 */
    options[(__bridge id)kSecAttrKeySizeInBits] = size;
    NSError *error = nil;
    CFErrorRef ee = (__bridge CFErrorRef)error;
    
    // 调用接口获取密钥对象
    SecKeyRef ret = SecKeyCreateWithData((__bridge CFDataRef)data, (__bridge CFDictionaryRef)options, &ee);
    if (error) {
        return nil;
    }
    return ret;
}


@end
