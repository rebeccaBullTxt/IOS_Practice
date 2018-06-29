//
//  ViewController.m
//  float类型保留一位小数
//
//  Created by 刘渊 on 2018/4/19.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    float a = 2.5f;
    float b = 1.2f;
    
    NSLog(@"%f",a/b);
    NSLog(@"%f",round(a/b*10)/10);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
