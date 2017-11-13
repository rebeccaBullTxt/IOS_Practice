//
//  ViewController.m
//  渐变色
//
//  Created by 刘渊 on 2017/11/6.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    //渐变的颜色
//    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:235.0/255.0 green:0 blue:96 alpha:1.0].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor colorWithRed:255.0/255.0 green:180.0/255.0 blue:213.0/255.0 alpha:1.0].CGColor];
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:180/255.0 blue:213/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:235/255.0 green:0/255.0 blue:96/255.0 alpha:1.0].CGColor];
    
    
    
    //渐变颜色分割点
//    gradientLayer.locations = @[@0.3, @0.5, @1.0];
    gradientLayer.locations = @[@0.3,@1.0];
    
    //startPoint&endPoint 颜色渐变的方向，范围在(0,0)与(1.0,1.0)之间，如(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    
    
    gradientLayer.frame = CGRectMake(50, 100, 100, 400);
    
    [self.view.layer addSublayer:gradientLayer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
