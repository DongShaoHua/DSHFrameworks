//
//  DSHViewManager.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/9.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHViewManager.h"
#import <objc/runtime.h>
#import "DSHDevelopmentHelper.h"

#import "UIColor+DSHColorCategory.h"
#import "NSString+DSHStringCategory.h"
#import "NSDictionary+DSHDictionaryCategory.h"

@implementation DSHViewManager

+ (__kindof UIView *)viewWithFile:(NSString *)filePath parentView:(UIView *)parentView {
    UIView *view = nil;
    NSString *layoutStr = [NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil];
    
    if (![NSString isNilOrEmpty: layoutStr]) {
        NSDictionary *layoutJson = [layoutStr toJSON];
        if (_kind_of_dictionary(layoutJson)) {
            DSHLayoutEntity *entity = [layoutJson toModel: DSHLayoutEntity.class];
            view = [entity createViewWithEntity];
        }
    }
    
    return view;
}

@end

@implementation DSHLayoutEntityProperty

+ (DSHLayoutEntityProperty *)propertyWithJson:(NSDictionary *)json {
    DSHLayoutEntityProperty *property = nil;
    if (_kind_of_dictionary(json)) {
        property = [json toModel: DSHLayoutEntityProperty.class];
        
        if ([@"frame" isEqualToString: property.key]) {
            NSString *value = property.value;
            if (![NSString isNilOrEmpty: value]) {
                NSArray<NSString *> *values = [value componentsSeparatedByString: @","];
                if (values && values.count == 4) {
                    CGFloat x = [values[0] floatValue];
                    CGFloat y = [values[1] floatValue];
                    CGFloat width = [values[2] floatValue];
                    CGFloat height = [values[3] floatValue];
                    
                    if ([@"s" isEqualToString: values[2]]) {
                        width = [DSHDevelopmentHelper getDeviceScreen].width;
                    }
                    
                    if ([@"s" isEqualToString: values[3]]) {
                        height = [DSHDevelopmentHelper getDeviceScreen].height;
                    }
                    
                    CGRect frame = CGRectMake(x, y, width, height);
                    property.value = [NSValue valueWithCGRect: frame];
                } 
            }
        } else {
            if ([@"backgroundColor" isEqualToString: property.key]) {
                UIColor *backgroundColor = [UIColor colorWithHexString: property.value];
                property.value = backgroundColor;
            }
        }
        
    }
    
    return property;
}

@end

@implementation DSHLayoutEntity

- (__kindof UIView *)createViewWithEntity {
    UIView *view = nil;
    
    if (![NSString isNilOrEmpty: _type]) {
        view = (UIView *)[NSClassFromString(_type) new];
        if (_kind_of_(view, UIView)) {
            objc_setAssociatedObject(view, @"layoutKey", _key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            if (_properties) {
                NSMutableArray *entityProperties = [NSMutableArray array];
                for (NSDictionary *prop in _properties) {
                    DSHLayoutEntityProperty *p = [DSHLayoutEntityProperty propertyWithJson: prop];
                    
                    if (p) {
                        [view setValue: p.value forKey: p.key];
                        [entityProperties addObject: p];
                    }
                }
                
                _entityProperties = entityProperties;
            }
        } else {
            view = nil;
        }
    }
    return view;
}

@end
