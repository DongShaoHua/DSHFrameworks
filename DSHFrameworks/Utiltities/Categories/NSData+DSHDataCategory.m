//
//  NSData+DSHDataCategory.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "NSData+DSHDataCategory.h"
#import "NSDictionary+DSHDictionaryCategory.h"

@implementation NSData (DSHDataCategory)

- (NSMutableDictionary *)toDictionary {
    return [self toDictionary: nil];
}

- (NSMutableDictionary *)toDictionary:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData: self options: NSJSONReadingMutableContainers error: error];
}

- (id)toModel:(Class)cls {
    NSDictionary *dictionary = [self toDictionary];
    if (dictionary) {
        return [dictionary toModel: cls];
    } else {
        return nil;
    }
}

@end
