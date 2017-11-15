//
//  SQLiteManager.m
//  oc操作数据库
//
//  Created by 刘渊 on 2017/9/5.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "SQLiteManager.h"
#import <sqlite3.h>

@interface SQLiteManager()

@property (nonatomic,assign) sqlite3 *db;

@end

@implementation SQLiteManager

static id _instance;

+ (instancetype)shareIntance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

- (BOOL)openDB{

    //0打开数据库 使用sqlite3 api  导入头文件/Linked(单独导入)
    //打开一个数据库文件,如果存在则直接打开,不存在就创建
    /*
     1.数据库文件存放路径+文件名字  放在沙盒里
     2.** 传入地址 通过内存地址 给数据库对象赋值 (NSError)
     */
    
    //沙盒路径
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //文件名字
    filePath = [filePath stringByAppendingPathComponent:@"demo.sqlite"];
//    NSString *fileP = [NSString stringWithFormat:@"%@-demo.sqlite",filePath];
    
    //数据库对象 拿到对象地址
//    sqlite3 *db = nil;
    
    
//    if (sqlite3_open(filePath.UTF8String, &db) != SQLITE_OK){
    if (sqlite3_open(filePath.UTF8String,&_db) != SQLITE_OK){
        NSLog(@"数据库打开失败");
        return NO;
    }
    
    ///1 创建表
    return [self createTable];
    
}

- (BOOL)createTable{
    
    //封装创建表的语句
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS 't_student' ('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'name' TEXT,'age' INTEGER);";
    
    //2.执行SQL语句
    return [self execSQL:createTableSQL];
    
}


- (BOOL)execSQL:(NSString *)sql{
    
    /*
     参数:
     1.数据库对象
     2.要执行的语句
     5.error错误信息
     
     */
    
    return sqlite3_exec(self.db, sql.UTF8String, nil, nil, nil) == SQLITE_OK;
}

- (NSArray *)querySQL:(NSString *)querysql{
    
    //定义游标对象
    sqlite3_stmt *stmt = nil;
    
    // 准备查询
    // 1> 参数一:数据库对象
    // 2> 参数二:查询语句
    // 3> 参数三:查询语句的长度:-1
    // 4> 参数四:句柄(游标对象)
    
    if (sqlite3_prepare_v2(self.db, querysql.UTF8String, -1, &stmt, nil) != SQLITE_OK) {
        NSLog(@"准备查询失败");
        return nil;
    }
    
    //准备成功,开始查询数据
    NSMutableArray*dictArray = [NSMutableArray array];
    while (sqlite3_step(stmt) == SQLITE_ROW) {
        //获取一共有多少列
        int count = sqlite3_column_count(stmt);
        
        //定义字典
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        for (int i = 0; i < count; i++) {
            //取出i位置列的字段名,作为字典的键
            const char* cKey = sqlite3_column_name(stmt, i);
            NSString *key = [NSString stringWithUTF8String:cKey];
            
            //取出i位置存储的值,作为字典的值
            const char *cValue = (const char *)sqlite3_column_text(stmt, i);
            NSString *value = [NSString stringWithUTF8String:cValue];
            
            [dict setValue:value forKey:key];
            
        }
        
        //将字典一个个存进字典
        [dictArray addObject:dict];
    }
    
    
    //返回所有数据的数组
    return dictArray;
}



@end
