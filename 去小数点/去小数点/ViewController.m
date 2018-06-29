//
//  ViewController.m
//  去小数点
//
//  Created by 刘渊 on 2018/1/26.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float temp = 0.5;
    NSLog(@"%d",(int)temp);
    
    
//    float temp = 0.556;
    //方法1:
//    temp = temp - 0.005;
    
//    NSLog(@"%.2f",temp);
//    temp = (float)((int)(0.556 * 100))/100;
    
    //2.
    temp = (float)((int)(0.556 * 100)%100)/100;
//    NSLog(@"%.2f",temp);
    
    
    float temp1 = 0.886;
//    NSLog(@"%d",(int)(temp1 * 100));
    
//    NSLog(@"%zd",55/100 * 0.1);
    /*
     区别在于我们数学上的除法，参与运算的数字没有考虑到类型的
     程序中的除法有考虑
     比如
     1/2 这个是整数除法，结果不是0.5,  而是0，即取了整数部分
     1.0/2 这个才是0.5
     如果想得到一个浮点数的结果，就要考虑让两个操作数至少有一个是浮点数，强行乘一个1.0也是一个i办法
     */
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
