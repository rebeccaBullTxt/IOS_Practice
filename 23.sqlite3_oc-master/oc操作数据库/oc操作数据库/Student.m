//
//  Student.m
//  oc操作数据库
//
//  Created by 刘渊 on 2017/9/5.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "Student.h"
#import "SQLiteManager.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

- (void)insertStudent{
    
    //1.封装插入的SQL语句
//    NSString *insertSQL = @"INSERT INTO t_student (name,age) VALUES ()";
    //格式话封装
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO t_student (name,age) VALUES ('%@',%ld)",self.name,self.age];
    
    //2.执行SQL
    if ([[SQLiteManager shareIntance]execSQL:insertSQL]) {
        NSLog(@"插入成功");
    }
    
}
@end
