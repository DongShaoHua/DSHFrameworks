//
//  DSHButtonCategoryExampleController.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHButtonCategoryExampleController.h"
#import "UIButton+DSHButtonCategory.h"

@interface DSHButtonCategoryExampleController ()

@property (weak, nonatomic) IBOutlet UIButton *topTitleBottomImageButton;
@property (weak, nonatomic) IBOutlet UIButton *topImageBottomTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *leftTitleRightImageButton;

@end

@implementation DSHButtonCategoryExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [_topTitleBottomImageButton setButtonContentLayout: DSHButtonContentLayoutStyleCenterTopTitleBottomImage];
    [_topImageBottomTitleButton setButtonContentLayout: DSHButtonContentLayoutStyleCenterTopImageBottomTitle];
    [_leftTitleRightImageButton setButtonContentLayout: DSHButtonContentLayoutStyleCenterLeftTitleRightImage];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
