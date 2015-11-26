//
//  DSHHttpClient.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include("AFNetworking.h")

#define header_file_for_af "AFNetworking.h"

#else

#define header_file_for_af <AFNetworking.h>

#endif

#if __has_include(header_file_for_af)

/**
 请求完成时，回调函数
 */
typedef void (^ResponseCompleted)(AFHTTPRequestOperation *response, NSString *error);

typedef void (^UpLoadFiles)(id<AFMultipartFormData> formdata);

/**
 请求内容体，自动格式化方式
 */
typedef NS_ENUM(Byte, RESPONSE_BODY_TYPE) {
    RESPONSE_FOR_TEXT, // 文本
    RESPONSE_FOR_JSON, // JSON
    RESPONSE_FOR_XML   // Xml
};

#endif

@interface DSHHttpClient : NSObject

@property (assign, nonatomic) NSTimeInterval timeout;

+ (instancetype)shareInstance;
+ (NSTimeInterval)getDefaultTimeout;
+ (void)setDefaultTimeout:(NSTimeInterval)timeout;

#if __has_include(header_file_for_af)

#pragma mark ======= Http Get =======
/**
 address -> 服务器地址
 responseType -> 返回数据序列化处理类型，
 completed -> 请求完成时的回调函数,该参数为nil时,方法返回的operation不会马上执行，需要手动调用operation的start。
 */
- (AFHTTPRequestOperation *)GET:(NSString *)address;
- (AFHTTPRequestOperation *)GET:(NSString *)address completed:(ResponseCompleted)completed;
- (AFHTTPRequestOperation *)GET:(NSString *)address responseType:(RESPONSE_BODY_TYPE)responseType completed:(ResponseCompleted)completed;

#pragma mark ======= Http POST =======
/**
 address -> 服务器地址
 responseType -> 返回数据序列化处理类型，
 completed -> 请求完成时的回调函数,该参数为nil时,方法返回的operation不会马上执行，需要手动调用operation的start。
 */
- (AFHTTPRequestOperation *)POST:(NSString *)address parameters:(NSDictionary *)parameters;
- (AFHTTPRequestOperation *)POST:(NSString *)address parameters:(NSDictionary *)parameters completed:(ResponseCompleted)completed;
- (AFHTTPRequestOperation *)POST:(NSString *)address parameters:(NSDictionary *)parameters responseType:(RESPONSE_BODY_TYPE)responseType completed:(ResponseCompleted)completed;

#pragma mark ======= Http POST UPLOAD FILES =======
/**
 address -> 服务器地址
 responseType -> 返回数据序列化处理类型，
 completed -> 请求完成时的回调函数,该参数为nil时,方法返回的operation不会马上执行，需要手动调用operation的start。(注，如果自己手动调用start, 请确保操作是在非主线程中进行，否则会引发超时而导致请求失败。)
 */
- (AFHTTPRequestOperation *)UPLOAD:(NSString *)address parameters:(NSDictionary *)parameters uploadfiles:(UpLoadFiles)uploadfiles;
- (AFHTTPRequestOperation *)UPLOAD:(NSString *)address parameters:(NSDictionary *)parameters uploadfiles:(UpLoadFiles)uploadfiles completed:(ResponseCompleted)completed;
- (AFHTTPRequestOperation *)UPLOAD:(NSString *)address parameters:(NSDictionary *)parameters uploadfiles:(UpLoadFiles)uploadfiles responseType:(RESPONSE_BODY_TYPE)responseType completed:(ResponseCompleted)completed;

+ (NSString *)handleError:(NSError *)error;

#endif

@end
