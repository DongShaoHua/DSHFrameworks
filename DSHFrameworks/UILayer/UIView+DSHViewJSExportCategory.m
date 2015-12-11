//
//  UIView+DSHViewJSExportCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIView+DSHViewJSExportCategory.h"
#import "UIColor+DSHColorCategory.h"

@implementation UIView (DSHViewJSExportCategory)

- (void)setViewBackgroundColor:(NSString *)colorString {
    UIColor *background = [UIColor colorWithHexString: colorString];
    [self setBackgroundColor: background];
}

@end
