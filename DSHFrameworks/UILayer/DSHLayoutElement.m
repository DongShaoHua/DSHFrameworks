//
//  DSHLayoutElement.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/14.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHLayoutElement.h"

@implementation DSHLayoutElement

- (instancetype)init {
    self = [super init];
    if (self) {
        _variables = [NSMutableDictionary dictionary];
        _layoutViews = [NSMutableArray array];
        _functions = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray<__kindof UIView *> *)viewWithElement:(UIView *)parent environment:(JSContext *)window {
    NSMutableArray *views = [NSMutableArray array];
    for (DSHLayoutView *layoutview in _layoutViews) {
        UIView *view = [layoutview viewWithLayout: parent environment: window];
        if (view) {
            [views addObject: view];
        }
    }
    return views;
}

@end
