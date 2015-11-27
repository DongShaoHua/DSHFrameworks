//
//  NSString+DSHStringCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define _is_string_nil_or_empty(str) \
    [NSString isNilOrEmpty: str]

#define safe_turn_string_2_md5(original) \
    _is_string_nil_or_empty(original) ? nil : [original toMD5]

#define safe_turn_string_2_json(original) \
    _is_string_nil_or_empty(original) ? nil : [original toJSON]

#define safe_turn_string_2_url(original) \
    _is_string_nil_or_empty(original) ? nil : [original toUrl]

#define safe_string_is_match_pattern(original, pattern) \
    _is_string_nil_or_empty(original) ? NO : [original isMatch: pattern]

#define stringformat(format, parameter...) \
    [NSString stringWithFormat: format, parameter]

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
