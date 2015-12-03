//
//  BaseViewController.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/2.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "BaseViewController.h"
#import "DSHDevelopmentHelper.h"
#import "UIColor+DSHColorCategory.h"
#import "UIImage+DSHImageCategory.h"

#import "HomeController.h"
#import "TestViewController.h"

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
    
    void (^addTabItemBlock)(NSMutableArray *, UIViewController *, NSString *, NSString *, NSString *) = ^(NSMutableArray * controllers,UIViewController * controller, NSString *title, NSString *normal, NSString *selected) {
        controller.title = title;
        UINavigationController *navigate = [[UINavigationController alloc] initWithRootViewController: controller];
        navigate.title = title;
        navigate.navigationBar.translucent = NO;
        navigate.tabBarItem.imageInsets = UIEdgeInsetsMake(4.0f, 0, -4.0f, 0);
        navigate.tabBarItem.image = [UIImage imageNamed: normal];
        navigate.tabBarItem.title = @"";
        navigate.tabBarItem.selectedImage = [UIImage imageNamed: selected];
        [controllers addObject: navigate];
    };
    
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity: 5];
    
    addTabItemBlock(controllers, [HomeController new], @"首页", @"tabBar_home_normal.png", @"tabBar_home_press.png");
    addTabItemBlock(controllers, [TestViewController new], @"分类", @"tabBar_category_normal.png", @"tabBar_category_press.png");
    addTabItemBlock(controllers, [BaseViewController new], @"发现", @"tabBar_find_normal.png", @"tabBar_find_press.png");
    addTabItemBlock(controllers, [BaseViewController new], @"购物车", @"tabBar_cart_normal.png", @"tabBar_cart_press.png");
    addTabItemBlock(controllers, [BaseViewController new], @"我的", @"tabBar_myJD_normal.png", @"tabBar_myJD_press.png");
    
    UITabBarController *rootController = [UITabBarController new];
    rootController.tabBar.translucent = NO;
    rootController.tabBar.tintColor = [UIColor colorWithHex: 0xCACACA];
    rootController.tabBar.selectedImageTintColor = [UIColor colorWithHex: 0xED4141];
    [rootController.tabBar setBackgroundImage: [UIImage imageFromColor: [UIColor colorWithHex: 0x313132]]];
    rootController.viewControllers = controllers;
    return rootController;
}

@end
