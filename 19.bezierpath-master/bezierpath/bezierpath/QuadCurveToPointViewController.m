//
//  QuadCurveToPointViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 二次贝塞尔曲线
 */

#import "QuadCurveToPointViewController.h"
#import "QuadCurveToPointView.h"
@interface QuadCurveToPointViewController ()

@end

@implementation QuadCurveToPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QuadCurveToPointView *quadCurveToPoint = [[QuadCurveToPointView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    quadCurveToPoint.backgroundColor = [UIColor blueColor];
    [self.view addSubview:quadCurveToPoint];
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
