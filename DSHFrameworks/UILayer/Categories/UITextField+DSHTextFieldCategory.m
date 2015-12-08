//
//  UITextField+DSHTextFieldCategory.m
//  
//
//  Created by dongsh on 15/12/8.
//
//

#import "UITextField+DSHTextFieldCategory.h"
#import "DSHDevelopmentHelper.h"
#import <objc/runtime.h>

@interface UITextField(DSHPrivate)

- (void)validNotification:(NSNotification *)notification;

@end

#define textValidBlock @"validBlock"
#define textValidRule @"ruleArray"

@implementation UITextField (DSHTextFieldCategory)

- (void)registerTextValid:(void (^)(UITextField *))block {
    if (block) {
        objc_setAssociatedObject(self, textValidBlock, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
        [defaultCenter addObserver: self selector: @selector(validNotification:) name:UITextFieldTextDidChangeNotification object: self];
    }
}

- (void)removeTextValid {
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter removeObserver: self];
}

- (void)validNotification:(NSNotification *)notification {
    if (notification && notification.object) {
        id block = objc_getAssociatedObject(self, textValidBlock);
        if (block && _kind_of_(notification.object, UITextField)) {
            void (^validBlock)(UITextField *) = block;
            validBlock(notification.object);
        }
    }
}

@end

