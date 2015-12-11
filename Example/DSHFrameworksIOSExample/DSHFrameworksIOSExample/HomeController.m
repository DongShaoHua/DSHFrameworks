//
//  HomeController.m
//  DSHFrameworksIOSExample
//
//  Created by dongshaohua on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "HomeController.h"
#import "DSHMainCell.h"
#import "UITextField+DSHTextFieldCategory.h"
#import "DSHViewManager.h"

@interface HomeController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    [DSHMainCell registerCellClassForTable: [self getListView]];
    [self.data addObjectsFromArray: @[@"1", @"2", @"3"]];
    NSString *layoutFile = [[NSBundle mainBundle] pathForResource: @"views.xml" ofType: nil];
    DSHViewManager *manager = [DSHViewManager new];
    
    [manager viewWithFile: layoutFile parentView: self.view];
    
    
    [_textfield registerTextValid: ^(UITextField *textfield) {
        if (textfield.text.length > 6) {
            [textfield deleteBackward];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo infoWithCellId: [DSHMainCell getCellId]];
}

@end
