//
//  DSHCollectionViewCell.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHCollectionViewCell.h"

@implementation DSHCollectionViewCell

- (void)setCellDetail:(__kindof id)data forIndexPath:(NSIndexPath *)indexPath {
    
}

+ (NSString *)getCellId {
    return [[self class] description];
}

+ (void)registerCellClassForCollectionView:(UICollectionView *)collectionView {
    [collectionView registerClass: self.class forCellWithReuseIdentifier: [self getCellId]];
}

+ (void)registerCellNibForCollectionView:(UICollectionView *)collectionView {
    [self registerCellNibForCollectionView: collectionView nibName: [self getCellId]];
}

+ (void)registerCellNibForCollectionView:(UICollectionView *)collectionView nibName:(NSString *)nibName {
    UINib *nib = [UINib nibWithNibName: nibName bundle: [NSBundle mainBundle]];
    if (nib) {
        [collectionView registerNib: nib forCellWithReuseIdentifier: [self getCellId]];
    }
}

@end
