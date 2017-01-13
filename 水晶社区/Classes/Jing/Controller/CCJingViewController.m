//
//  CCJingViewController.m
//  水晶社区
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "CCJingViewController.h"

@interface CCJingViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *jingImageView;
@property (weak, nonatomic) IBOutlet UIImageView *boxImageView;



@end

@implementation CCJingViewController




- (void)viewDidLoad {
    [super viewDidLoad];

    self.bgImageView.image = [UIImage imageNamed:@"jing_map.jpg"];
//    [self.bgImageView sizeToFit];
    
    self.jingImageView.image = [UIImage imageNamed:@"jing_stand"];
    
    // pan
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveMap:)];
    
    [self.bgImageView addGestureRecognizer:panGestureRecognizer];
    
    // tap
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moveJing:)];
    
    
    [self.bgImageView addGestureRecognizer:tapGestureRecognizer];
}

-(void)moveMap:(UIPanGestureRecognizer *)panGestureRecognizer{
    CCLog(@"moveMap");
    // 获取手指移动的位置
    CGPoint trans = [panGestureRecognizer translationInView:self.bgImageView];
    
    self.bgImageView.transform = CGAffineTransformTranslate(self.bgImageView.transform, trans.x, trans.y);
    
    // 复位
    [panGestureRecognizer setTranslation:CGPointZero inView:self.bgImageView];
    NSLog(@"%@",NSStringFromCGPoint(trans));
}

-(void)moveJing:(UITapGestureRecognizer *)tapGestureRecognizer{
    CCLog(@"moveJing");
    
}

@end
