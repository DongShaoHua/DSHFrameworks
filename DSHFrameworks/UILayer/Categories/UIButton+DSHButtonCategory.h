//
//  UIButton+DSHButtonCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/27.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 按钮的内容布局风格
 */
typedef NS_ENUM(int, DSHButtonContentLayoutStyle) {
    /**
     文本与图片居中，并上文本下图片的方式内容
     */
    DSHButtonContentLayoutStyleCenterTopTitleBottomImage,
    /**
     文本与图片居中，并上图片下文本的方式内容
     */
    DSHButtonContentLayoutStyleCenterTopImageBottomTitle,
    /**
     文本与图片居中，并左文本右图片的方式内容
     */
    DSHButtonContentLayoutStyleCenterLeftTitleRightImage
};

@interface UIButton (DSHButtonCategory)

/**
 设置按钮的内容以指定方式展现内容。
 */
- (void)setButtonContentLayout:(DSHButtonContentLayoutStyle)layoutStyle;

/**
 设置按钮的内容以指定方式展现内容。
 margin -》文本与图片中间的距离。
 */
- (void)setButtonContentLayout:(DSHButtonContentLayoutStyle)layoutStyle margin:(CGFloat)margin;

@end
