//
//  NSString+DSHStringCategory.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "NSString+DSHStringCategory.h"
#import "DSHDevelopmentHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+DSHDataCategory.h"

@implementation NSString (DSHStringCategory)

+ (BOOL)isNilOrEmpty:(NSString *)string {
    BOOL isEmpty = YES;
    if (string && _kind_of_(string, NSString) && string.length > 0) {
        isEmpty = ([string stringByReplacingOccurrencesOfString: @" " withString: @""].length > 0);
    }
    return isEmpty;
}

- (NSURL *)toUrl {
    NSURL *url = nil;
    if ([[self lowercaseString] hasPrefix: @"http://"]) {
        url = [NSURL URLWithString: self];
    } else {
        url = [NSURL fileURLWithPath: self];
    }
    return url;
}

- (NSString *)toMD5 {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int)strlen(cStr), result );
    NSMutableString *md5String = [NSMutableString string];
    for (int i = 0; i < 16; ++i) {
        [md5String appendFormat: @"%02X", result[i]];
    }
    return md5String;
}

- (NSDictionary *)toJSON {
    NSData *data = [self dataUsingEncoding: NSUTF8StringEncoding];
    if (data) {
        return [data toDictionary];
    } else {
        return nil;
    }
}

- (BOOL)isMatch:(NSString *)pattern {
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    return [predicate evaluateWithObject: self];
}

@end
