//
//  DSHApplication.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHApplication.h"

@implementation DSHApplication

+ (CGFloat)getSystemVersion {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (CGSize)getDeviceScreen {
    return [UIScreen mainScreen].bounds.size;
}

+ (UIWindow *)setupWindowWithRootControoler:(UIViewController *)controller {
    UIWindow *window =  [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    window.backgroundColor = [UIColor blackColor];
    window.rootViewController = controller;
    return window;
}

@end
