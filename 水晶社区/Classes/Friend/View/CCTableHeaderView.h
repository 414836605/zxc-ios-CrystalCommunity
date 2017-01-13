//
//  CCTableHeaderView.h
//  水晶社区
//
//  Created by mac on 16-8-24.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCGroupModel;

typedef void(^CCTableHeaderViewBlock)(id);

//代理
//@class CCTableHeaderView;
//@protocol CCTableHeaderViewDelegate <NSObject>
//@optional
//- (void)headerViewDidClickedNameView:(CCTableHeaderView *)headerView;
//@end


@interface CCTableHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@property (nonatomic, copy)CCTableHeaderViewBlock block;

//代理
//@property (nonatomic, assign)id<CCTableHeaderViewBlock> delegate;

@property (nonatomic, strong) CCGroupModel *group;


@end
