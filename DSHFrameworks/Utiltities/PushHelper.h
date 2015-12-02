//
//  PushHelper.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushHelper : NSObject

+ (void)registerPush:(UIApplication *)application launchOption:(NSDictionary *)dictionary;

@end
