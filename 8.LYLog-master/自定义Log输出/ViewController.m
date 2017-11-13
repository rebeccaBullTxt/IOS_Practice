//
//  ViewController.m
//  自定义Log输出
//
//  Created by 刘渊 on 2017/9/23.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DLog(@"刘渊");
    
    
    //给工具类添加
    [self setup:@"纪喆"];
}

- (void)setup:(NSString *)sender{
    
    NSLog(@"---%@:%@",[NSString stringWithUTF8String:object_getClassName(self)],sender);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
