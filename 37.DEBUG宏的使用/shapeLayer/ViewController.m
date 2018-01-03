//
//  ViewController.m
//  shapeLayer
//
//  Created by coderLin on 2017/12/12.
//  Copyright © 2017年 www.test.aaaa. All rights reserved.
//

#import "ViewController.h"

#ifdef DEBUG

#define ENABLE_DEBUG_SANDBOX

#else


#endif

enum
{
    eMENU_FIRST = 0,
     eMENU_SECOND,
    eMENU_THIRD,
    eMENU_FOURTH,
#ifdef ENABLE_DEBUG_SANDBOX
    eMENU_FIFTH,
#endif
    eMENU_SIXTH
};



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger i = 4;
    switch (i) {
        case eMENU_FIRST:
            NSLog(@"%zd",eMENU_FIRST);
            break;
        case eMENU_SECOND:
            NSLog(@"%zd",eMENU_SECOND);
            break;
        case eMENU_THIRD:
            NSLog(@"%zd",eMENU_THIRD);
            break;
        case eMENU_FOURTH:
            NSLog(@"%zd",eMENU_FOURTH);
            break;
#ifdef ENABLE_DEBUG_SANDBOX
        case eMENU_FIFTH:
            NSLog(@"%zd",eMENU_FIFTH);
//            NSLog(@"%@",ENABLE_DEBUG_SANDBOX);
            break;
#endif
        case eMENU_SIXTH:
            NSLog(@"%zd",eMENU_SIXTH);
            break;
        default:
            break;
    }
    
    
    
    
    
}
- (void)shapelayerDemo
{
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *newView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:newView];
    //    newView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.9];
    newView.backgroundColor = [UIColor yellowColor];
    
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc]init];
    //    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    //    shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    
    shapeLayer.lineWidth = 1.f;//
    //    [newView.layer addSublayer:shapeLayer];
    
    newView.layer.mask = shapeLayer;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:newView.bounds];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.view.frame.size.width/              2, 200)
                                                              radius:80
                                                          startAngle:0
                                
                                                            endAngle:M_PI*2
                                                           clockwise:YES];
    [path appendPath:bezierPath];
    
    shapeLayer.path = path.CGPath;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
