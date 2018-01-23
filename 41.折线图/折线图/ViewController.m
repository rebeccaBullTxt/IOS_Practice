//
//  ViewController.m
//  折线图
//
//  Created by 刘渊 on 2018/1/23.
//  Copyright © 2018年 LiuYuan. All rights reserved.
/*
 position属性是决定子layer在父layer上的位置，默认为（0，0）。其次，anchorPoint属性是决定子layer上的哪个点会在position所指定的位置。
 */

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test5];
}

- (void)test5{
    UIBezierPath * path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 10, 200, 200)];
    
    CAShapeLayer * shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.backgroundColor = [UIColor blueColor].CGColor;
    shapeLayer2.frame = CGRectMake(0, 0, 200, 200);
    
    //    end必须大于start
    shapeLayer2.strokeStart = 0;
    shapeLayer2.strokeEnd = 0;
    
    //当前的layer在其父layer层的坐标
    shapeLayer2.position = CGPointMake(self.view.center.x, self.view.center.y+70);
    shapeLayer2.fillColor = [UIColor yellowColor].CGColor;
    shapeLayer2.strokeColor = [UIColor redColor].CGColor;
    shapeLayer2.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer2.path = path2.CGPath;
    
    [self.view.layer addSublayer:shapeLayer2];
    
    _shapeLayer = shapeLayer2;
    
    
    //可以直接使用的时间线程
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(circleChange) userInfo:nil repeats:YES];
    
    /*
     需要强引用,否则会销毁
     [NSTimer timerWithTimeInterval:1 target:self selector:@selector(circleChange) userInfo:nil repeats:YES];
     */
    
    
}

- (void)circleChange{
    _shapeLayer.strokeEnd = 0.8;
}

//strokeStart 和 strokeEnd 动画  范围 ：(0~1)
- (void)test4{
    // 2,绘制一个椭圆形
    UIBezierPath * path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 10, 100, 50)];
    
    CAShapeLayer * shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.backgroundColor = [UIColor blueColor].CGColor;
    shapeLayer2.frame = CGRectMake(0, 0, 300, 150);
    
//    end必须大于start
    shapeLayer2.strokeStart = 0.25;
    shapeLayer2.strokeEnd = 0.8;
    
    //当前的layer在其父layer层的坐标
    shapeLayer2.position = CGPointMake(self.view.center.x, self.view.center.y+70);
    shapeLayer2.fillColor = [UIColor yellowColor].CGColor;
    shapeLayer2.strokeColor = [UIColor redColor].CGColor;
    shapeLayer2.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer2.path = path2.CGPath;
    [self.view.layer addSublayer:shapeLayer2];
    
}


//五角星
- (void)test3{
    
    //    创建shapeLayer
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 0, 200, 200);
    _shapeLayer.position = self.view.center;
    _shapeLayer.backgroundColor = [UIColor yellowColor].CGColor;
    _shapeLayer.path = [self getStarOneBezierPath].CGPath;
    
    //超出CAShapeLayer的frame值
    _shapeLayer.masksToBounds = YES;
    
    //显示CAShapeLayer边界
    _shapeLayer.borderWidth = 2.0f;
    
    
    //填充色
    _shapeLayer.fillColor = [UIColor brownColor].CGColor;
    //线条颜色
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    _shapeLayer.lineWidth = 2.0f;
    [self.view.layer addSublayer:_shapeLayer];
    
    //    创建定时器
//    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(bezierPathAnimation) userInfo:nil repeats:YES];
}

- (UIBezierPath *)getStarOneBezierPath {
    // draw star
    UIBezierPath * starPath = [UIBezierPath bezierPath];
    
    //起点
    [starPath moveToPoint:CGPointMake(22.5, 2.5)];
    [starPath addLineToPoint:CGPointMake(28.32, 14.49)];
    [starPath addLineToPoint:CGPointMake(41.52, 16.32)];
    [starPath addLineToPoint:CGPointMake(31.92, 25.56)];
    [starPath addLineToPoint:CGPointMake(34.26, 38.68)];
    [starPath addLineToPoint:CGPointMake(22.5, 32.4)];
    [starPath addLineToPoint:CGPointMake(10.74, 38.68)];
    [starPath addLineToPoint:CGPointMake(13.08, 25.56)];
    [starPath addLineToPoint:CGPointMake(3.48, 16.32)];
    [starPath addLineToPoint:CGPointMake(16.68, 14.49)];
    [starPath closePath];
    
    return starPath;
}

