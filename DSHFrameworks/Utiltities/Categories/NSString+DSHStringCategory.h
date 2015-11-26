//
//  NSString+DSHStringCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isStringNibOrEmpty(str) \
    [NSString isNilOrEmpty: str]

@interface NSString (DSHStringCategory)

/**
 判断字符床是否为nil或空
 */
+ (BOOL)isNilOrEmpty:(NSString *)string;

/**
 将字符床转换为url对象
 */
- (NSURL *)toUrl;

/**
 将字符床转换为MD5
 */
- (NSString *)toMD5;

/**
 将JSON字符串转JSON对象
 */
- (NSDictionary *)toJSON;

/**
 字符床是否匹配指定模式
 */
- (BOOL)isMatch:(NSString *)pattern;

@end
