//
//  UIColor+DSHColorCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DSHColorCategory)

+ (instancetype)colorWithHex:(long)ARGB;

+ (instancetype)colorWithHexString:(NSString *)ARGB;

+ (instancetype)colorWithHex:(Byte)r green:(Byte)g blue:(Byte)b;
+ (instancetype)colorWithHex:(Byte)a red:(Byte)r green:(Byte)g blue:(Byte)b;

@end
