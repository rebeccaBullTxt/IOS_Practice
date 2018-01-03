//
//  UIButton+LY_FixMultiClick.h
//  29.防止按钮被重复点击
//
//  Created by 刘渊 on 2017/11/29.
//  Copyright © 2017年 LiuYuan. All rights reserved.
/*
 Category不能给类添加属性, 所以以上的cs_acceptEventInterval和cs_acceptEventTime只会有对应的getter和setter方法, 不会添加真正的成员变量.
 如果我们不在实现文件中添加其getter和setter方法, 则采用 btn.cs_acceptEventInterval = 1; 这种方法尝试访问该属性会出错.
 */

#import <UIKit/UIKit.h>

@interface UIButton (LY_FixMultiClick)

//重复点击的时间间隔
@property (nonatomic,assign) NSTimeInterval ly_acceptEventInterval;

@property (nonatomic,assign) NSTimeInterval ly_acceptEventTime;


@end
