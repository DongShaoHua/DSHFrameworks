//
//  UITextView+DSHTextViewCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/8.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (DSHTextViewCategory)

/**
 注册文本改变时，执行的block
 */
- (void)registerTextValid:(void (^)(UITextView *))block;
/**
 移除文本改变时，执行的block
 */
- (void)removeTextValid;

@end
