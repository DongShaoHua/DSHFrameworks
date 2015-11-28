//
//  UIButton+DSHButtonCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/27.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIButton+DSHButtonCategory.h"
#import "DSHDevelopmentHelper.h"


@implementation UIButton (DSHButtonCategory)

- (void)setButtonContentLayout:(DSHButtonContentLayoutStyle)layoutStyle {
    [self setButtonContentLayout: layoutStyle margin: 3.0f];
}

- (void)setButtonContentLayout:(DSHButtonContentLayoutStyle)layoutStyle margin:(CGFloat)margin {
    [self layoutSubviews];
    
    CGSize totalContentSize = self.bounds.size;
    CGSize labelSize = self.titleLabel.frame.size;
    CGSize imageSize = self.imageView.frame.size;

    switch (layoutStyle) {
        case DSHButtonContentLayoutStyleCenterTopTitleBottomImage:
        case DSHButtonContentLayoutStyleCenterTopImageBottomTitle: {
            self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            CGFloat totalAdditionHeight = labelSize.height + imageSize.height + margin;
            CGFloat edgeTop = half_of_number((totalContentSize.height - totalAdditionHeight));
            CGFloat imageLeft = half_of_number((totalContentSize.width - imageSize.width));
            
            if (layoutStyle == DSHButtonContentLayoutStyleCenterTopImageBottomTitle) {
                [self setImageEdgeInsets: UIEdgeInsetsMake(edgeTop, imageLeft, 0, 0)];
                [self setTitleEdgeInsets: UIEdgeInsetsMake(edgeTop + margin + imageSize.height,
                                                           half_of_number((totalContentSize.width - labelSize.width)) - imageSize.width, 0, 0)];
            } else {
                [self setTitleEdgeInsets: UIEdgeInsetsMake(edgeTop, half_of_number((totalContentSize.width - labelSize.width)) - imageSize.width, 0, 0)];
                [self setImageEdgeInsets: UIEdgeInsetsMake(edgeTop + labelSize.height + margin, imageLeft, 0, 0)];
            }
            break;
        }
        case DSHButtonContentLayoutStyleCenterLeftTitleRightImage: {
            self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            CGFloat totalAdditionWidth = labelSize.width + imageSize.width + margin;
            CGFloat labelLeft = half_of_number((totalContentSize.width - totalAdditionWidth));
            [self setTitleEdgeInsets: UIEdgeInsetsMake(0, - imageSize.width + labelLeft, 0, 0)];
            [self setImageEdgeInsets: UIEdgeInsetsMake(0, labelLeft + margin + labelSize.width, 0, 0)];
            break;
        }
        default:
            break;
    }
}

@end
