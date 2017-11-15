//
//  RectView.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 path.lineCapStyle这个线段起点是终点的样式，这个样式有三种：
 （
 1、kCGLineCapButt该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。
 2、kCGLineCapRound 该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆。
 3、kCGLineCapSquare 该属性值指定绘制方形端点。 线条结尾处绘制半个边长为线条宽度的正方形。需要说明的是，这种形状的端点与“butt”形状的端点十分相似，只是采用这种形式的端点的线条略长一点而已
 ）
 4、path.lineJoinStyle这个属性是用来设置两条线连结点的样式，同样它也有三种样式供我们选择
 (
 1、kCGLineJoinMiter 斜接
 2、kCGLineJoinRound 圆滑衔接
 3、kCGLineJoinBevel 斜角连接
 ）
 5、[path stroke];用 stroke 得到的是不被填充的 view ，[path fill]; 用 fill 得到的内部被填充的 view，这点在下面的代码还有绘制得到的图片中有，可以体会一下这两者的不同。
 */

#import "RectView.h"

@implementation RectView

- (void)drawRect:(CGRect)rect{
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 100, 80)];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound;// 线条拐角
    path.lineJoinStyle = kCGLineJoinRound;//终点处理
//    [path fill];
    [path stroke];
    
}

@end
