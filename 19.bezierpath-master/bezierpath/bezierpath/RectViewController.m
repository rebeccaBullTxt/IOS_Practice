//
//  RectViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 矩形和正方形
 */

#import "RectViewController.h"
#import "RectView.h"
@interface RectViewController ()

@end

@implementation RectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RectView *rect = [[RectView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];

    rect.backgroundColor = [UIColor blueColor];
    [self.view addSubview:rect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
