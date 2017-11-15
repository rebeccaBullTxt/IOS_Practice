//
//  DrawPolygonViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 绘制多边形
 */

#import "DrawPolygonViewController.h"
#import "DrawPolygonView.h"
@interface DrawPolygonViewController ()

@end

@implementation DrawPolygonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawPolygonView *v = [[DrawPolygonView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    
    v.backgroundColor = [UIColor blueColor];
    [self.view addSubview:v];
    
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
