//
//  UITextView+DSHTextViewCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/8.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (DSHTextViewCategory)

- (void)registerTextValid:(void (^)(UITextView *))block;
- (void)removeTextValid;

@end
