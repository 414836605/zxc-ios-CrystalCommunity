//
//  ILBaseTableViewController.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CCBaseTableViewController.h"

#import "CCSettingMyInfoCell.h"

#import "CCSettingCell.h"

#import "CCSettingItem.h"

#import "CCSettingArrowItem.h"
#import "CCSettingSwitchItem.h"

#import "CCSettingGroup.h"

@interface CCBaseTableViewController ()

@end

@implementation CCBaseTableViewController

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


// 初始化方法
- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}



#pragma mark - TableView data source
//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count;
}

//每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CCSettingGroup *group = self.dataList[section];
    return group.items.count;
}

//创建每行的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        CCSettingMyInfoCell *cell = [[CCSettingMyInfoCell alloc] init];
        return cell;
    }
    
    // 创建cell
    CCSettingCell *cell = [[CCSettingCell class] cellWithTableView:tableView];
    
    // 取出模型
    CCSettingGroup *group = self.dataList[indexPath.section];
    CCSettingItem *item = group.items[indexPath.row];
    
    
    // 传递模型
    cell.item = item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }else{
        return 44;
    }
}

//header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CCSettingGroup *group = self.dataList[section];
    return group.header;
}

//footer
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CCSettingGroup *group = self.dataList[section];
    return group.footer;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出模型
    CCSettingGroup *group = self.dataList[indexPath.section];
    CCSettingItem *item = group.items[indexPath.row];
    
    // 执行操作
    if (item.option) {
        item.option();
        return;
    }
    
    if ([item isKindOfClass:[CCSettingArrowItem class]]) { // 需要跳转控制器
        CCSettingArrowItem *arrowItem = (CCSettingArrowItem *)item;
        
        
        // 创建跳转的控制器
        if (arrowItem.destVcClass) {
            
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        
    }
    
}


@end
