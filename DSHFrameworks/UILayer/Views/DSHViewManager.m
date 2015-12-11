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

#import "DSHLayoutParser.h"

@implementation DSHViewManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [ScriptManager new];
    }
    return self;
}

- (__kindof UIView *)viewWithFile:(NSString *)filePath parentView:(UIView *)parentView {
    _layoutFileName = filePath;
    UIView *view = nil;
    DSHLayoutParser *parser = [DSHLayoutParser new];
    view = [parser loadViewWithUrl: _layoutFileName parentView: parentView];
    return view;
}

@end
