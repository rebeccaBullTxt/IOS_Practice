//
//  ViewController.m
//  oc操作数据库
//
//  Created by 刘渊 on 2017/9/5.
//  Copyright © 2017年 LiuYuan. All rights reserved.
/*
 
 步骤:
 0.封装进工具类,并设计成单例
 1.创建数据库文件,打开数据库(启动程序,打开数据库)
 2.创建表(可以有多张表)
 3.添加数据/删除/更改(对模型对象操作)
 4.查询数据
 
 
 */

#import "ViewController.h"
#import "Student.h"
#import "SQLiteManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 这里沙盒路径
    NSLog(@"%@",NSHomeDirectory());
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    Student *stu = [[Student alloc]initWithName:@"why" age:18];
//    [stu insertStudent];
    
//    for (int i = 0; i < 20; i++) {
//        
//        NSString *name = [NSString stringWithFormat:@"zs%d",arc4random_uniform(10)];
//        NSInteger age = arc4random_uniform(10) + 15;
//        
//        Student *stu = [[Student alloc]initWithName:name age:age];
//        
//        [stu insertStudent];
//    }

    
    //更新数据和删除
    [self upDateData];
}

//
- (void)upDateData{
    
    //1.封装更新数据SQL语句
    NSString *updataSQL = @"UPDATE t_student SET name = 'zs10' WHERE age > 22;";
    
    //2.执行更新语句
    BOOL flag = [[SQLiteManager shareIntance] execSQL:updataSQL];
    
    if (flag) {
        NSLog(@"更新成功");
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
