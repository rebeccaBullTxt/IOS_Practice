//
//  ViewController.m
//  UISwitch使用
//
//  Created by 刘渊 on 2017/10/18.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //大小不起作用 默认使用系统的大小  默认大小是 51.0f    31.0f
    UISwitch *switchV = [[UISwitch alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    //设置UISwitch 大小
    switchV.transform = CGAffineTransformMakeScale(0.5, 0.5);
    
    /*
     
     第三方框架:LLSwitch TTSwitch
     
     1.1 CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
     这个方法可以方便的对view的长和宽进行缩放，不改变view的中心点。注意！中心点不变指的是物理位置不变，不是坐标，因为坐标系此时已经发生改变
     
     1.2 CGAffineTransformScale(CGAffineTransform t,CGFloat sx, CGFloat sy)
     这个方法同样是view的长和宽进行缩放，效果类似CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)不同的是这个方法可以叠加其他CGAffineTransform效果（比如旋转)
     */
    
    
    
    //开关开启后颜色  默认是绿色
    switchV.onTintColor = [UIColor orangeColor];
    
    //关闭状态下的边框颜色以及开关切换时的颜色
//    switchV.tintColor = [UIColor redColor];
    
    //开关的按钮颜色  小圆点的颜色
    switchV.thumbTintColor = [UIColor cyanColor];
    
    //开关的状态扭颜色 7之后 不可以使用
//    switchV.onImage = [UIImage imageNamed:@"4"];
//    switchV.offImage = [UIImage imageNamed:@"4"];
    
    switchV.backgroundColor = [UIColor blueColor];
    
    //设置开关的状态 开启还是关闭
//    [switchV setOn:NO animated:YES];
    
    [switchV addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switchV];
    
}

- (void)switchAction:(UISwitch *)swi{
    if (swi.isOn == YES) {
        NSLog(@"开");
    }else{
        NSLog(@"闭");
    }
}
//- (void)switchAction:(id)sender{
//    UISwitch *switchBtn = (UISwitch *)sender;
//    BOOL isBtnOn = [switchBtn isOn];
//
//    if (isBtnOn) {
//        NSLog(@"开");
//    }else{
//        NSLog(@"关");
//    }
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
