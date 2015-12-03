//
//  DSHMainCell.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/28.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHMainCell.h"
#import "NSString+DSHStringCategory.h"

@implementation DSHMainCell

- (void)setCellDetail:(__kindof id)data forIndexPath:(NSIndexPath *)indexPath {
    if (data) {
        self.textLabel.text = data;
    } else {
        self.textLabel.text = stringformat(@"Label %02ld %2ld", indexPath.row, indexPath.row);
    }
}

@end
