//
//  DSHTableViewCell.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSHTableViewCell : UITableViewCell

/**
 设置Cell的详细信息
 */
- (void)setCellDetail:(__kindof id)data;

/**
 获取该Cell的Id，默认情况下以类名称做id
 */
+ (NSString *)getCellId;

/**
 获取Cell的高度，默认情况高度为44.0f
 */
+ (CGFloat)getCellHeight;

+ (void)registerCellClassForTable:(UITableView *)tableView;

+ (void)registerCellNibForTable:(UITableView *)tableView;

+ (void)registerCellNibForTable:(UITableView *)tableView nibName:(NSString *)nibName;

@end
