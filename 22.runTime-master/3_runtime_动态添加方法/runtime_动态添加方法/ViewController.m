//
//  ViewController.m
//  runtime_动态添加方法
//
//  Created by 刘渊 on 2017/9/7.
//  Copyright © 2017年 LiuYuan. All rights reserved.
/*
 使用场景:
 一个类方法非常多,加载类到内存的时候回比较耗费资源,需要给每个方法生成映射表,使用动态给某个类添加方法
 PerformSelector动态添加方法的时候使用
 
 */

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [[Person alloc]init];
    [p performSelector:@selector(eat)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
