//
//  NSObject+DSHObjectCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DSHObjectCategory)

- (void)saveAllPropertyValueAtLocal:(NSString *)key;

+ (void)exchangeMethod:(SEL)originalSel withNewMethod:(SEL)newSel;

+ (void)clearAllPropertyValueAtLocal:(NSString *)key;
+ (NSArray<NSString *> *)getAllProperty;

@end
