//
//  CCFriendViewController.m
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCFriendViewController.h"

#import "CCMainViewController.h"

#import "CCTableHeaderView.h"

#import "CCGroupModel.h"
#import "CCFriendsModel.h"

@interface CCFriendViewController ()


@property (nonatomic, strong) NSArray *groups;



@end

@implementation CCFriendViewController

-(NSArray *)groups{
    if (_groups == nil) {
        _groups = [CCGroupModel groups];
    }
    return _groups;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 50;
    self.tableView.sectionHeaderHeight = 44;
    
    //接收消息
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiClcik) name:@"friend" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - tableView数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CCGroupModel *group = self.groups[section];
    
    
    return (group.isOpened ? group.friends.count : 0);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friend" forIndexPath:indexPath];
    //1 取出当前section  group
    CCGroupModel *group = self.groups[indexPath.section];
    
    //2 取出当前section group 中的 row 行
    CCFriendsModel *friend = group.friends[indexPath.row];
    
    UILabel *label = [cell.contentView viewWithTag:1];
    label.text = friend.name;
    
    UIImageView *imageView = [cell.contentView viewWithTag:2];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"f_head%d", arc4random() % 4 + 1]];
  
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CCTableHeaderView *tableHeaderView = [CCTableHeaderView headerViewWithTableView:tableView];
    
    
    //让控制器充当headerView 的代理
    //header.delegate = self;
    
    // sender  传过来的参数  ^ 是不block 象征 {};做相应操作
    tableHeaderView.block = ^(id sender){
        CCLog(@"tableHeaderView.block");
        [tableView reloadData];
    
    };
    
    tableHeaderView.group = self.groups[section];
    
    return tableHeaderView;
}

#pragma mark 返回主页面按钮点击
- (IBAction)returnMainClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 代码块（添加headerview时设置代码块）
 */
/**
 代理要做的（添加headerview时设置代理）
- (void)headerViewDidClickedNameView:(CCTableHeaderView *)tableHeaderView
{
    [self.tableView reloadData];
}
*/

/**
 消息要做的（viewdidload时接收消息）
- (void)notiClcik
{
    [self.tableView reloadData];
}
// 这个方法是在控制器销毁的时候调用
- (void)dealloc
{
    //非ARC  必须调取这个方法
    //    [super dealloc];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
 */
@end
