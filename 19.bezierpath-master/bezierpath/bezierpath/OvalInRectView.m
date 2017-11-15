//
//  OvalInRectView.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 圆或者椭圆
 */

#import "OvalInRectView.h"

@implementation OvalInRectView

- (void)drawRect:(CGRect)rect{
    
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 100, 100)];
    
    /*
     传入的rect矩形参数绘制一个内切曲线，如果我们传入的rect是矩形就得到矩形的内切椭圆，如果传入的是 正方形得到的就是正方形的内切圆。
     */
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

@end
