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

#import <PureLayout.h>

@protocol DSHViewJSExportProtocol <JSExport>

@property(assign, nonatomic) CGRect frame;
@property(nonatomic, readonly) UIView *superview;

/**
 视图的圆角半径
 */
@property (assign, nonatomic) CGFloat cornerRadius;
/**
 视图的边宽和
 */
@property (assign, nonatomic) CGFloat borderWidth;
/**
 视图的边的颜色
 */
@property (nonatomic) UIColor *borderColor;

/**
 将视图剪切为圆形
 注：视图被剪切为圆形，但原视图的大小区域并未改变
 */
- (void)clipToCircle;

- (void)setViewBackgroundColor:(NSString *)colorString;

#pragma mark ==== PureLayout AutoLayout ======

- (NSArray<NSLayoutConstraint *> *)autoCenterInSuperview;
- (NSLayoutConstraint *)autoSetDimension:(ALDimension)dimension toSize:(CGFloat)size;
- (NSArray<NSLayoutConstraint *> *)autoPinEdgesToSuperviewEdges;

- (void)sizeToFit;

@end

@interface UIView (DSHViewJSExportCategory) <DSHViewJSExportProtocol>
@end
