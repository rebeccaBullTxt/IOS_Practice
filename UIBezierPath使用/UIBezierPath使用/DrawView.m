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
    
}

//绘制图片
- (void)test6{
//    使用drawInrect进行绘制
//    图片比区域小，就会拉伸；图片比区域大，就会压缩。
//
//    使用drawAtPoint进行绘制
//    有多大就绘制多大，不做任何压缩、拉伸
//
//    使用drawAsPatten进行绘制
//    如果图片比区域小，会进行平铺；如果图片比区域大，有多少绘制多少
    
    
    UIImage *image = [UIImage imageNamed:@"timg"];
    //    方式一：
//    [image drawInRect:CGRectMake(10, 10, 50, 50)];
    //    方式二：
//    [image drawAtPoint:CGPointMake(55, 55)];
    //    方式三：
//    [image drawAsPatternInRect:CGRectMake(50, 50, 100, 100)];
    
}

//绘制文字
- (void)test5:(CGRect)rect{
    //    准备文字
    NSString *str = @"今天天气不错，挺风和日丽的";
    
    //    设置文字属性:字号为12，颜色为灰色，描边宽度为10
    NSDictionary *attriStr = @{NSFontAttributeName:[UIFont systemFontOfSize:12.0],NSForegroundColorAttributeName:[UIColor grayColor],NSStrokeWidthAttributeName:@10
                               };
    
    //    绘制方式一：在限定的rect范围内进行绘制，文字会自动换行  CGRectMake(0, 0, 45, 100)
    [str drawInRect:rect withAttributes:attriStr];
    
    //    绘制方式二：从指定的点开始绘制。超出view 的区域就不再显示了。
//    [str drawAtPoint:CGPointMake(0, 45) withAttributes:attriStr];
    
}

//椭圆
- (void)test4{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 90, 30)];
    
    [path stroke];
}

//画扇形
- (void)test3{
    //    绘制扇形。参数：1，圆点坐标。参数2:半径。参数3+4，起点和终点的弧度。参数5:YES表示顺时针，NO表示逆时针。
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:30 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    //连接圆心
    [path addLineToPoint:CGPointMake(50, 50)];
    
    //渲染
    [path fill];
}

//画圆
- (void)test2{
    //    创建路径
    //    参数1:矩形的左上角圆点及矩形的宽高。参数2:矩形圆角的半径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 80, 80) cornerRadius:10];
    //    渲染
    [path stroke];
}

//画两条线
- (void)test1{
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
