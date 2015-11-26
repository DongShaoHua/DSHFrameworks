//
//  UIView+DSHViewCategory.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIView+DSHViewCategory.h"

@implementation UIView (DSHViewCategory)

+ (__kindof UIView *)loadViewFromNib {
    NSString *name = [[self class] description];
    return [self loadViewFromNib: name];
}

+ (__kindof UIView *)loadViewFromNib:(NSString *)nibFileName {
    return [[[NSBundle mainBundle] loadNibNamed: nibFileName owner: nil options: nil] firstObject];
}

@end
