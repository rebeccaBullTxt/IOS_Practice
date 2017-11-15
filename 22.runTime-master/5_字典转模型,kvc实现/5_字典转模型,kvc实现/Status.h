//
//  Status.h
//  5_字典转模型,kvc实现
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

// 写一段程序自动生成属性代码
//通过解析字典,自动生成属性代码


// 解析字典自动生成属性代码
//@property (nonatomic, assign) int attitudes_count;

//服务器返回特殊字符 id
//@property (nonatomic,assign) int id;
@property (nonatomic,assign) NSInteger ID;

@property (nonatomic, strong) NSString *source;

@property (nonatomic, assign) int reposts_count;

@property (nonatomic, strong) NSArray *pic_urls;

@property (nonatomic, strong) NSString *created_at;

@property (nonatomic, assign) int attitudes_count;

@property (nonatomic, strong) NSString *idstr;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, assign) int comments_count;

@property (nonatomic, strong) NSDictionary *user;

@property (nonatomic,strong) NSDictionary *retweeted_status;

//字典转模型 模型提供类方法
+ (__kindof Status *)statusWithDict:(NSDictionary *)dict;

@end
