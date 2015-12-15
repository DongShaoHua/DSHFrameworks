//
//  DSHLayoutView.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/14.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHLayoutView.h"
#import "DSHDevelopmentHelper.h"
#import "NSString+DSHStringCategory.h"

@implementation DSHLayoutView

- (instancetype)init {
    self = [super init];
    if (self) {
        _viewProperties = [NSMutableArray array];
        _subItems = [NSMutableArray array];
    }
    return self;
}

- (__kindof UIView *)viewWithLayout:(UIView *)parent environment:(JSContext *)window {
    UIView *view = nil;
    if (!_is_string_nil_or_empty(_viewClassName)) {
        view = [NSClassFromString(_viewClassName) new];
        if (_kind_of_(view, UIView)) {
            [parent addSubview: view];
            if (_viewProperties) {
                for (DSHLayoutViewProperty *property in _viewProperties) {
                    [property bindView: view WithParentView: parent];
                }
            }
            
            NSString *viewkey = [DSHLayoutViewProperty getViewKey: view];
            if (!_is_string_nil_or_empty(viewkey) && window) {
                window[viewkey] = view;
            }
            
            if (_subItems) {
                for (DSHLayoutView *subLayoutView in _subItems) {
                    [subLayoutView viewWithLayout: view environment: window];
                }
            }
        }
    }
    return view;
}

@end
