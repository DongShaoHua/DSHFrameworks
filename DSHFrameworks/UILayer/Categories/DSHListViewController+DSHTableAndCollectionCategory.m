//
//  DSHListViewController+DSHTableAndCollectionCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/3.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController+DSHTableAndCollectionCategory.h"
#import "NSObject+DSHObjectCategory.h"
#import "DSHDevelopmentHelper.h"

@interface DSHListViewController(Private)

- (__kindof UIView *)listCellWith:(__kindof UIView *)listView forIndexPath:(NSIndexPath *)indePath;
- (UITableViewCell *)tableCellWith:(UITableView *)listView forIndexPath:(NSIndexPath *)indePath;
- (UICollectionViewCell *)collectionViewCellWith:(UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath;

@end

@implementation DSHListViewController (DSHTableAndCollectionCategory)

+ (void)load {
    [self exchangeMethod: @selector(getCellWith:forIndexPath:) withNewMethod: @selector(listCellWith:forIndexPath:)];
}

- (__kindof UIView *)listCellWith:(__kindof UIView *)listView forIndexPath:(NSIndexPath *)indePath {
    if (_kind_of_(listView, UITableView)) {
        return [self tableCellWith: listView forIndexPath: indePath];
    } else {
        if (_kind_of_(listView, UICollectionView)) {
            return [self collectionViewCellWith: listView forIndexPath: indePath];
        } else {
            return nil;
        }
    }
}

#pragma mark =================== table ===============
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
    return [self getListDataCount: tableView forSection: section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self getCellWith: tableView forIndexPath: indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self configRowDetail: tableView cell: cell forIndexPath: indexPath];
}

#pragma mark =================== collection ===============
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self getListDataCount: collectionView forSection: section];
}

- (UICollectionViewCell *)collectionViewCellWith:(UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath {
    DSHCellNibInfo *cellInfo = [self getCellInfoWith: listView forIndexPath: indePath];
    return [listView dequeueReusableCellWithReuseIdentifier: cellInfo.cellId forIndexPath: indePath];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self getCellWith: collectionView forIndexPath: indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self configRowDetail: collectionView cell: cell forIndexPath: indexPath];
}

@end
