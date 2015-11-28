//
//  DSHViewController.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//
#import "DSHApplication.h"

extern NSString * const DSHViewControllerResetNotification;

@interface DSHViewController : UIViewController

#pragma mark ======= 重置Controller通知 =======
/**
 注册重置Controller通知
 */
- (BOOL)registerRestNotification;

/**
 重置Controller通知方法
 */
- (void)resetController:(NSNotification *)notification;

#pragma mark ==== 导航栏相关 ====
/**
 自定义导航栏左边按钮图片
 */
- (void)customizeLeftWithImage:(NSString *)image frame:(CGRect)frame;

/**
 自定义导航栏左边按钮文字
 */
- (void)customizeLeftWithTitle:(NSString *)title frame:(CGRect)frame;

/**
 自定义导航栏右边按钮图片
 */
- (void)customizeRightWithImage:(NSString *)image frame:(CGRect)frame;

/**
 自定义导航栏右边按钮文字
 */
- (void)customizeRightWithTitle:(NSString *)title frame:(CGRect)frame;

/**
 自定义导航栏按钮点样式
 */
- (void)customizeNavigateItem:(BOOL)isleft image:(NSString *)image frame:(CGRect)frame target:(id)target selector:(SEL)selector;

/**
 自定义导航栏按钮点样式
 */
- (void)customizeNavigateItem:(BOOL)isleft title:(NSString *)title frame:(CGRect)frame target:(id)target selector:(SEL)selector;

/**
 自定义导航栏按钮点样式
 */
- (void)customizeNavigateItem:(BOOL)isleft customizeView:(UIButton *)customizeView target:(id)target selector:(SEL)selector;

/**
 自定义导航栏左边按钮点击事件
 */
- (void)leftClick:(id)sender;

/**
 自定义导航栏右边按钮点击事件
 */
- (void)rightClick:(id)sender;

#pragma mark ==== 界面跳转，以及登录状态判断等 ====
/**
 页面跳转
 */
- (void)showViewController:(DSHViewController *)controller;

/**
 页面跳转
 */
- (void)showDetailViewController:(DSHViewController *)controller;

/**
 该方法在调用DSHViewController的pushViewController方法时执行。
 参数 controller 代表将要跳转的控制器
 返回值 代表是否继续执行跳转
 */
- (BOOL)willGoToOtherController:(DSHViewController *)controller;

/**
 为controller的View添加点击关闭键盘的功能
 */
- (void)enableTapForEndEdit;

@end
