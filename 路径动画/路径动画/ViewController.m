//
//  ViewController.m
//  路径动画
//
//  Created by 刘渊 on 2018/5/8.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#import "HeartView.h"
#import "AppDelegate.h"
@interface ViewController ()<CAAnimationDelegate>
{
    UIView *moveView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    HeartView *heart = [[HeartView alloc]init];
    //    heart.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0);
    //    [self.view addSubview:heart];
    [self createView];
    [self startAnimation];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = YES;
}

- (void)setNewOrientation:(BOOL)fullscreen{
    if (fullscreen) {
        NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }else{
        NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }
}

- (void)createView{
    moveView = [UIView new];
    moveView.backgroundColor = [UIColor purpleColor];
    moveView.frame = CGRectMake(0, 0, 30, 30);
    [self.view addSubview:moveView];
}

- (void)startAnimation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 300)];
    NSValue *value6=[NSValue valueWithCGPoint:CGPointMake(200, 400)];
    animation.values=@[value1,value2,value3,value4,value5,value6];
    
    //重复次数默认为1
    animation.repeatCount = MAXFLOAT;
    
    //是否全部返回
    animation.autoreverses = NO;
    
    //设置移动速度,越小越快
    animation.duration = 4.0f;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;
    
    [moveView.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"animationDidStop");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
