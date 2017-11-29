//
//  ViewController.m
//  Masonry使用
//
//  Created by 刘渊 on 2017/10/15.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"


@interface ViewController ()

@property (nonatomic,weak) UIView *greenV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self demo1];
//
//    [self demo2];
    
//    [self demo3];
    
    [self demo4];
    
}

- (void)demo4{
    
    UIView* redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 20, 20, 20));
    }];
    
}


//masonry 公式
- (void)demo3{
    
    UIView *redV = [[UIView alloc]init];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    
    UIView* blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    [self.view addSubview:blueView];
    
    [redV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(20);
        make.right.offset(-20);
        make.height.equalTo(@40);
    }];
    
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(redV.mas_bottom).offset(20);
//        make.left.equalTo(redV.mas_centerX).offset(-20);
        make.leftMargin.equalTo(redV);
        make.height.equalTo(redV);
        make.width.equalTo(redV).multipliedBy(0.5).offset(20);
    }];
    
}



//设置一个居中的控件
- (void)demo2{
    
    UIView *redV = [[UIView alloc]init];
    redV.backgroundColor = [UIColor redColor];
    [self.view addSubview:redV];
    
    [redV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.center.equalTo(self.view);
    }];
}


/**
 使用masonry 更新和重置约束
 */
- (void)demo1{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"更新约束" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    UIButton *remakeBtn = [[UIButton alloc]init];
    [remakeBtn setTitle:@"重置约束" forState:UIControlStateNormal];
    [remakeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [remakeBtn setBackgroundColor:[UIColor redColor]];
    
    [remakeBtn addTarget:self action:@selector(remakeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:remakeBtn];
    
    
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.bottom.offset(-20);
        make.height.mas_equalTo(40);
        make.right.equalTo(remakeBtn.mas_left).offset(-20);
    }];
    
    [remakeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-20);
        make.bottom.equalTo(btn);
        make.width.height.equalTo(btn);
    }];
    
    UIView *greenV = [[UIView alloc]init];
    greenV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenV];
    
    self.greenV = greenV;
    
    [greenV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(100);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
}

- (void)btnClick{
    
    [self.greenV mas_updateConstraints:^(MASConstraintMaker *make) {
        //更新约束,只能更新已经有的约束,不能添加新的约束
        make.top.left.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)remakeBtnClick{
    
    //重置约束,把之前所有的约束全部删除
    
    [self.greenV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [UIView animateWithDuration:3 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
