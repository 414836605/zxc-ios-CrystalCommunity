//
//  CCGameCellView.h
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCGameModel;

@interface CCGameCellView : UITableViewCell

@property (nonatomic, strong) CCGameModel *game;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
