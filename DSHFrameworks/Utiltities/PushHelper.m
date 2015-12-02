//
//  PushHelper.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "PushHelper.h"
#import "DSHDevelopmentHelper.h"

@implementation PushHelper

+ (void)registerPush:(UIApplication *)application {
    if (8.0 <= [DSHDevelopmentHelper getIOSVersion]) {
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes: UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories: nil];
        [application registerUserNotificationSettings: setting];
    } else {
        [application registerForRemoteNotificationTypes: UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    }
}

@end
