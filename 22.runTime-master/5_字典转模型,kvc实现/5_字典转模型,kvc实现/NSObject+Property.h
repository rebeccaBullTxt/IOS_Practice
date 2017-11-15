//
//  NSObject+Property.h
//  5_字典转模型,kvc实现
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
/*
 通过解析字典 自动生成属性代码
 */

#import <Foundation/Foundation.h>

@interface NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;

@end
