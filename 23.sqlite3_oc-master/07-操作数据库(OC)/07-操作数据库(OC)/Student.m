//
//  Student.m
//  07-操作数据库(OC)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "Student.h"
#import "SQLiteManager.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age
{
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)insertStudent
{
    // 1.封装插入的SQL语句
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO t_student (name, age) VALUES ('%@', %ld)", self.name, self.age];
    
    // 2.执行SQL
    if ([[SQLiteManager shareIntance] execSQL:insertSQL]) {
        NSLog(@"数据插入成功");
    }
}

+ (NSArray *)loadData
{
    // 1.封装查询的语句
    NSString *querySQL = @"SELECT name, age FROM t_student;";
    
    // 2.执行查询语句
    NSArray *dictArray = [[SQLiteManager shareIntance] querySQL:querySQL];
    
    // 3.将字典数组转成模型对象数组
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        [tempArray addObject:[[Student alloc] initWithDict:dict]];
    }
    
    return tempArray;
}

@end
