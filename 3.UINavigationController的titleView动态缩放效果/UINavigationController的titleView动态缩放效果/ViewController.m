//
//  ViewController.m
//  UINavigationController的titleView动态缩放效果
//
//  Created by 刘渊 on 2017/11/2.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"
#import "PersonalCenterVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)btnClick:(id)sender {
    
    PersonalCenterVC *vc = [[PersonalCenterVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
