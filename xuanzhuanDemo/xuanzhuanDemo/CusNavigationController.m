//
//  CusNavigationController.m
//  xuanzhuanDemo
//
//  Created by 刘渊 on 2018/5/4.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "CusNavigationController.h"

@interface CusNavigationController ()

@end

@implementation CusNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//支持旋转

-(BOOL)shouldAutorotate{
    
    return [self.topViewController shouldAutorotate];
    
}

//支持的方向

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return [self.topViewController supportedInterfaceOrientations];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
