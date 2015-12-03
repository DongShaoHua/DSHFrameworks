//
//  MyCollectionViewCell.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/3.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "NSString+DSHStringCategory.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setCellDetail:(__kindof id)data forIndexPath:(NSIndexPath *)indexPath {
    _label.text = stringformat(@"%2ld", indexPath.row);
}

@end
