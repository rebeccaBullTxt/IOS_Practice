//
//  DrawPolygonView.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 绘制多边形，实际上就是又一些直线条连成，主要使用moveToPoint: 和addLineToPoint:方法去创建，moveToPoint:这个方法是设置起始点，意味着从这个点开始，我们就可以使用addLineToPoint:去设置我们想要创建的多边形经过的点，也就是两线相交的那个点，用` addLineToPoint:去创建一个形状的线段，我们可以连续创建line，每一个line的起点都是先前的终点，终点就是指定的点，将线段连接起来就是我们想要创建的多边形了。
 */

#import "DrawPolygonView.h"

@implementation DrawPolygonView

- (void)drawRect:(CGRect)rect{
    
    //画笔颜色
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 5.0;
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
//    moveToPoint:这个方法是设置起始点，意味着从这个点开始
    [path moveToPoint:CGPointMake(200.0, 50.0)];
    
    //画线
    [path addLineToPoint:CGPointMake(300.0, 100.0)];
    [path addLineToPoint:CGPointMake(260, 200)];
    [path addLineToPoint:CGPointMake(100.0, 200)];
    [path addLineToPoint:CGPointMake(100, 70.0)];
    [path closePath];//第五条线通过调用closePath方法得到的
    
    [path stroke];
    
    
}

@end
