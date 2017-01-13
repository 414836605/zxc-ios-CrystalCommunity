//
//  CCNavigationController.m
//  水晶社区
//
//  Created by mac on 16-8-12.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCNavigationController.h"
#import "CCMainViewController.h"
@interface CCNavigationController ()

@end

@implementation CCNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    //禁止手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    //隐藏navigationbar
    self.navigationController.navigationBarHidden = YES;
}
//设置导航栏主题
+(void)setupNavTheme{
    //设置导航样式
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    //设置导航条背景
    //[navigationBar setBackgroundImage:[UIImage imageNamed:@"topbarbg_ios7"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏字体
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    
    [navigationBar setTitleTextAttributes:attributes];
    
    
    
    //设置状态栏样式
    //    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

//自定义

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];

    self.navigationBarHidden = NO;
    
}


@end
