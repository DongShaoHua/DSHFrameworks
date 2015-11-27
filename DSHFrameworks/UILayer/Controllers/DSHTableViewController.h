//
//  DSHTableViewController.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController.h"
#import "DSHTableViewCell.h"

@interface DSHTableViewController : DSHListViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;

@end

