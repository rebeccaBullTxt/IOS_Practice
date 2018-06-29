//
//  HeartView.m
//  路径动画
//
//  Created by 刘渊 on 2018/5/8.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "HeartView.h"

@implementation HeartView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(rect.size.width/2, 120);
    
    //起始点为路径的起点
    [path moveToPoint:startPoint];
    //设置一个终点
    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height-40);
    
//    设置第一个控制点
    CGPoint controlPoint1 = CGPointMake(100, 20);
    //设置第二个控制点
    CGPoint controlPoint2 = CGPointMake(0, 180);
    
    //添加三次贝塞尔曲线
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //设置另一个起始点
    [path moveToPoint:endPoint];
    // 设置第三个控制点
    CGPoint controlPoint3 = CGPointMake(rect.size.width-100, 20);
    // 设置第四个控制点
    CGPoint controlPoint4 = CGPointMake(rect.size.width, 180);
    // 添加三次贝塞尔曲线
    [path addCurveToPoint:startPoint controlPoint1:controlPoint4 controlPoint2:controlPoint3];
    // 设置线宽
    path.lineWidth = 3;
    // 设置线断面类型
    path.lineCapStyle = kCGLineCapRound;
    // 设置连接类型
    path.lineJoinStyle = kCGLineJoinRound;
    // 设置画笔颜色
    [[UIColor redColor] set];
    [path stroke];
    
}



@end
