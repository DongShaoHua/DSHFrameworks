//
//  DSHApplication.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHApplication.h"

@implementation DSHApplication

+ (UIWindow *)setupWindowWithRootControoler:(UIViewController *)controller {
    UIWindow *window =  [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    [window makeKeyAndVisible];
    window.backgroundColor = [UIColor blackColor];
    window.rootViewController = controller;
    return window;
}

@end
