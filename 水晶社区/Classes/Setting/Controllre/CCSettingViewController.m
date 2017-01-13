//
//  CCSettingViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-9.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CCSettingViewController.h"

#import "CCSettingCell.h"

#import "CCSettingItem.h"

#import "CCSettingArrowItem.h"
#import "CCSettingSwitchItem.h"

#import "CCSettingGroup.h"


#import "MBProgressHUD+HM.h"



@interface CCSettingViewController ()


@end

@implementation CCSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 0组
    [self addGroup0];
    
    // 1组
    [self addGroup1];
    
    // 2组
    [self addGroup2];
}

- (void)addGroup0
{
    // 0组
    
    CCSettingItem *personalData = [CCSettingArrowItem itemWithIcon:@"" title:@"个人资料" destVcClass:nil];
    CCSettingItem *accountManagement = [CCSettingArrowItem itemWithIcon:@"" title:@"账号管理" destVcClass:nil];
    CCSettingItem *accountSecurity = [CCSettingArrowItem itemWithIcon:@"" title:@"账号安全" destVcClass:nil];
    
    CCSettingGroup *group0 = [[CCSettingGroup alloc] init];
    group0.items = @[personalData,accountManagement,accountSecurity];
    
    [self.dataList addObject:group0];
}

-(void) addGroup1{
    // 1组
    CCSettingItem *night = [CCSettingSwitchItem itemWithIcon:@"" title:@"夜间模式"];
    CCSettingItem *browse = [CCSettingArrowItem itemWithIcon:@"" title:@"浏览设置" destVcClass:nil];
    CCSettingItem *message = [CCSettingArrowItem itemWithIcon:@"" title:@"消息提醒" destVcClass:nil];
    CCSettingItem *privacy = [CCSettingArrowItem itemWithIcon:@"" title:@"隐私设置" destVcClass:nil];
    
    CCSettingGroup *group2 = [[CCSettingGroup alloc] init];
    group2.items = @[night,browse,message,privacy];
    
    
    [self.dataList addObject:group2];
}

-(void) addGroup2{
    // 2组
    CCSettingItem *newVersion = [CCSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    // 保存了一段检查更新的功能
    newVersion.option = ^{
        // 1.显示蒙板
        [MBProgressHUD showMessage:@"正在检查ing......."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 2.隐藏蒙板
            [MBProgressHUD hideHUD];
            
            // 3.提示用户
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
            // 显示UIAlertView
            [alert show];
            
        });
    };
    CCSettingItem *version = [CCSettingArrowItem itemWithIcon:@"" title:@"版本信息" destVcClass:nil];
    CCSettingItem *opinion = [CCSettingArrowItem itemWithIcon:@"" title:@"意见反馈" destVcClass:nil];
    
    CCSettingGroup *group3 = [[CCSettingGroup alloc] init];
    group3.items = @[newVersion,version,opinion];
    
    
    [self.dataList addObject:group3];
}

@end
