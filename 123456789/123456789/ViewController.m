//
//  ViewController.m
//  123456789
//
//  Created by 刘渊 on 2018/6/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int t = 1529646620;
    int m = t % 100;
    
    int time = t - m;
    NSLog(@"%d",time);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
