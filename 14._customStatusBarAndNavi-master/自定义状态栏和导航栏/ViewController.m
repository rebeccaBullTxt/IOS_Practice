//
//  ViewController.m
//  自定义状态栏和导航栏
//
//  Created by 刘渊 on 2017/6/23.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

- (void)setupUI{
    
    //设置导航栏背景色
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIView *statuBarView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, 20)];
    statuBarView.backgroundColor = [UIColor greenColor];
    
    [self.navigationController.navigationBar addSubview:statuBarView];
    
    //设置导航栏标题的字体和颜色
    NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:30]};
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    self.navigationItem.title = @"我的";
    
    
    //设置状态栏字体颜色 白色 方法一:
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    
    
    //设置导航栏背景图片 navigationBar透明效果
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"1"] forBarMetrics:UIBarMetricsDefault];
    
}


//状态栏字体颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}






//隐藏状态栏
- (BOOL)prefersStatusBarHidden{
    return NO;
}

/*
 //自定义标题视图
 UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
 titleLabel.backgroundColor = [UIColor grayColor];
 titleLabel.font = [UIFont boldSystemFontOfSize:20];
 titleLabel.textColor = [UIColor greenColor];
 titleLabel.textAlignment = NSTextAlignmentCenter;
 titleLabel.text = @"新闻";
 self.navigationItem.titleView = titleLabel;
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
