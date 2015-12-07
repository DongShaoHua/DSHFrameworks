//
//  NSObject+DSHObjectCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DSHObjectCategory)

/**
 将对象所有的属性信息保存到本地
 key -> 保存本地的索引关键字
 */
- (void)saveAllPropertyValueAtLocal:(NSString *)key;

/**
 Method Swizzling
 */
+ (void)exchangeMethod:(SEL)originalSel withNewMethod:(SEL)newSel;

/**
 清除指定关键字所保存的本地信息
 */
+ (void)clearAllPropertyValueAtLocal:(NSString *)key;

/**
 获取对象的所有属性
 */
+ (NSArray<NSString *> *)getAllProperty;

@end
