//
//  ViewController.m
//  29.防止按钮被重复点击
//
//  Created by 刘渊 on 2017/11/29.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()

@property (nonatomic,assign) BOOL isClicked;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _isClicked = NO;
}

- (IBAction)btnClick:(UIButton *)sender {
    
    _isClicked ? NO : YES;
    
    
   
}

//方法四
//添加分类  添加属性


//方法三
- (void)demo2:(UIButton *)sender{
    sender.enabled = NO;
    
    //按钮点击操作 直到完成指定任务之后再将其enable即可.
    [self btnClickOperations:sender];
}

- (void)btnClickOperations:(UIButton *)sender{
    
    self.view.backgroundColor = [UIColor colorWithRed:((arc4random() % 255) / 255.0)
                                                green:((arc4random() % 255) / 255.0)
                                                 blue:((arc4random() % 255) / 255.0)
                                                alpha:1.0f];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"btnClickedOperations");
        sender.enabled = YES;
    });
}

//方法1
- (void)demo1:(UIButton *)sender{
    //设为不可点击状态 几秒种后恢复
    sender.enabled = NO;
    
    [self performSelector:@selector(changeButtonStatus:) withObject:sender afterDelay:1.0f];
}

-(void)changeButtonStatus:(UIButton *)sender{
    sender.enabled =YES;
}

//方法2
- (void)demo:(UIButton *)sender{
    //每次在点击之前先取消之前的操作
    [[self class]cancelPreviousPerformRequestsWithTarget:self selector:@selector(btnClick:) object:sender];
    [self performSelector:@selector(btnClick:) withObject:sender afterDelay:0.2f];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
