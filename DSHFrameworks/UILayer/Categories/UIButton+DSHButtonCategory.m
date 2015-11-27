//
//  UIButton+DSHButtonCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/27.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIButton+DSHButtonCategory.h"

@interface UIButton(Private)

@end

@implementation UIButton (DSHButtonCategory)


- (void)setButtonContentLayout:(DSHButtonContentLayoutStyle)layoutStyle {
    [self setButtonContentLayout: layoutStyle];
}

- (void)setButtonContentLayout:(DSHButtonContentLayoutStyle)layoutStyle margin:(CGFloat)margin {
    [self layoutIfNeeded];
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
    CGSize totalContentSize = self.bounds.size;
    CGSize labelSize = self.titleLabel.frame.size;
    CGSize imageSize = self.imageView.frame.size;
    
    CGFloat widthoflabelAndImageAdditon = labelSize.width + imageSize.width;
    CGFloat heightoflabelAndImageAddition = labelSize.height + imageSize.height;
    
    switch (layoutStyle) {
        case DSHButtonContentLayoutStyleCenterTopTitleBottomImage: {
            CGFloat totalAdditionHeight = heightoflabelAndImageAddition + margin;
            
            break;
        }
        case DSHButtonContentLayoutStyleCenterTopImageBottomTitle: {
            break;
        }
        case DSHButtonContentLayoutStyleCenterLeftTitleRightImage: {
            break;
        }
        default:
            break;
    }
}

@end
