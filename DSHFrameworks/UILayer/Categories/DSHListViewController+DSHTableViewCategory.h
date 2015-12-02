//
//  DSHListViewController+DSHTableViewCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController.h"

@interface DSHListViewController (DSHTableViewCategory)<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic, readonly) UITableView *tableView;

@end
