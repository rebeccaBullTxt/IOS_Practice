//
//  ViewController.m
//  4_runTime分类添加属性
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
/*
 给 NSObject添加属性: 使用分类
 
 
 */

#import "ViewController.h"
#import "NSObject+Objc.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSObject *obj = [[NSObject alloc]init];
    obj.name = @"128";
    NSLog(@"%@",obj.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
