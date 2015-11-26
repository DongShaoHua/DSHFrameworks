//
//  NSDictionary+DSHDictionaryCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

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
 Helper方法，自动返回该字典对应的实体类源码字符串
 */
- (NSString *)toModelCodeString;

@end
