//
//  DSHDevelopmentHelper.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHDevelopmentHelper.h"

const CGSize IPHONE_SCREEN_W_320_H_480 = { 320.0f, 480.0f };
const CGSize IPHONE_SCREEN_W_320_H_568 = { 320.0f, 568.0f };
const CGSize IPHONE_SCREEN_W_375_H_667 = { 375.0f, 667.0f };
const CGSize IPHONE_SCREEN_W_414_H_736 = { 413.0f, 736.0f };

@implementation DSHDevelopmentHelper

+ (CGFloat)getIOSVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (CGSize)getDeviceScreen {
    return [UIScreen mainScreen].bounds.size;
}

+ (void)runInMainThread:(dispatch_block_t)block {
    if (block) {
        if ([[NSThread currentThread] isMainThread]) {
            block();
        } else {
            dispatch_async(dispatch_get_main_queue(), block);
        }
    }
}

+ (void)runInBackgroundThread:(dispatch_block_t)block {
    [self runInBackgroundThread: block priority: DISPATCH_QUEUE_PRIORITY_DEFAULT];
}

+ (void)runInBackgroundThread:(dispatch_block_t)block priority:(int)priority {
    if (block) {
        dispatch_async(dispatch_get_global_queue(priority, 0), block);
    }
}

+ (void)runNotInSimulator:(dispatch_block_t)block {
#if !TARGET_IPHONE_SIMULATOR
    if (block) {
        block();
    }
#endif 
}

+ (void)runNotInRelease:(dispatch_block_t)block {
#ifndef __OPTIMIZE__
    if (block) {
        block();
    }
#endif
}


@end
