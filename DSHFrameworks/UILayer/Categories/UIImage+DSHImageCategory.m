//
//  UIImage+DSHImageCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIImage+DSHImageCategory.h"

@implementation UIImage (DSHImageCategory)

+ (instancetype)imageFromColor:(UIColor *)color {
    return [self imageFromColor: color rect: CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)];
}

+ (instancetype)imageFromColor:(UIColor *)color rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
