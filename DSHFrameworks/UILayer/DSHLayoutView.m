//
//  DSHLayoutView.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/14.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHLayoutView.h"

@implementation DSHLayoutView

- (instancetype)init {
    self = [super init];
    if (self) {
        _viewProperties = [NSMutableArray array];
        _subItems = [NSMutableArray array];
    }
    return self;
}

- (__kindof UIView *)viewWithLayout:(UIView *)parentView {
    UIView *view = nil;
    return view;
}

@end
