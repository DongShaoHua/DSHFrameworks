//
//  DSHListViewController+DSHTableViewCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController+DSHTableViewCategory.h"
#import "NSObject+DSHObjectCategory.h"

@interface DSHListViewController (Private)

- (UITableViewCell *)tableCellWith:(UITableView *)listView forIndexPath:(NSIndexPath *)indePath;

@end

@implementation DSHListViewController (DSHTableViewCategory)

+ (void)load {
    [self exchangeMethod: @selector(getCellWith:forIndexPath:) withNewMethod: @selector(tableCellWith:forIndexPath:)];
}

- (UITableView *)tableView {
    return [self getListView];
}

- (UITableViewCell *)tableCellWith:(UITableView *)listView forIndexPath:(NSIndexPath *)indePath {
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
