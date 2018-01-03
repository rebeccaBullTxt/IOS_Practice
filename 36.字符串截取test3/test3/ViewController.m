//
//  ViewController.m
//  test3
//
//  Created by 刘渊 on 2017/12/8.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //15E4
    NSString *str1 = @"CLING LEAP";
    NSString *str2 = @"CLING LEAP";
    
    if (str2.length > str1.length) {
        return;
    }
    NSString *temp = [str1 substringWithRange:NSMakeRange(0, str2.length)];
    NSLog(@"temp = %@",temp);
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
