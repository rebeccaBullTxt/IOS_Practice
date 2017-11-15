//
//  Student.h
//  oc操作数据库
//
//  Created by 刘渊 on 2017/9/5.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic,copy) NSString* name;

@property (nonatomic,assign) NSInteger age;

- (instancetype) initWithName:(NSString *)name age:(NSInteger)age;

//将对象本身插入到数据库中
- (void)insertStudent;
@end
