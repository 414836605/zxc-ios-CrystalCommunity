//
//  CCTableHeaderView.m
//  水晶社区
//
//  Created by mac on 16-8-24.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCTableHeaderView.h"
#import "CCGroupModel.h"

@interface CCTableHeaderView()
@property (nonatomic, weak) UILabel *countView;
@property (nonatomic, weak) UIButton *nameView;
@end

@implementation CCTableHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView{
    static NSString *ID = @"header";
    CCTableHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[CCTableHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

-(void)setGroup:(CCGroupModel *)group{
    _group = group;
    
    [self.nameView setTitle:group.name forState:UIControlStateNormal];
    
    self.countView.text = [NSString stringWithFormat:@"%d/%d", (int)group.online, (int)group.friends.count];
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //nameview
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [nameView setBackgroundImage:[UIImage imageNamed:@"cell_bg"] forState:UIControlStateNormal];
        [nameView setBackgroundImage:[UIImage imageNamed:@"cell_bg_highlighted"] forState:UIControlStateHighlighted];
        [nameView setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //nameview监听点击
        [nameView addTarget:self action:@selector(nameViewClick) forControlEvents:UIControlEventTouchUpInside];
        
        nameView.imageView.contentMode = UIViewContentModeCenter;
        nameView.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        
        
        //countview
        UILabel *countView = [[UILabel alloc] init];
        countView.textAlignment = NSTextAlignmentRight;
        countView.textColor = [UIColor grayColor];
        [self.contentView addSubview:countView];
        self.countView = countView;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //nameView
    self.nameView.frame = self.bounds;
    
    
    //countView
    CGFloat countY = 0;
    CGFloat countH = self.frame.size.height;
    CGFloat countW = 150;
    CGFloat countX = self.frame.size.width - 10 - countW;
    self.countView.frame = CGRectMake(countX, countY, countW, countH);
}
//当前的view加载到父控件的时候调用
-(void)didMoveToSuperview{
    //每次当控件加载到父控件的时候都会调用这个方法，包括init 完一次就会调用一次
    if (self.group.opened) {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

#pragma mark -nameViewClick点击事件
- (void)nameViewClick
{
    self.group.opened = !self.group.isOpened;
    
    /**
     1.代码块
      自己.h声明代码块
      自己.m声设置代码块
      其他.m使用代码块
     */
    if (self.block) {
        self.block(self);
    }
    /**
     2.代理
     自己.h声明代理
     自己.m设置代理
     其他.m添加代理，设置代理，实现代理
     if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        [self.delegate headerViewDidClickedNameView:self];
     }
     */
    /**
     3.消息
     [[NSNotificationCenter defaultCenter] postNotificationName:@"friend" object:self userInfo:nil];
     */
}
@end
