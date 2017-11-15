//
//  SQLiteManager.h
//  oc操作数据库
//
//  Created by 刘渊 on 2017/9/5.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLiteManager : NSObject

+ (instancetype)shareIntance;

//打开数据库成功或者失败
- (BOOL)openDB;

//执行
- (BOOL)execSQL:(NSString *)sql;

//查询
- (NSArray *)querySQL:(NSString *)querysql;
@end
