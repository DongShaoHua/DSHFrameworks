//
//  DSHMainViewController.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/11/27.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHMainViewController.h"
#import "DSHMainCell.h"
#import "UIButton+DSHButtonCategory.h"
#import "UIView+DSHViewCategory.h"

#import "DSHButtonCategoryExampleController.h"

@interface DSHMainViewController ()

@end

@implementation DSHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"案列演示";
    
    [self.data addObjectsFromArray: @[ @"DSHButtonCategory 扩展演示"]];
    
    [DSHMainCell registerCellClassForTable: self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo infoWithCellId: [DSHMainCell getCellId] andHasNib: YES allocCellBlock: nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            DSHButtonCategoryExampleController *controller = [DSHButtonCategoryExampleController new];
            controller.title = self.data[indexPath.row];
            [self showViewController: controller];
            break;
        }
        default:
            break;
    }
}

@end
