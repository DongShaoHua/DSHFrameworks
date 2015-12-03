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
#import "DSHDevelopmentHelper.h"
#import "NSDictionary+DSHDictionaryCategory.h"

@implementation NSObject (DSHObjectCategory)

- (void)saveAllPropertyValueAtLocal:(NSString *)key {
    NSArray<NSString *> *properties = [NSObject getAllProperty];
    if (properties && properties.count > 0) {
        NSMutableDictionary *info = [NSMutableDictionary dictionary];
        for (NSString *property in properties) {
            id val = [self valueForKey: property];
            if (val && !_kind_of_(val, NSNull)) {
                [info setValue: val forKey: property];
            }
        }
        
        if (info.count > 0) {
            NSString *jsonString = safe_turn_dictionary_to_jsonstring(info);
            if (jsonString) {
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setValue: jsonString forKey: key];
            }
        }
    }
}

+ (void)exchangeMethod:(SEL)originalSel withNewMethod:(SEL)newSel {
    if (originalSel && newSel) {
        Class class = self.class;
        Method originalMethod = class_getInstanceMethod(class, originalSel);
        if (!originalMethod) {
            originalMethod = class_getClassMethod(class, originalSel);
        }
        
        if (!originalMethod) {
            @throw [NSException exceptionWithName: @"Original method not found" reason: nil userInfo: nil];
        }
        
        Method newMethod = class_getInstanceMethod(class, newSel);
        if (!newMethod){
            newMethod = class_getClassMethod(class, newSel);
        }
        if (!newMethod) {
            @throw [NSException exceptionWithName:@"New method not found" reason: nil userInfo: nil];
        }
        if (originalMethod == newMethod) {
            @throw [NSException exceptionWithName:@"Methods are the same" reason:nil userInfo:nil];
        }
        
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

+ (void)clearAllPropertyValueAtLocal:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey: key];
}

+ (NSArray<NSString *> *)getAllProperty {
    objc_property_t *properties = NULL;
    unsigned int count = 0;
    Class cls = [self class];
    properties = class_copyPropertyList(cls, &count);
    NSMutableArray *arrayofProp = [NSMutableArray array];
    if (properties && count > 0) {
        for (int i = 0; i < count; ++i) {
            NSString *propertyName = @(property_getName(properties[i]));
            if (!_is_string_nil_or_empty(propertyName)) {
                [arrayofProp addObject: propertyName];
            }
        }
        free(properties);
        properties = NULL;
    }
    return arrayofProp;
}

@end
