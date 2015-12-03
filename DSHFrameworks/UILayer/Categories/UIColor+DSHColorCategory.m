//
//  UIColor+DSHColorCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIColor+DSHColorCategory.h"

@implementation UIColor (DSHColorCategory)

+ (instancetype)colorWithHex:(long)ARGB {
    CGFloat a = 1.0f;
    CGFloat r = 1.0f;
    CGFloat g = 1.0f;
    CGFloat b = 1.0f;
    
    if (0xffffff >= ARGB) {
        r = ((ARGB >> 16) & 0x00ff) / 255.0f;
        g = ((ARGB >> 8) & 0x0000ff) / 255.0f;
        b = (ARGB & 0xff) / 255.0f;
    } else {
        a = ((ARGB >> 24) & 0xff) / 255.0f;
        r = ((ARGB >> 16) & 0x00ff) / 255.0f;
        g = ((ARGB >> 8) & 0x0000ff) / 255.0f;
        b = (ARGB & 0xff) / 255.0f;
    }
    return [UIColor colorWithRed: r green: g blue: b alpha: a];
}

+ (instancetype)colorWithHexString:(NSString *)ARGB {
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern: @"^#([0-9a-fA-F]{2})?[0-9a-fA-F]{6}$" options: 0 error: nil];
    NSTextCheckingResult *result = [regex firstMatchInString: ARGB options: 0 range: NSMakeRange(0, ARGB.length)];
    
    if (result) {
        CGFloat a = 1.0f;
        CGFloat r = 0.0f;
        CGFloat g = 0.0f;
        CGFloat b = 0.0f;
        if (ARGB.length == 9) {
            a = strtoul([ARGB substringWithRange: NSMakeRange(1, 2)].UTF8String, 0, 16) / 255.0f;
            r = strtoul([ARGB substringWithRange: NSMakeRange(3, 2)].UTF8String, 0, 16) / 255.0f;
            g = strtoul([ARGB substringWithRange: NSMakeRange(5, 2)].UTF8String, 0, 16) / 255.0f;
            b = strtoul([ARGB substringWithRange: NSMakeRange(7, 2)].UTF8String, 0, 16) / 255.0f;
        } else {
            r = strtoul([ARGB substringWithRange: NSMakeRange(1, 2)].UTF8String, 0, 16) / 255.0f;
            g = strtoul([ARGB substringWithRange: NSMakeRange(3, 2)].UTF8String, 0, 16) / 255.0f;
            b = strtoul([ARGB substringWithRange: NSMakeRange(5, 2)].UTF8String, 0, 16) / 255.0f;
        }
        return [UIColor colorWithRed: r green: g blue: b alpha: a];
    } else {
        return nil;
    }
}

+ (instancetype)colorWithHex:(Byte)r green:(Byte)g blue:(Byte)b {
    return [self colorWithHex: 255.0f red: r green: g blue: b];
}

+ (instancetype)colorWithHex:(Byte)a red:(Byte)r green:(Byte)g blue:(Byte)b {
    return [UIColor colorWithRed: r / 255.0f green: g / 255.0f blue: b / 255.0f alpha: a / 255.0f];
}

@end
