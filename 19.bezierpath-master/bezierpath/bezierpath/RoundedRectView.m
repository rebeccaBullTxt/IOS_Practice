//
//  RoundedRectView.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
绘制一个带内切圆的矩形
 */

#import "RoundedRectView.h"

@implementation RoundedRectView

- (void)drawRect:(CGRect)rect{
    UIColor *color = [UIColor redColor];
    [color set];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:50];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

@end
