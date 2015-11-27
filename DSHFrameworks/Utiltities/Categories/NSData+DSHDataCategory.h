//
//  NSData+DSHDataCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSHDevelopmentHelper.h"

#define safe_turn_data_2_dictionary(parameter) \
    safe_turn_data_2_dictionary_with_error(parameter, nil) \

#define safe_turn_data_2_dictionary_with_error(parameter, error) \
    _kind_of_data(parameter) ? [parameter toDictionary: error] : nil

#define safe_turn_data_2_model(parameter, class) \
    _kind_of_data(parameter) ? [parameter toModel: class] : nil

@interface NSData (DSHDataCategory)

/**
 将当前对象转换为字典类型
 */
- (NSMutableDictionary *)toDictionary;

/**
 将当前对象转换为字典类型, 如果转换失败，参数error中包含错误信息
 */
- (NSMutableDictionary *)toDictionary:(NSError **)error;

/**
 将当前对象转换为给定对象类型
 */
- (__kindof id)toModel:(Class)cls;

@end
