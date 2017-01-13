//
//  CCSettingItem.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CCSettingItem.h"

@implementation CCSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    CCSettingItem *item = [[self alloc] init];
    
    item.icon = icon;
    item.title = title;
    
    return item;
}

@end
