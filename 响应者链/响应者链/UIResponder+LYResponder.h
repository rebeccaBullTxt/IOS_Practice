//
//  UIResponder+LYResponder.h
//  响应者链
//
//  Created by 刘渊 on 2018/4/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (LYResponder)

//发送一个路由器消息,对eventName感兴趣的 UIResponder 可以进行处理
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
