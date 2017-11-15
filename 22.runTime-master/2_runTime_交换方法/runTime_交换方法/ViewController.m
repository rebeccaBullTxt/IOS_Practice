//
//  ViewController.m
//  runTime_交换方法
//
//  Created by 刘渊 on 2017/9/7.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    不确定是否调用成功
//    [UIImage imageNamed:@"123"];
    // imageNamed:
    // 实现方法:底层调用xmg_imageNamed
    
    // 本质:交换两个方法的实现imageNamed和xmg_imageNamed方法
    // 调用imageNamed其实就是调用xmg_imageNamed
    //不能使用分类继承,分类不能继承super,会将系统的功能覆盖掉

    
    
    [UIImage imageNamed:@"123"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
