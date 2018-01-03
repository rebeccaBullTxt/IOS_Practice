//
//  ViewController.m
//  test_平分屏幕
//
//  Created by 刘渊 on 2017/12/20.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *superV;

@property (weak, nonatomic) IBOutlet UIButton *A;
@property (weak, nonatomic) IBOutlet UIButton *B;
@property (weak, nonatomic) IBOutlet UIButton *C;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ACWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ABWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *Ctrailing;

@end

@implementation ViewController{
    UIButton *_tempBt;
}

- (void)updateViewConstraints{
    [super updateViewConstraints];

//    NSArray *constraints = self.A.constraints;
//    for (NSLayoutConstraint *constraint in constraints) {
//        [self.A removeConstraint:constraint];
//    }
//
//    NSArray *constraints1 = self.B.constraints;
//    for (NSLayoutConstraint *constraint in constraints1) {
//        [self.B removeConstraint:constraint];
//    }
//
//    NSArray *constraints2 = self.C.constraints;
//    for (NSLayoutConstraint *constraint in constraints2) {
//        [self.C removeConstraint:constraint];
//    }

//    [self.A removeConstraint:_ACWidth];
//    [self.A removeConstraint:_ABWidth];
    [_A removeFromSuperview];
    [_B removeFromSuperview];
    [_C removeFromSuperview];
    
    NSInteger count = 4;
    UIButton * tempBtn = nil;
    CGFloat height = 30.0f; //
    CGFloat padding = 0.0f;

    NSArray *tempA = @[_A,_B,_C,_tempBt];
    for (NSInteger i = 0; i < count; i++) {

        [_superV addSubview:tempA[i]];
        if (i == 0) {
            [tempA[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_superV).offset(padding);
                make.height.equalTo(@(height));
                make.centerY.equalTo(_superV);
            }];

        } else if (i == count -1) {
            [tempA[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(tempBtn.mas_right).offset(padding);
                make.right.equalTo(_superV.mas_right).offset(-padding);
                make.height.equalTo(tempBtn);
                make.width.equalTo(tempBtn);
                make.centerY.equalTo(tempBtn);
            }];

        } else {
            [tempA[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(tempBtn.mas_right).offset(padding);
                make.centerY.equalTo(tempBtn);
                make.height.equalTo(tempBtn);
                make.width.equalTo(tempBtn);
            }];

        }
        tempBtn = tempA[i];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _C.translatesAutoresizingMaskIntoConstraints = NO;
    _A.translatesAutoresizingMaskIntoConstraints = NO;
    _B.translatesAutoresizingMaskIntoConstraints = NO;

    UIButton *btnTrend = [[UIButton alloc]initWithFrame:CGRectZero];
    [btnTrend setTitle:@"趋势" forState:UIControlStateNormal];
    [btnTrend.titleLabel setTextColor:[UIColor whiteColor]];
    [_superV addSubview:btnTrend];

    _tempBt = btnTrend;
}






- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
