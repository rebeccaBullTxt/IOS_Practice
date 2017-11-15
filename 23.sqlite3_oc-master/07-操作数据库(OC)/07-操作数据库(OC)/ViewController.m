//
//  ViewController.m
//  07-操作数据库(OC)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

/*
 0.封装工具类,并且设计成单例
 1.创建一个数据库文件,打开数据库
 2.创建一个表
 3.添加数据/删除数据/更新数据
 4.查询数据
 */

#import "ViewController.h"
#import "SQLiteManager.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    /*
    for (int i = 0; i < 20; i++) {
        NSString *name = [NSString stringWithFormat:@"zs%d", arc4random_uniform(10)];
        NSInteger age = arc4random_uniform(10) + 15;
        Student *stu = [[Student alloc] initWithName:name age:age];
        [stu insertStudent];
    }
     */
    // [self updateData];
    
    NSArray *stus = [Student loadData];
    NSLog(@"%@", stus);
}

- (void)updateData
{
    // 1.封装更新数据的SQL语句
    NSString *updateSQL = @"UPDATE t_student SET name = 'zs10' WHERE age > 22;";
    
    // 2.执行更新语句
    BOOL flag = [[SQLiteManager shareIntance] execSQL:updateSQL];
    if (flag) {
        NSLog(@"更新成功");
    }
}

@end
