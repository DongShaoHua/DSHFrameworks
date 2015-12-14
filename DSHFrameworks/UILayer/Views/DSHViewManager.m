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
        _enableDebug = NO;
        _layouts = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray<__kindof UIView *> *)viewWithFile:(NSString *)layoutFileName parent:(UIView *)parent {
    NSArray<__kindof UIView *> *views = nil;
    if (_is_string_nil_or_empty(layoutFileName)) {
        DSHLayoutElement *element = _layouts[layoutFileName];
        if (element) {
            views = [element viewWithElement: parent];
        } else {
            DSHLayoutParser *parser = [DSHLayoutParser new];
            element = [parser parserWithFile: layoutFileName];
            if (element) {
                views = [element viewWithElement: parent];
                [_layouts setObject: element forKey: layoutFileName];
            }
        }
    }

    return views;
}

@end
