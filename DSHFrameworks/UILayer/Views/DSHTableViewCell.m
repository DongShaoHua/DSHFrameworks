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

+ (void)registerCellClassForTable:(UITableView *)tableView {
    [tableView registerClass: self.class forCellReuseIdentifier: [self getCellId]];
}

+ (void)registerCellNibForTable:(UITableView *)tableView {
    [self registerCellNibForTable: tableView nibName: [self getCellId]];
}

+ (void)registerCellNibForTable:(UITableView *)tableView nibName:(NSString *)nibName {
    UINib *nib = [UINib nibWithNibName: nibName bundle: [NSBundle mainBundle]];
    if (nib) {
        [tableView registerNib: nib forCellReuseIdentifier: [self getCellId]];
    }
}

@end
