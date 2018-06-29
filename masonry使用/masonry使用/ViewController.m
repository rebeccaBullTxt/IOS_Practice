//
//  ViewController.m
//  masonry使用
//
//  Created by 刘渊 on 2018/6/21.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myView *v = [[[NSBundle mainBundle] loadNibNamed:@"myView" owner:self options:nil] lastObject];
    [self.view addSubview:v];

    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 80));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
