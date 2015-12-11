//
//  UIView+DSHViewJSExportCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "UIView+DSHViewCategory.h"

@protocol DSHViewJSExportProtocol <JSExport>

@property(assign, nonatomic) CGRect frame;

/**
 设置视图的圆角半径
 */
- (void)setCornerRadius:(CGFloat)radius;
/**
 设置视图的边宽和边的颜色
 */
- (void)setBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor;
/**
 将视图剪切为圆形
 注：视图被剪切为圆形，但原视图的大小区域并未改变
 */
- (void)clipToCircle;

- (void)setViewBackgroundColor:(NSString *)colorString;

@end

@interface UIView (DSHViewJSExportCategory) <DSHViewJSExportProtocol>

@end
