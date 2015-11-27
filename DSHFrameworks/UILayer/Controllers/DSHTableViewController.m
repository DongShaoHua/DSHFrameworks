//
//  DSHTableViewController.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHTableViewController.h"

@interface DSHTableViewController ()

@end

@implementation DSHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [self getListView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)getCellWith:(UITableView *)listView forIndexPath:(NSIndexPath *)indePath {
    UITableViewCell *cell = nil;
    DSHCellNibInfo *cellInfo =  [self getCellInfoWith: listView forIndexPath: indePath];
    if (cellInfo.hasNib) {
        cell = cellInfo.allocCellBlock ? cellInfo.allocCellBlock(cellInfo.cellId) : [listView dequeueReusableCellWithIdentifier: cellInfo.cellId forIndexPath: indePath];
    } else {
        cell = [listView dequeueReusableCellWithIdentifier: cellInfo.cellId];
        if (!cell) {
            cell = cellInfo.allocCellBlock ? cellInfo.allocCellBlock(cellInfo.cellId) : [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellInfo.cellId];
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self getListDataCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self getCellWith: tableView forIndexPath: indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self configRowDetail: tableView cell: cell forIndexPath: indexPath];
}

@end
