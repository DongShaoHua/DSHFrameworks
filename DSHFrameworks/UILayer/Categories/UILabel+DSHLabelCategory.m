//
//  UILabel+DSHLabelCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UILabel+DSHLabelCategory.h"

@implementation UILabel (DSHLabelCategory)

- (CGSize)contentSizeWith:(CGSize)limitedSize {
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attrubites = @{
                                 NSFontAttributeName: self.font,
                                 NSParagraphStyleAttributeName: style
                                 };
    
    return [self contentSizeWith: limitedSize options: NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attribute: attrubites];
}

- (CGSize)contentSizeWith:(CGSize)limitedSize options:(NSStringDrawingOptions)options attribute:(NSDictionary *)attribute {
    return [self.text boundingRectWithSize: limitedSize options: options attributes: attribute context: nil].size;
}



@end
