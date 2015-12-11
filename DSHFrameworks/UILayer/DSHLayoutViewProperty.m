//
//  DSHLayoutViewProperty.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHLayoutViewProperty.h"
#import "DSHDevelopmentHelper.h"
#import "NSString+DSHStringCategory.h"
#import "UIColor+DSHColorCategory.h"

static NSMutableDictionary<NSString *, PropertyValueHandleBlock> *handleblock = nil;

@implementation DSHLayoutViewProperty

+ (void)load {
    [self addPropertyHandleBlock: @"frame" block:^id(NSString *propertyValue, __kindof UIView *parentView) {
        if (!_is_string_nil_or_empty(propertyValue)) {
            NSArray<NSString *> *values = [propertyValue componentsSeparatedByString: @","];
            if (values && values.count == 4) {CGFloat x = [values[0] floatValue];
                CGFloat y = [values[1] floatValue];
                CGFloat width = [values[2] floatValue];
                CGFloat height = [values[3] floatValue];
                
                if ([@"pw" isEqualToString: values[2]]) {
                    width = parentView.frame.size.width;
                } else {
                    if ([@"sw" isEqualToString: values[2]]) {
                        width = [DSHDevelopmentHelper getDeviceScreen].width;
                    }
                }
                
                if ([@"ph" isEqualToString: values[3]]) {
                    height = parentView.frame.size.height;
                } else {
                    if ([@"sh" isEqualToString: values[3]]) {
                        height = [DSHDevelopmentHelper getDeviceScreen].height;
                    }
                }
                
                return [NSValue valueWithCGRect: CGRectMake(x, y, width, height)];
            }
        }
        return nil;
    }];
    
    [self addPropertyHandleBlock: @"backgroundColor" block: ^id(NSString *propertyValue, __kindof UIView *parentView) {
        return [UIColor colorWithHexString: propertyValue];
    }];
    
    [self addPropertyHandleBlock: @"image" block:^id(NSString *propertyValue, __kindof UIView *parentView) {
        return [UIImage imageNamed: propertyValue];
    }];
}

- (void)bindView:(UIView *)view {
    if (_kind_of_(view, UIView)) {
        @try {
            [view setValue: _value forKey: _name];
        }
        @catch (NSException *exception) {
            
        }
    }
}

+ (instancetype)propertyWith:(NSString *)name andValue:(NSString *)value parentView:(__kindof UIView *)parentView{
    DSHLayoutViewProperty *property = nil;
    if (!_is_string_nil_or_empty(value)) {
        property = [DSHLayoutViewProperty new];
        property.name = name;
        PropertyValueHandleBlock block = handleblock[property.name];
        property.value = value;
        if (block) {
            property.value = block(value, parentView);
        }
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
