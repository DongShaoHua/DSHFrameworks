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

@interface DSHMainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation DSHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.data = [NSMutableArray arrayWithArray: @[ @"What's your name?", @"My name is XXXX.", @"How old are you?" ]];
    
    [DSHMainCell registerCellClassForTable: self.tableView];
    
    //[DSHMainCell registerCellNibForTable: self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_button setButtonContentLayout: DSHButtonContentLayoutStyleCenterLeftTitleRightImage];
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo infoWithCellId: [DSHMainCell getCellId] andHasNib: YES allocCellBlock: nil];
}

@end
