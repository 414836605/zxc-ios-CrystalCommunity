//
//  CCAppView.m
//  水晶社区
//
//  Created by mac on 16-8-21.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCGridView.h"

@interface CCGridView()
@property (strong, nonatomic) UIImageView *iamgeView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIButton *button;
@end

@implementation CCGridView

- (UIButton *)setGridWithImageName:(NSString *)imageName AndName:(NSString *)name
{
    self.iamgeView.image = [UIImage imageNamed:imageName];
    self.nameLabel.text = name;
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *iamgeView = [[UIImageView alloc] init];
        [self addSubview:iamgeView];
        self.iamgeView = iamgeView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:12];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat gridViewW = self.frame.size.width;
    
    self.iamgeView.frame = CGRectMake(0, 0, gridViewW, gridViewW);
    
    CGFloat nameY = CGRectGetMaxY(self.iamgeView.frame);
    self.nameLabel.frame = CGRectMake(0, nameY, gridViewW, 30);
    
    self.nameLabel.font = [UIFont systemFontOfSize:20];
    
}


@end
