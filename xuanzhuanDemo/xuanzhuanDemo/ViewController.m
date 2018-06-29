//
//  ViewController.m
//  xuanzhuanDemo
//
//  Created by 刘渊 on 2018/5/4.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushaction)]];
}

-(void)pushaction{
    TwoViewController *vc = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

//是否可以旋转

- (BOOL)shouldAutorotate

{
    
    return false;
    
}

//支持的方向

-(UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    
    return UIInterfaceOrientationMaskPortrait;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
