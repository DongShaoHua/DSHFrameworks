//
//  DSHCollectionViewController.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHCollectionViewController.h"

@interface DSHCollectionViewController ()

@end

@implementation DSHCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _collectionView = [self getListView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self getListDataCount];
}

- (UICollectionViewCell *)getCellWith:(UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath {
    NSString *cellid = [self getCellIdWith: listView];
    return [listView dequeueReusableCellWithReuseIdentifier: cellid forIndexPath: indePath];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self getCellWith: collectionView forIndexPath: indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self configRowDetail: collectionView cell: cell forIndexPath: indexPath];
}

@end
