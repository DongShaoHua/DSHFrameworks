//
//  UIImage+DSHImageCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DSHImageCategory)

/**
 用指定颜色来创建图像
 */
+ (instancetype)imageFromColor:(UIColor *)color;

/**
 用指定颜色与大小来创建图像
 */
+ (instancetype)imageFromColor:(UIColor *)color rect:(CGRect)rect;

@end
