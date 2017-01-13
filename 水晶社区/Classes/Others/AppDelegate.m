//
//  AppDelegate.m
//  水晶社区
//
//  Created by mac on 16-8-10.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "AppDelegate.h"

#import "CCLoginViewController.h"

#import "CCSettingViewController.h"
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //沙盒路径
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    CCLog(@"%@", path);
    
    //1.window 创建
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //2.window 要显示在屏幕上，必须设置它为窗口，并可见
    [self.window makeKeyAndVisible];
    
    
    //3.window 设置根控制器
    self.window.rootViewController = [[CCLoginViewController alloc] init];

    return YES;
}

@end
