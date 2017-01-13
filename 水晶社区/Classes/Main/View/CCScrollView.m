//
//  CCCarouselView.m
//  水晶社区
//
//  Created by mac on 16-8-10.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCScrollView.h"
@interface CCScrollView()

@end
@implementation CCScrollView
- (UIScrollView *)initWithView:(UIView *)view{
    CGFloat mainWidth = view.bounds.size.width;
    CGFloat mainHeight = view.bounds.size.height;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight)];
    // 取消弹簧效果
    scrollView.bounces = NO;
    
    // 取消水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    // 要分页
    scrollView.pagingEnabled = YES;
    
    // contentSize
    scrollView.contentSize = CGSizeMake(5 * scrollView.bounds.size.width, 0);
    
    // 设置图片
    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"carousel%01d.jpg", i + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:scrollView.bounds];
        imageView.image = image;
        
        [scrollView addSubview:imageView];
    }
    
    // 计算imageView的位置
    [scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        
        // 调整x => origin => frame
        CGRect frame = imageView.frame;
        frame.origin.x = idx * frame.size.width;
        
        imageView.frame = frame;
    }];
    
    [view addSubview:scrollView];
    
    return scrollView;
}

@end
