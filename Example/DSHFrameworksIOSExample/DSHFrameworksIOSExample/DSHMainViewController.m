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
    self.data = [NSMutableArray arrayWithArray: @[ @"What's your name?", @"My name is XXXX.", @"How old are you?" ]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo infoWithCellId: [DSHMainCell getCellId] andHasNib: NO allocCellBlock:^UITableViewCell *(NSString *cellId) {
        return [[DSHMainCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellId];
    }];
}

@end
