//
//  ViewController.m
//  Test_12345
//
//  Created by 刘渊 on 2018/3/5.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *dic0 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"male", @"sex",
                          @"20", @"age",
                          @"Tom", @"name",
                          @"run",@"hobby", nil ];
    
    NSDictionary *dic1 = @{@(123):@"我是第一个数据",@(456):@"我是第二个数据",@(789):@"我是第三个数据"};
    
    NSDictionary *dic2 = @{@"name":@"jolieyang",@"age":@(23),@"gender":@"woman"};
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"value2",@"key2",@"value3",@"key3", nil];
    
    NSMutableArray *mArray = [NSMutableArray arrayWithObjects:dic0,dic1,dic2,dic3, nil];
    
    for (NSDictionary *tempDic in mArray) {
        NSLog(@"%@",tempDic);
        NSLog(@"===========================");
        NSArray *tempArr = tempDic.allValues.firstObject;
        
        NSLog(@"我是一匹来自北方的狼%@",tempArr);
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
