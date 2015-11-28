//
//  DSHViewController.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHViewController.h"
#import "DSHApplication.h"

NSString * const DSHViewControllerResetNotification = @"DSHViewControllerResetNotification";

@interface DSHViewController ()

- (void)tapForEndEdit:(UITapGestureRecognizer *)gesture;

@end

@implementation DSHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self registerRestNotification]) {
        [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(resetController:) name: DSHViewControllerResetNotification object: nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark ======= 重置Controller通知 =======
- (BOOL)registerRestNotification {
    return NO;
}

- (void)resetController:(NSNotification *)notification {
    
}

#pragma mark ==== 导航栏相关 ====
- (void)customizeLeftWithImage:(NSString *)image frame:(CGRect)frame {
    [self customizeNavigateItem: YES image: image frame: frame target: self selector: @selector(leftClick:)];
}

- (void)customizeLeftWithTitle:(NSString *)title frame:(CGRect)frame {
    [self customizeNavigateItem: YES title: title frame: frame target: self selector: @selector(leftClick:)];
}

- (void)customizeRightWithImage:(NSString *)image frame:(CGRect)frame {
    [self customizeNavigateItem: NO image: image frame: frame target: self selector: @selector(rightClick:)];
}

- (void)customizeRightWithTitle:(NSString *)title frame:(CGRect)frame {
    [self customizeNavigateItem: NO title: title frame: frame target: self selector: @selector(rightClick:)];
}

- (void)customizeNavigateItem:(BOOL)isleft image:(NSString *)image frame:(CGRect)frame target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    [button setImage: [UIImage imageNamed: image] forState: UIControlStateNormal];
    [self customizeNavigateItem: isleft customizeView: button target: target selector: selector];
}

- (void)customizeNavigateItem:(BOOL)isleft title:(NSString *)title frame:(CGRect)frame target:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize: 14];
    [button setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    [button setTitle: title forState: UIControlStateNormal];
    [self customizeNavigateItem: isleft customizeView: button target: target selector: selector];
}

- (void)customizeNavigateItem:(BOOL)isleft customizeView:(UIButton *)customizeView target:(id)target selector:(SEL)selector {
    UIBarButtonItem *barbutton = [[UIBarButtonItem alloc] initWithCustomView: customizeView];
    [customizeView addTarget: target action: selector forControlEvents: UIControlEventTouchUpInside];
    if (isleft) {
        self.navigationItem.leftBarButtonItem = barbutton;
    } else {
        self.navigationItem.rightBarButtonItem = barbutton;
    }
}

- (void)leftClick:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)rightClick:(id)sender {
    
}

#pragma mark ==== 界面跳转，以及登录状态判断等 ====
- (void)showViewController:(DSHViewController *)controller {
    if ([self willGoToOtherController: controller]) {
        if (8.0 <= [DSHApplication getIOSVersion]) {
            [self showViewController: controller sender: self];
        } else {
            [self.navigationController pushViewController: controller animated: YES];
        }
    }
}

- (void)showDetailViewController:(DSHViewController *)controller {
    if ([self willGoToOtherController: controller]) {
        if (8.0 <= [DSHApplication getIOSVersion]) {
            [self showDetailViewController: controller sender: self];
        } else {
            [self.navigationController pushViewController: controller animated: YES];
        }
    }
}

- (BOOL)willGoToOtherController:(DSHViewController *)controller {
    controller.hidesBottomBarWhenPushed = YES;
    return YES;
}

- (void)enableTapForEndEdit {
    [self.view addGestureRecognizer: [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(tapForEndEdit:)]];
}

- (void)tapForEndEdit:(UITapGestureRecognizer *)gesture {
    [self.view endEditing: YES];
}

@end
