//
//  NSData+DSHDataCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

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
- (id)toModel:(Class)cls;

@end
