//
//  HomeController.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "HomeController.h"
#import "DSHListViewController+DSHTableViewCategory.h"
#import "DSHMainCell.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    [DSHMainCell registerCellClassForTable: self.tableView];
    [self.data addObjectsFromArray: @[@"1", @"2", @"3"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo infoWithCellId: [DSHMainCell getCellId]];
}

@end
