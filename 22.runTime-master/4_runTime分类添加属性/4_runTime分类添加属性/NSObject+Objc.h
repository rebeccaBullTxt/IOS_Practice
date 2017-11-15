//
//  NSObject+Objc.h
//  4_runTime分类添加属性
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Objc)

//给分类添加属性  @property在分类里只会生成getset方法的声明,set方法没有
@property (nonatomic,copy) NSString *name;


@end
