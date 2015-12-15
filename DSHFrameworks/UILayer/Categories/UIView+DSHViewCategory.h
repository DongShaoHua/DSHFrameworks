//
//  UIView+DSHViewCategory.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (DSHViewCategory)

/**
 视图的圆角半径
 */
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
/**
 视图的边宽和
 */
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
/**
 视图的边的颜色
 */
@property (nonatomic) IBInspectable UIColor *borderColor;

/**
 从与类相同名称的Nib文件中加载第一个View
 */
+ (__kindof UIView *)loadViewFromNib;

/**
 从指定nib文件中加载第一个View对象
 */
+ (__kindof UIView *)loadViewFromNib:(NSString *)nibFileName;

/**
 访问View的所有子View，并以子View作为参数执行block
 */
+ (void)enumAllChildren:(UIView *)view usingBlock:(void (^)(__kindof UIView *))block;

/**
 访问所有子View，并以子View作为参数执行block
 */
- (void)enumerateAllChildren:(void (^)(__kindof UIView *))block;

/**
 查找第一个指定Class类型的父View
 */
- (__kindof UIView *)firstParentOfClass:(Class)viewClass;

/**
 查找第一个指定Class类型的子View
 */
- (__kindof UIView *)firstChildOfClass:(Class)viewClass;

#pragma mark ========= View 添加渐进渐出 扩展方法
/**
 视图渐渐显示
 timeinterval -> 动画持续时间
 completed -> 动画完成时执行该block
 */
- (void)fedeIn;
- (void)fedeIn:(NSTimeInterval)timeinterval;
- (void)fedeIn:(NSTimeInterval)timeinterval completed:(dispatch_block_t)completed;
/**
 视图渐渐消失
 timeinterval -> 动画持续时间
 completed -> 动画完成时执行该block
 */
- (void)fedeOut;
- (void)fedeOut:(NSTimeInterval)timeinterval;
- (void)fedeOut:(NSTimeInterval)timeinterval completed:(dispatch_block_t)completed;

/**
 将视图剪切为圆形
 注：视图被剪切为圆形，但原视图的大小区域并未改变
 */
- (void)clipToCircle;

@end

