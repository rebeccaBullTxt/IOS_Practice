//
//  NSObject+Objc.m
//  4_runTime分类添加属性
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "NSObject+Objc.h"
#import <objc/message.h>
@implementation NSObject (Objc)

//方法一:
//static NSString *_name;
//
//- (void)setName:(NSString *)name{
//    _name = name;
//}
//
//- (NSString *)name{
//    return _name;
//}

//方法二:
- (void)setName:(NSString *)name{
    
    //给对象添加属性
    //跟某个对象产生关联
    
    /*
     
     给哪个对象添加属性
     属性名 void *  就是id万能指针
     value:关联的值
     
     */
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name{
    
    return objc_getAssociatedObject(self, @"name");
}

@end
