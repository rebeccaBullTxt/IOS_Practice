
//
//  RoundingCornersViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 指定矩形的某个角为圆角
 
 */

#import "RoundingCornersViewController.h"
#import "RoundingCornersView.h"
@interface RoundingCornersViewController ()

@end

@implementation RoundingCornersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RoundingCornersView *roundCorners = [[RoundingCornersView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    roundCorners.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:roundCorners];
    
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
