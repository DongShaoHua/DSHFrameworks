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

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [ScriptManager new];
    }
    return self;
}

- (__kindof UIView *)viewWithFile:(NSString *)filePath parentView:(UIView *)parentView {
    _entityFileName = filePath;
    UIView *view = nil;
    if (![NSString isNilOrEmpty: _entityFileName]) {
        NSString *layoutStr = [NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil];
        if (![NSString isNilOrEmpty: layoutStr]) {
            NSDictionary *layoutJson = [layoutStr toJSON];
            if (_kind_of_dictionary(layoutJson)) {
                DSHLayoutEntity *entity = [layoutJson toModel: DSHLayoutEntity.class];
                [self viewWithEntity: entity parentView: parentView];
            }
        }
    }
    return view;
}

- (UIView *)viewWithEntity:(DSHLayoutEntity *)entity parentView:(UIView *)parentView {
    UIView *view = nil;
    if (_kind_of_(entity, DSHLayoutEntity)) {
        entity.manager = _manager;
        view = [entity createViewWithEntity: parentView];
        if (view) {
            [parentView addSubview: view];
            if (entity.subviews && _kind_of_array(entity.subviews) && entity.subviews.count > 0) {
                for (NSDictionary *json in entity.subviews) {
                    if (_kind_of_dictionary(json)) {
                        DSHLayoutEntity *subentity = [json toModel: DSHLayoutEntity.class];
                        [self viewWithEntity: subentity parentView: view];
                    }
                }
            }
        }
    }
    return view;
}

@end

@implementation DSHLayoutEntityProperty

+ (DSHLayoutEntityProperty *)propertyWithJson:(NSDictionary *)json parentView:(UIView *)parentView {
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

- (__kindof UIView *)createViewWithEntity:(UIView *)parentView {
    UIView *view = nil;
    
    if (![NSString isNilOrEmpty: _type]) {
        view = (UIView *)[NSClassFromString(_type) new];
        if (_kind_of_(view, UIView)) {
            _manager.window[@"view_label"] = view;
            objc_setAssociatedObject(view, @"layoutKey", _key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            if (_properties) {
                NSMutableArray *entityProperties = [NSMutableArray array];
                for (NSDictionary *prop in _properties) {
                    DSHLayoutEntityProperty *p = [DSHLayoutEntityProperty propertyWithJson: prop parentView: parentView];
                    
                    if (p) {
                        @try {
                            [view setValue: p.value forKey: p.key];
                        } @catch(NSException *exception) {
                            NSLog(@"%@", exception);
                        } @finally {
                            
                        }
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
