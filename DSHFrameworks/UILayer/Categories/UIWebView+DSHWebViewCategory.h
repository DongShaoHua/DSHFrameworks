//
//  UIWebView+DSHWebViewCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/28.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@interface UIWebView (DSHWebViewCategory)

/**
 显示gif图片
 */
- (void)loadGif:(NSString *)gifFileName;

- (JSContext *)getRelativeContext;

@end
