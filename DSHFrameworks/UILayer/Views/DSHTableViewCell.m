//
//  DSHTableViewCell.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHTableViewCell.h"

@implementation DSHTableViewCell

- (void)setCellDetail:(__kindof id)data {
    
}

+ (NSString *)getCellId {
    return [[self class] description];
}

+ (CGFloat)getCellHeight {
    return 44.0f;
}

@end
