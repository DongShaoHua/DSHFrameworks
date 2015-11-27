//
//  DSHMainViewController.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/27.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHMainViewController.h"
#import "DSHMainCell.h"

@interface DSHMainViewController ()

@end

@implementation DSHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [DSHMainCell registerCellNibForTable: [self getListView]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)getListDataCount {
    return 10;
}

- (NSString *)getCellIdWith:(UIView *)view {
    return [DSHMainCell getCellId];
}

@end
