//
//  ViewController.m
//  5_字典转模型,kvc实现
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"
#import "Status.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *dictArr = dict[@"statuses"];

//    NSLog(@"dictArr 000 %@",dictArr);
    
    //之前方法有返回值,返回字符串 可以查看类型
//    NSString *propertyName = [NSObject createPropertyCodeWithDict:dictArr[0]];
//    NSLog(@"%@",propertyName);
    
    [NSObject createPropertyCodeWithDict:dictArr[0]];
    
    NSMutableArray *statues = [NSMutableArray array];
    //字典转模型
    for (NSDictionary *dict in dictArr) {
        
        Status *status = [Status statusWithDict:dict];
        [statues addObject:status];
    }
    
    NSLog(@"%@",statues);
    
     
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
