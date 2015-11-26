//
//  DSHDevelopmentHelper.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHDevelopmentHelper.h"

@implementation DSHDevelopmentHelper

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

@end
