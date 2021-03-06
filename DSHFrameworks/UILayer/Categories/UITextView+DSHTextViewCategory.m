//
//  UITextView+DSHTextViewCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/8.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UITextView+DSHTextViewCategory.h"
#import "DSHDevelopmentHelper.h"
#import <objc/runtime.h>

@interface UITextView(DSHPrivate)

- (void)validNotification:(NSNotification *)notification;

@end

#define TextFieldValidBlock @"validBlock"

@implementation UITextView (DSHTextViewCategory)

- (void)registerTextValid:(void (^)(UITextView *))block {
    if (block) {
        objc_setAssociatedObject(self, TextFieldValidBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver: self selector: @selector(validNotification:) name: UITextViewTextDidBeginEditingNotification object: self];
    }
}

- (void)removeTextValid {
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter removeObserver: self];
}

- (void)validNotification:(NSNotification *)notification {
    if (notification && notification.object) {
        id block = objc_getAssociatedObject(self, TextFieldValidBlock);
        if (block && _kind_of_(notification.object, UITextView)) {
            void (^validBlock)(UITextView *) = block;
            validBlock(notification.object);
        }
    }
}


@end
