//
//  NSDictionary+DSHDictionaryCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSHDevelopmentHelper.h"

#define safe_turn_dictionary_to_model(parameter, class) \
    _kind_of_dictionary(parameter) ? [parameter toModel: class] : nil

#define safe_get_integer_from_dictionary(parameter, key) \
    _kind_of_dictionary(parameter) ? [parameter getIntegerWithKey: key] : 0

#define safe_turn_dictionary_to_data(parameter) \
    safe_turn_dictionary_to_data_with_error(parameter, nil)

#define safe_turn_dictionary_to_data_with_error(parameter, error) \
    _kind_of_dictionary(parameter) ? [parameter toData: error] : nil

#define safe_turn_dictionary_to_jsonstring(parameter) \
    _kind_of_dictionary(parameter) ? [parameter toJSONString] : nil

@interface NSDictionary (DSHDictionaryCategory)

/**
 将当前对象转换为给定对象类型
 */
- (__kindof id)toModel:(Class)cls;

/**
 以整形的格式返回指定key的数据
 */
- (NSInteger)getIntegerWithKey:(NSString *)key;

/**
 将当前对象转换为NSData类型
 */
- (NSData *)toData;

/**
 将当前对象转换为NSData类型，如果转换失败，错误信息包含在参数error中
 */
- (NSData *)toData:(NSError **)error;

/**
 将当前字典转化为JSON字符串
 */
- (NSString *)toJSONString;

/**
 ============= Just for debug ============
 Helper方法，自动返回该字典对应的实体类源码字符串
 */
- (NSString *)toModelCodeString;

@end
