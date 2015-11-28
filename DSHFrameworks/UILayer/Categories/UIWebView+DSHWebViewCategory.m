//
//  UIWebView+DSHWebViewCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/28.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIWebView+DSHWebViewCategory.h"

@implementation UIWebView (DSHWebViewCategory)

- (void)loadGif:(NSString *)gifFileName {
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    self.scrollView.bounces = NO;
    self.userInteractionEnabled = NO;
    NSString *html = [NSString stringWithFormat: @"<!doctype html /><html><head></head><body style='margin: 0px; padding: 0px;'><img src='%@' style='width: 100%%; height: 100%%; border-width: 0px' /><body></html>", gifFileName];
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSURL *baseURL = [NSURL fileURLWithPath: path];
    [self loadHTMLString: html baseURL: baseURL];
}

@end
