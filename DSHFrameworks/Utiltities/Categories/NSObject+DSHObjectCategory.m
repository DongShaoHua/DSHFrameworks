//
//  NSObject+DSHObjectCategory.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "NSObject+DSHObjectCategory.h"
#import <objc/runtime.h>
#import "NSString+DSHStringCategory.h"

@implementation NSObject (DSHObjectCategory)

+ (NSArray<NSString *> *)getAllProperty {
    objc_property_t *properties = NULL;
    unsigned int count = 0;
    Class cls = [self class];
    properties = class_copyPropertyList(cls, &count);
    NSMutableArray *arrayofProp = [NSMutableArray array];
    if (properties && count > 0) {
        for (int i = 0; i < count; ++i) {
            NSString *propertyName = @(property_getName(properties[i]));
            if (!isStringNibOrEmpty(propertyName)) {
                [arrayofProp addObject: propertyName];
            }
        }
        free(properties);
        properties = NULL;
    }
    return arrayofProp;
}

@end
