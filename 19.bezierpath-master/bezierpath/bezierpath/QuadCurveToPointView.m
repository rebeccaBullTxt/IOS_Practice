//
//  QuadCurveToPointView.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "QuadCurveToPointView.h"

@implementation QuadCurveToPointView

- (void)drawRect:(CGRect)rect{
    
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    //起点
    [path moveToPoint:CGPointMake(40, 150)];
    
    //终点和控制点
    [path addQuadCurveToPoint:CGPointMake(140, 200) controlPoint:CGPointMake(20, 40)];
    
    //控制点不同会有不同的样式
    [path stroke];
}

@end
