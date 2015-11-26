//
//  UIView+DSHViewCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DSHViewCategory)

/**
 从与类相同名称的Nib文件中加载第一个View
 */
+ (__kindof UIView *)loadViewFromNib;

/**
 从指定nib文件中加载第一个View对象
 */
+ (__kindof UIView *)loadViewFromNib:(NSString *)nibFileName;

@end
