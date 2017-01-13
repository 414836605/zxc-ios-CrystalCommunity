//
//  HMViewController.m
//  09-图片轮播器
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CCMainViewController.h"
#import "CCGameViewController.h"
#import "CCSettingViewController.h"
#import "CCJingViewController.h"

#import "AppDelegate.h"
#import "CCScrollView.h"
#import "CCPageControl.h"
#import "CCGridView.h"

@interface CCMainViewController () < UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *gridArray;

@property (nonatomic, strong) UIView *carouselView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIView *gridView;


@end

@implementation CCMainViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad
{
    //禁止手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.gridArray =
    @[@[@"friend",@"我的好友"],
      @[@"collection",@"我的搜藏"],
      @[@"jing",@"召唤小晶"],
      @[@"school",@"水晶学园"],
      @[@"house",@"水晶家园"],
      @[@"square",@"水晶广场"],
      @[@"game",@"游戏"],
      @[@"bbs",@"论坛"],
      @[@"setting",@"设置"]];
    // 设置View
    [self setupView];
    

    // 启动时钟
    [self startTimer];
    
    
}

-(void)setupView{
    CGFloat mainWidth = self.view.frame.size.width;
    CGFloat mainHeight = self.view.frame.size.height;

    
    //carouselView
    self.carouselView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight * 0.3)];
    self.carouselView.backgroundColor = [UIColor greenColor];
    self.scrollView = [[CCScrollView alloc] initWithView:self.carouselView];
    // 设置代理
    self.scrollView.delegate = self;
    
    self.pageControl = [[CCPageControl alloc] initWithView:self.carouselView];
    // 添加监听方法
    [self.pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    //分页初始页数为0
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.carouselView];
    
    
    //gridView
    CGFloat carouselViewH = self.carouselView.bounds.size.height;
    int columns = 3;
    int rows = 3;
    
    
    CGFloat gridViewW = mainWidth / (columns + 1);
    CGFloat gridViewH = (mainHeight - carouselViewH) / (rows + 1);
    
    
    CGFloat paddingX = gridViewW / (columns + 1);
    CGFloat paddingY = gridViewH / (rows + 1);
    
    // 2.遍历所有的数据
    for (int i = 0; i < self.gridArray.count; i++) {
        
        NSString *name = self.gridArray[i][1];
        NSString *iamgeName = self.gridArray[i][0];
        
        CCGridView *gridView = [[CCGridView alloc] init];
        int row = i / columns;
        int col = i % columns;
        
        CGFloat gridViewX = paddingX + col * (paddingX + gridViewW);
        CGFloat gridViewY = carouselViewH + paddingY + row * (paddingY + gridViewH);
        
        gridView.frame = CGRectMake(gridViewX, gridViewY, gridViewW, gridViewH);
        UIButton *button = [gridView setGridWithImageName:iamgeName AndName:name];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:gridView];
        
    }
    
}
#pragma mark 按钮点击
//按钮点击事件
-(void)buttonClick:(UIButton *)button{
    CCLog(@"%ld", (long)button.tag);
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    switch (button.tag) {
        case 0:
            [self presentVCWithStoryboardName:@"Friend"];
            break;
        case 1:
            [self pushVCWithStoryboardName:@"Collection"];
            break;
        case 2:
            [self pushVCWithClass:[CCJingViewController class]];
            break;
        case 3:
            [self pushVCWithStoryboardName:@"School"];
            break;
        case 4:
            [self pushVCWithStoryboardName:@"House"];
            break;
        case 5:
            [self pushVCWithStoryboardName:@"Square"];
            break;
        case 6:
            [self pushVCWithClass:[CCGameViewController class]];
            break;
        case 7:
            [self pushVCWithStoryboardName:@"BBS"];
            break;
        case 8:
            [self pushVCWithClass:[CCSettingViewController class]];
            break;
            
        default:
            break;
    }
}
//当按钮点击跳转页面Storyboard（present）
-(void)presentVCWithStoryboardName:(NSString *)storyboardName{
    CCLog(@"%@", storyboardName);
    UIViewController *viewController = [UIStoryboard storyboardWithName:storyboardName bundle:nil].instantiateInitialViewController;

    [self presentViewController:viewController animated:YES completion:nil];
    
    CCLog(@"main导航控制器：%@,push控制器：%@",self.navigationController, [UIStoryboard storyboardWithName:storyboardName bundle:nil].instantiateInitialViewController);
}
//当按钮点击跳转页面Storyboard（push）
-(void)pushVCWithStoryboardName:(NSString *)storyboardName{
    CCLog(@"%@", storyboardName);
    UIViewController *viewController = [UIStoryboard storyboardWithName:storyboardName bundle:nil].instantiateInitialViewController;
    
    [self.navigationController pushViewController:viewController animated:YES];

    
    CCLog(@"main导航控制器：%@,push控制器：%@",self.navigationController, [UIStoryboard storyboardWithName:storyboardName bundle:nil].instantiateInitialViewController);
}
//当按钮点击跳转页面Class
-(void)pushVCWithClass:(Class)class{
    if (class) {
        [self.navigationController pushViewController:[[class alloc] init] animated:YES];;
    }
    
}
#pragma mark 分页控件监听
// 分页控件的监听方法
- (void)pageChanged:(UIPageControl *)page
{
    
    // 根据页数，调整滚动视图中的图片位置 contentOffset
    CGFloat x = page.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}
#pragma mark 计时器
- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    // 添加到运行循环
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)updateTimer
{
    // 页号发生变化
    // (当前的页数 + 1) % 总页数
    int page = (self.pageControl.currentPage + 1) % 5;
    self.pageControl.currentPage = page;
    
    // 调用监听方法，让滚动视图滚动
    [self pageChanged:self.pageControl];
}



#pragma mark - ScrollView的代理方法
// 滚动视图停下来，修改页面控件的小点（页数）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 停下来的当前页数
    
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.pageControl.currentPage = page;
}
/**
 修改时钟所在的运行循环的模式后，抓不住图片
 解决方法：抓住图片时，停止时钟，松手后，开启时钟
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止时钟，停止之后就不能再使用，如果要启用时钟，需要重新实例化
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
