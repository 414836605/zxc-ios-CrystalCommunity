//
//  CCPageControl.m
//  水晶社区
//
//  Created by mac on 16-8-22.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCPageControl.h"

@implementation CCPageControl
-(UIPageControl *)initWithView:(UIView *)view{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    // 总页数
    pageControl.numberOfPages = 5;
    // 控件尺寸
    CGSize size = [pageControl sizeForNumberOfPages:5];
    
    pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    pageControl.center = CGPointMake(view.center.x, view.bounds.size.height - 20);
    
    // 设置颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    
    [view addSubview:pageControl];
    
    return pageControl;
}


@end
