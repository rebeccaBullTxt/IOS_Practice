//
//  ViewController.m
//  CALayer使用
//
//  Created by 刘渊 on 2018/6/27.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
/*
 CALayer是定义在QuartzCore框架中的；CGImageRef、CGColorRef两种数据类型是定义在CoreGraphics框架中的；UIColor、UIImage是定义在UIKit框架中的
 
 其次，QuartzCore框架和CoreGraphics框架是可以跨平台使用的，在iOS和Mac OS X上都能使用，但是UIKit只能在iOS中使用
 
 因此，为了保证可移植性，QuartzCore不能使用UIImage、UIColor，只能使用CGImageRef、CGColorRef
 
 不过很多情况    如果显示出来的东西需要跟用户进行交互的话，用UIView；如果不需要跟用户进行交互，用UIView或者CALayer都可以
 */

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) CALayer *layer;

@property (weak, nonatomic) IBOutlet UIImageView *ImageV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test2];
}

- (void)test2{
    
    self.ImageV.layer.borderWidth = 5;
    self.ImageV.layer.borderColor = [UIColor blackColor].CGColor;
    self.ImageV.layer.cornerRadius = 20;
    self.ImageV.layer.contents = (id)[UIImage imageNamed:@"pic"].CGImage;
    
    //会有imageV 图层是圆角 , UIImage 图层不是圆角
    
    //设置超出主图层的部分把它给剪切掉。 clipsToBounds=YES; 或者 masksToBounds = YES;
    self.ImageV.layer.masksToBounds = YES;
    
    //设置 图片变形属性 2D效果 向上偏移了 100
//    self.ImageV.transform = CGAffineTransformMakeTranslation(0, -100);
    
    //3D效果
//    self.ImageV.layer.transform = CATransform3DMakeTranslation(100, 20, 0);
    
    //通过KVC来设置
//    NSValue *v=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 20, 0)];
//    [self.ImageV.layer setValue:v forKeyPath:@"transform"];

    //设置在某一个方向上的移动
//    [self.ImageV.layer setValue:@(-100) forKey:@"transform.translation.x"];
    
    //旋转
    self.ImageV.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    
    
}

- (void)test1{
    
    //CALayer属性
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.borderColor = [UIColor blackColor].CGColor;
    layer.borderWidth = 1.5f;
    layer.cornerRadius = 20;
    
    //可以直接在layer添加图片
//    layer.contents = (id)[UIImage imageNamed:@"pic"].CGImage;
    
    //阴影偏移量 shadowOffset
    layer.shadowOffset = CGSizeMake(15, 5);
    
    //阴影透明度 0~1 之间, 0表示完全透明
    layer.shadowOpacity = 0.6;
    
    layer.opacity = 1.0f;
    [self.view.layer addSublayer:layer];
    
    self.layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //变化动画是否显示 默认为YES不显示
    [CATransaction setDisableActions:NO];
    self.layer.cornerRadius = (self.layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
    self.layer.opacity = (self.layer.opacity == 1.0f) ? 0.5f : 1.0f;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
