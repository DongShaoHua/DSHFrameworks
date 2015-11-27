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

- (void)setCellDetail:(__kindof id)data {
    static int number = 1;
    self.textLabel.text = stringformat(@"Label %02d %2d", number++, number);
}

@end
