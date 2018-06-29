//
//  ViewController.m
//  dashLineViewDemo
//
//  Created by 刘渊 on 2018/5/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#import "DashLineViewUtil.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DashLineViewUtil *dashV = [[DashLineViewUtil alloc]initWithFrame:CGRectMake(15, [UIScreen mainScreen].bounds.size.height/2, [UIScreen mainScreen].bounds.size.width - 30, 1)];
    [self.view addSubview:dashV];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
