//
//  Person.m
//  runtime_发送消息
//
//  Created by 刘渊 on 2017/9/6.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat{
    NSLog(@"对象方法发送消息");
}

+ (void)eat{
    
    NSLog(@"类方法发送消息");
}

- (void)run:(int)age{
    NSLog(@"%d",age);
}

@end
