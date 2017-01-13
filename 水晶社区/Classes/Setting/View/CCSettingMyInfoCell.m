//
//  CCSettingMyInfoCell.m
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCSettingMyInfoCell.h"

@implementation CCSettingMyInfoCell

- (instancetype)init{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"CCSettingMyInfoCell" owner:nil options:nil] lastObject];
        
    }
    return self;
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
