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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)getCellWith:(UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath {
    NSString *cellid = [self getCellId];
    return [listView dequeueReusableCellWithReuseIdentifier: cellid forIndexPath: indePath];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self getListDataCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self getCellWith: collectionView forIndexPath: indexPath];
    [self configRowDetail: collectionView cell: cell forIndexPath: indexPath];
    return cell;
}

@end
