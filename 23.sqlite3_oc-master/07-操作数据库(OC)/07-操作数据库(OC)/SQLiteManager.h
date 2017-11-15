//
//  SQLiteManager.h
//  07-操作数据库(OC)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLiteManager : NSObject

+ (instancetype)shareIntance;

- (BOOL)openDB;

- (BOOL)execSQL:(NSString *)sql;

- (NSArray *)querySQL:(NSString *)querySQL;

@end
