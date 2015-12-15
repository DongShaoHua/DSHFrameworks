//
//  DSHLayoutViewProperty.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <objc/runtime.h>
#import "DSHLayoutViewProperty.h"
#import "DSHDevelopmentHelper.h"
#import "NSString+DSHStringCategory.h"
#import "UIColor+DSHColorCategory.h"

static NSMutableDictionary<NSString *, PropertyValueHandleBlock> *handleblock = nil;

@implementation DSHLayoutViewProperty

+ (void)load {
    [self addPropertyHandleBlock: @"frame" block:^id(NSString *propertyValue, UIView *parent) {
        if (!_is_string_nil_or_empty(propertyValue)) {
            NSArray<NSString *> *values = [propertyValue componentsSeparatedByString: @","];
            if (values && values.count == 4) {CGFloat x = [values[0] floatValue];
                CGFloat y = [values[1] floatValue];
                CGFloat width = [values[2] floatValue];
                CGFloat height = [values[3] floatValue];
                
                CGSize parentSize = { 0, 0 };
                CGSize screenSize = [DSHDevelopmentHelper getDeviceScreen];
                
                if (_kind_of_(parent, UIView)) {
                    parentSize = parent.bounds.size;
                }
                
                if ([@"pw" isEqualToString: values[2]]) {
                    width = parentSize.width;
                } else {
                    if ([@"sw" isEqualToString: values[2]]) {
                        width = screenSize.width;
                    }
                }
                
                if ([@"ph" isEqualToString: values[3]]) {
                    height = parentSize.height;
                } else {
                    if ([@"sh" isEqualToString: values[3]]) {
                        height = screenSize.height;
                    }
                }
                
                return [NSValue valueWithCGRect: CGRectMake(x, y, width, height)];
            }
        }
        return nil;
    }];
    
    [self addPropertyHandleBlock: @"backgroundColor" block: ^id(NSString *propertyValue, UIView *parent) {
        return [UIColor colorWithHexString: propertyValue];
    }];
    
    [self addPropertyHandleBlock: @"image" block:^id(NSString *propertyValue, UIView *parent) {
        return [UIImage imageNamed: propertyValue];
    }];
}

#define LayoutViewKey "LayoutViewKey"
- (void)bindView:(UIView *)view WithParentView:(UIView *)parent {
    if (_kind_of_(view, UIView)) {
        @try {
            PropertyValueHandleBlock block = handleblock[_name];
            if (block) {
                [view setValue: block(_value, parent) forKey: _name];
            } else {
                if ([@"key" isEqualToString: _name]) {
                    objc_setAssociatedObject(view, LayoutViewKey, _value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                } else {
                    [view setValue: _value forKey: _name];
                }
            }
        }
        @catch (NSException *exception) {
            
        }
    }
}

+ (NSString *)getViewKey:(UIView *)view {
    NSString *keyValue = nil;
    if (_kind_of_(view, UIView)) {
        keyValue = objc_getAssociatedObject(view, LayoutViewKey);
    }
    return keyValue;
}

+ (instancetype)propertyWith:(NSString *)name andValue:(NSString *)value{
    DSHLayoutViewProperty *property = nil;
    if (!_is_string_nil_or_empty(value)) {
        property = [DSHLayoutViewProperty new];
        property.name = name;
        property.value = value;
    }
    
    return property;
}

+ (void)addPropertyHandleBlock:(NSString *)property block:(PropertyValueHandleBlock) block {
    _exec_block_only_one_time(^{
        handleblock = [NSMutableDictionary dictionary];
    })
    
    [handleblock setValue: block forKey: property];
}

@end
