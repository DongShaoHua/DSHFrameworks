//
//  DSHApplication.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSHDevelopmentHelper.h"


@interface DSHApplication : UIApplication

/**
 获取IOS版本号
 */
+ (CGFloat)getIOSVersion;

/**
 获取设备屏幕点大小
 */
+ (CGSize)getDeviceScreen;

/**
 设置Window并设置其根视图
 */
+ (UIWindow *)setupWindowWithRootControoler:(UIViewController *)controller;

@end