/// 执行bezierPath的动画
- (void)bezierPathAnimation {
    static int i = 0;
    if (i++ % 2 == 0) {
        CABasicAnimation * circleAnim = [CABasicAnimation animationWithKeyPath:@"path"];
        circleAnim.removedOnCompletion = NO;
        circleAnim.duration = 2;
        circleAnim.fromValue = (__bridge id _Nullable)([self getStarOneBezierPath].CGPath);
        circleAnim.toValue = (__bridge id _Nullable)([self getStarTwoBezierPath].CGPath);
        _shapeLayer.path = [self getStarTwoBezierPath].CGPath;
        [_shapeLayer addAnimation:circleAnim forKey:@"animateCirclePath"];
    }else {
        CABasicAnimation * circleAnim = [CABasicAnimation animationWithKeyPath:@"path"];
        circleAnim.removedOnCompletion = NO;
        circleAnim.duration = 2;
        circleAnim.fromValue = (__bridge id _Nullable)([self getStarTwoBezierPath].CGPath);
        circleAnim.toValue = (__bridge id _Nullable)([self getStarOneBezierPath].CGPath);
        _shapeLayer.path = [self getStarOneBezierPath].CGPath;
        [_shapeLayer addAnimation:circleAnim forKey:@"animateCirclePath"];
    }
}


/// 贝塞尔曲线2
- (UIBezierPath *)getStarTwoBezierPath {
    // draw star
    UIBezierPath * starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint:CGPointMake(22.5, 2.5)];
    [starPath addLineToPoint:CGPointMake(32.15, 9.21)];
    [starPath addLineToPoint:CGPointMake(41.52, 16.32)];
    [starPath addLineToPoint:CGPointMake(38.12, 27.57)];
    [starPath addLineToPoint:CGPointMake(34.26, 38.68)];
    [starPath addLineToPoint:CGPointMake(22.5, 38.92)];
    [starPath addLineToPoint:CGPointMake(10.74, 38.68)];
    [starPath addLineToPoint:CGPointMake(6.88, 27.57)];
    [starPath addLineToPoint:CGPointMake(3.48, 16.32)];
    [starPath addLineToPoint:CGPointMake(12.85, 9.21)];
    [starPath closePath];
    
    return starPath;
}

//椭圆
- (void)test2{
    // 2,绘制一个椭圆形
    UIBezierPath * path2 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 10, 100, 50)];
    
    CAShapeLayer * shapeLayer2 = [CAShapeLayer layer];
    shapeLayer2.backgroundColor = [UIColor blueColor].CGColor;
    shapeLayer2.frame = CGRectMake(0, 0, 300, 150);
    //当前的layer在其父layer层的坐标
    shapeLayer2.position = CGPointMake(self.view.center.x, self.view.center.y+70);
    shapeLayer2.fillColor = [UIColor yellowColor].CGColor;
    shapeLayer2.strokeColor = [UIColor redColor].CGColor;
    shapeLayer2.anchorPoint = CGPointMake(0.5, 0.5);
    shapeLayer2.path = path2.CGPath;
    [self.view.layer addSublayer:shapeLayer2];
}

- (void)test1{
    // 1,绘制一条直线
    UIBezierPath * path = [[UIBezierPath alloc] init];
    path.lineWidth = 1.f;
    //设置起点
    [path moveToPoint:CGPointMake(0, 10)];
    //添加子路径
    [path addLineToPoint:CGPointMake(300, 10)];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.backgroundColor = [UIColor yellowColor].CGColor;
    shapeLayer.frame = CGRectMake(0, 0, 300, 50);
    shapeLayer.position = self.view.center;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
