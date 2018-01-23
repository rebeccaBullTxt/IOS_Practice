//
//  DrawView.m
//  UIBezierPath使用
//
//  Created by 刘渊 on 2018/1/23.
//  Copyright © 2018年 LiuYuan. All rights reserved.
/*
 view扩展
 */

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //    移动到起点
    [path moveToPoint:CGPointMake(10, 10)];
    
    //    添加线段到终点
    [path addLineToPoint:CGPointMake(90, 90)];
    
    [path moveToPoint:CGPointMake(90, 10)];
    [path addLineToPoint:CGPointMake(10, 90)];
    
    
    //    设置线宽
    path.lineWidth = 10.0f;
    
    //    设置线头样式
    path.lineCapStyle = kCGLineCapRound;
    
    //    设置线交叉样式
    path.lineJoinStyle = kCGLineJoinMiter;
    
    //    渲染
    [path stroke];
    
}

@end
