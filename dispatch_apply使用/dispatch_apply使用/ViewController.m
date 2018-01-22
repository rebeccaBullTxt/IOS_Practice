//
//  ViewController.m
//  dispatch_apply使用
//
//  Created by 刘渊 on 2018/1/11.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *array = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_apply([array count], queue, ^(size_t index) {
        
//        NSLog(@"%zu",index);
//        sleep(arc4random()%4+2);
        NSLog(@"%@----%@",[array objectAtIndex:index],[NSThread currentThread]);
    });
    
    NSLog(@"done！");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
