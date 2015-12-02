//
//  DSHDevelopmentHelper.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define _kind_of_(val, cls) \
    [val isKindOfClass: cls.class]

#define _kind_of_number(val) \
    [val isKindOfClass: NSNumber.class]

#define _kind_of_string(val) \
    [val isKindOfClass: NSString.class]

#define _kind_of_data(val) \
    [val isKindOfClass: NSData.class]

#define _kind_of_array(val) \
    [val isKindOfClass: NSArray.class]

#define _kind_of_dictionary(val) \
    [val isKindOfClass: NSDictionary.class]

#define _exec_block_only_one_time(block) \
    static dispatch_once_t oncetoken = 0; \
    dispatch_once(&oncetoken, block);

#define half_of_number(number) (number) / 2.0f

/**
 设备屏幕大小 --》 IPHONE 4, 4S
 */
extern const CGSize IPHONE_SCREEN_W_320_H_480;

/**
 设备屏幕大小 --》 IPHONE 5, 5S, 5C
 */
extern const CGSize IPHONE_SCREEN_W_320_H_568;

/**
 设备屏幕大小 --》 IPHONE 6, 6S
 */
extern const CGSize IPHONE_SCREEN_W_375_H_667;

/**
 设备屏幕大小 --》 IPHONE 6 PLUS, 6S PLUS
 */
extern const CGSize IPHONE_SCREEN_W_414_H_736;

@interface DSHDevelopmentHelper : NSObject

/**
 获取IOS版本号
 */
+ (CGFloat)getIOSVersion;

/**
 获取设备屏幕点大小
 */
+ (CGSize)getDeviceScreen;

/**
 在主线程中执行block
 */
+ (void)runInMainThread:(dispatch_block_t)block;

/**
 在后台线程中执行block
 */
+ (void)runInBackgroundThread:(dispatch_block_t)block;

/**
 以特定级别在后台现成中执行block
 protity -> DISPATCH_QUEUE_PRIORITY_DEFAULT | DISPATCH_QUEUE_PRIORITY_HIGH ...
 */
+ (void)runInBackgroundThread:(dispatch_block_t)block priority:(int)protity;

/**
 仅在真机的情况下，才执行该代码
 */
+ (void)runNotInSimulator:(dispatch_block_t)block;

/**
 仅在debug模式下运行，release模式下不会执行
 */
+ (void)runNotInRelease:(dispatch_block_t)block;

@end
