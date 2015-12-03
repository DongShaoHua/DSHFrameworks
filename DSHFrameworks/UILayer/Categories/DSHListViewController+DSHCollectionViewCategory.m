//
//  DSHListViewController+DSHCollectionViewCategory.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController+DSHCollectionViewCategory.h"
#import "NSObject+DSHObjectCategory.h"

@interface DSHListViewController (Private)

- (UICollectionViewCell *)collectionViewCellWith:(UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath;

@end


@implementation DSHListViewController (DSHCollectionViewCategory)

+ (void)load {
    [self exchangeMethod: @selector(getCellWith:forIndexPath:) withNewMethod: @selector(collectionViewCellWith:forIndexPath:)];
}

- (UICollectionView *)collectionView {
    return [self getListView];
}

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
