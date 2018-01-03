//
//  ViewController.m
//  将一个数组中的数据插入到另一个数组中
//
//  Created by 刘渊 on 2017/12/26.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSLog(@"%@",tempArr);

    NSArray *page1 = @[@4,@5,@6];
    [tempArr insertObjects:page1 atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, page1.count)]];
    NSLog(@"%@",tempArr);

    NSArray *page2 = @[@7,@8,@9];
    [tempArr insertObjects:page2 atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(tempArr.count, page1.count)]];
    NSLog(@"%@",tempArr);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
