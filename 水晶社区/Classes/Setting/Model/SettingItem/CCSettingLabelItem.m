//
//  CCSettingLabelItem.m
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CCSettingLabelItem.h"

#import "CCSaveTool.h"

@implementation CCSettingLabelItem

- (void)setText:(NSString *)text
{
    _text = text;
    
    [CCSaveTool setObject:text forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _text = [CCSaveTool objectForKey:self.title];
}

@end
