//
//  UILabel+DSHLabelCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DSHLabelCategory)

/**
 根据文本内容以及限制大小返回文本可视区域
 */
- (CGSize)contentSizeWith:(CGSize)limitedSize;

/**
 根据文本内容,文本属性以及限制大小返回文本可视区域
 */
- (CGSize)contentSizeWith:(CGSize)limitedSize options:(NSStringDrawingOptions)options attribute:(NSDictionary *)attribute;

@end
