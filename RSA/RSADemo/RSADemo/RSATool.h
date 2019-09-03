/*
 @author: ideawu
 @link: https://github.com/ideawu/Objective-C-RSA
*/

#import <Foundation/Foundation.h>

@interface RSATool : NSObject

// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

// decrypt base64 encoded string, convert result to string(not base64 encoded)
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;


+ (SecKeyRef)addPublicKey:(NSString *)key;

+ (SecKeyRef)addPrivateKey:(NSString *)key;

#pragma mark - RSA 加签
+ (NSData*) PKCSSignBytesSHA1withRSA:(NSData*) plainData secKey:(SecKeyRef) privateKey;
#pragma mark RSA 验签
/** RSA SHA1 验证签名 */
+ (BOOL) PKCSVerifyBytesSHA1withRSA:(NSData*) plainData signature:(NSData*) signature publicRef:(SecKeyRef) publicKey;


@end
