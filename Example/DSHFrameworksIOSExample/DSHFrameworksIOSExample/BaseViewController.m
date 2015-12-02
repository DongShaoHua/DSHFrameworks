//
//  BaseViewController.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "BaseViewController.h"
#import "DSHDevelopmentHelper.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UITabBarController *)shareRootController {
    
    void (^addTabItemBlock)(NSMutableArray *, UIViewController *, NSString *) = ^(NSMutableArray * controllers,UIViewController * controller, NSString *title) {
        UINavigationController *navigate = [[UINavigationController alloc] initWithRootViewController: controller];
        navigate.title = title;
        navigate.navigationBar.translucent = NO;
        [controllers addObject: navigate];
    };
    
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity: 5];
    
    addTabItemBlock(controllers, [BaseViewController new], @"首页");
    addTabItemBlock(controllers, [BaseViewController new], @"分类");
    addTabItemBlock(controllers, [BaseViewController new], @"发现");
    addTabItemBlock(controllers, [BaseViewController new], @"购物车");
    addTabItemBlock(controllers, [BaseViewController new], @"我的");
    
    UITabBarController *rootController = [UITabBarController new];
    rootController.viewControllers = controllers;
    return rootController;
}

@end
