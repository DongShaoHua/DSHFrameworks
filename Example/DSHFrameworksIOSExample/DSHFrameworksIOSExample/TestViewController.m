//
//  TestViewController.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/3.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "TestViewController.h"
#import "MyCollectionViewCell.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self getListView].backgroundColor = [UIColor clearColor];
    
    [MyCollectionViewCell registerCellNibForCollectionView: [self getListView]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)getListDataCount:(UIView *)view forSection:(NSInteger)section {
    return 100.0;
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo infoWithCellId: [MyCollectionViewCell getCellId] andHasNib: YES];
}

@end
