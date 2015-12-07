//
//  UIColor+DSHColorCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DSHColorCategory)

/**
 将16进制颜色值转换为color对象 0x000000 -> color
 */
+ (instancetype)colorWithHex:(long)ARGB;

/**
 将字符床转换为color对象  #00000000 -> color
 */
+ (instancetype)colorWithHexString:(NSString *)ARGB;

/**
 通过 rgb 来创建 颜色对象
 */
+ (instancetype)colorWith:(Byte)r green:(Byte)g blue:(Byte)b;

/**
 通过 argb 来创建 颜色对象
 */
+ (instancetype)colorWith:(Byte)a red:(Byte)r green:(Byte)g blue:(Byte)b;

@end
