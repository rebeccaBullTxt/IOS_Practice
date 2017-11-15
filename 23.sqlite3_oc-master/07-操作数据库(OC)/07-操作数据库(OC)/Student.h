//
//  Student.h
//  07-操作数据库(OC)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

/** 姓名 */
@property (nonatomic, copy) NSString *name;

/** 年龄 */
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (instancetype)initWithDict:(NSDictionary *)dict;

// 将对象本身插入数据库中
- (void)insertStudent;

// 调用该方法时,从数据库中查询出来所有的学生对象,并且返回
+ (NSArray *)loadData;

@end
