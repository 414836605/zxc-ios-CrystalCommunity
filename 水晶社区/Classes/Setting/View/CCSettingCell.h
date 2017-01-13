//
//  CCSettingCell.h
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCSettingItem;

@interface CCSettingCell : UITableViewCell

@property (nonatomic, strong) CCSettingItem *item;


+ (instancetype)cellWithTableView:(UITableView *)tableView;



@end
