//
//  UIResponder+LYResponder.m
//  响应者链
//
//  Created by 刘渊 on 2018/4/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "UIResponder+LYResponder.h"

@implementation UIResponder (LYResponder)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
