//
//  RoundedRectViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "RoundedRectViewController.h"
#import "RoundedRectView.h"
@interface RoundedRectViewController ()

@end

@implementation RoundedRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RoundedRectView *roundRect = [[RoundedRectView alloc] initWithFrame:CGRectMake(30, 200, 100, 100)];
    roundRect.backgroundColor = [UIColor blueColor];
    [self.view addSubview:roundRect];
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
