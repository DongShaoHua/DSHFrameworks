//
//  DSHListViewController+DSHCollectionViewCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController.h"

@interface DSHListViewController (DSHCollectionViewCategory)<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic, readonly) UICollectionView *collectionView;

@end
