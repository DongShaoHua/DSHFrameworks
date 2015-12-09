//
//  DSHCollectionViewCell.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSHCollectionViewCell : UICollectionViewCell

/**
 设置Cell的详细信息
 */
- (void)setCellDetail:(__kindof id)data forIndexPath:(NSIndexPath *)indexPath;

/**
 获取该Cell的Id，默认情况下以类名称做id
 */
+ (NSString *)getCellId;

+ (void)registerCellClassForCollectionView:(UICollectionView *)collectionView;

+ (void)registerCellNibForCollectionView:(UICollectionView *)collectionView;

+ (void)registerCellNibForCollectionView:(UICollectionView *)collectionView nibName:(NSString *)nibName;

@end
