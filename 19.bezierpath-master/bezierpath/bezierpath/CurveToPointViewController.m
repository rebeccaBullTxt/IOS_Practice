//
//  CurveToPointViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 三次贝塞尔曲线
 */

#import "CurveToPointViewController.h"
#import "CurveToPointView.h"
@interface CurveToPointViewController ()

@end

@implementation CurveToPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CurveToPointView *curveToPoint = [[CurveToPointView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    curveToPoint.backgroundColor = [UIColor blueColor];
    [self.view addSubview:curveToPoint];
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
