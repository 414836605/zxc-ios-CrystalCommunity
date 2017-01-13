//
//  CCLoginViewController.m
//  水晶社区
//
//  Created by mac on 16/8/28.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "CCLoginViewController.h"
#import "AppDelegate.h"
#import "CCNavigationController.h"
#import "CCMainViewController.h"
@interface CCLoginViewController ()

@end

@implementation CCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginButtonClick:(UIButton *)button{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    CCNavigationController *navigationController =[[CCNavigationController alloc] initWithRootViewController:[[CCMainViewController alloc] init]];
    
    
    appDelegate.window.rootViewController =navigationController;
}


@end
