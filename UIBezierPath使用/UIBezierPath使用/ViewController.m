//
//  ViewController.m
//  UIBezierPath使用
//
//  Created by 刘渊 on 2018/1/23.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DrawView *drawV = [[DrawView alloc]init];
    drawV.frame = CGRectMake(0, 0, 100, 100);
    drawV.backgroundColor = [UIColor redColor];
    [self.view addSubview:drawV];
    

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
