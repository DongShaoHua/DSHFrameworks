//
//  NSDictionary+DSHDictionaryCategory.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "NSDictionary+DSHDictionaryCategory.h"
#import "DSHDevelopmentHelper.h"
#import "NSObject+DSHObjectCategory.h"

@implementation NSDictionary (DSHDictionaryCategory)

- (NSInteger)getIntegerWithKey:(NSString *)key {
    NSInteger integer = 0;
    id value = self[key];
    if (value && (_kind_of_number(value) || _kind_of_string(value))) {
        integer = [value integerValue];
    }
    return integer;
}

- (NSData *)toData {
    return [self toData: nil];
}

- (NSData *)toData:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject: self options:NSJSONWritingPrettyPrinted error: error];
}

- (id)toModel:(Class)cls {
    id _model = [cls new];
    NSArray *modelProperties = [cls getAllProperty];
    if (modelProperties) {
        for (NSString *property in modelProperties) {
            id value = self[property];
            if (value && !_kind_of_(value, NSNull)) {
                [_model setValue: value forKey: property];
            }
        }
    }
    
    return _model;
}

- (NSString *)toModelCodeString {
    NSMutableString *code = [NSMutableString string];
    
    for (NSString *key in self.allKeys) {
        id value = self[key];
        NSString *flag = @"strong";
        NSString *type = @"NSObject *";
        
        if (value) {
            if (_kind_of_string(value)) {
                type = @"NSString *";
            } else {
                if (_kind_of_number(value)) {
                    flag = @"assign";
                    NSNumber *number = value;
                    if (strcmp(number.objCType, @encode(int))) {
                        type = @"NSInteger ";
                    } else {
                        if (strcmp(number.objCType, @encode(BOOL))) {
                            type = @"BOOL ";
                        } else {
                            if (strcmp(number.objCType, @encode(float))) {
                                type = @"float ";
                            } else {
                                if (strcmp(number.objCType, @encode(double))) {
                                    type = @"double ";
                                }
                            }
                        }
                    }
                }
            }
        }
        
        [code appendFormat: @"@property (%@, nonatomic) %@%@; \n", flag, type, key];
    }
    
    return code;
}

@end
