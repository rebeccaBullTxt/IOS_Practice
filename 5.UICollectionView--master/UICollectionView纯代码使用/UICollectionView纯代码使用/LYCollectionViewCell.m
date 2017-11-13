//
//  LYCollectionViewCell.m
//  UICollectionView纯代码使用
//
//  Created by 刘渊 on 2017/10/16.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "LYCollectionViewCell.h"

@implementation LYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor purpleColor];
    
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
    self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:self.imgView];
    
    self.text = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame)-10, 20)];
    self.text.backgroundColor = [UIColor brownColor];
    self.text.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.text];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(5, CGRectGetMaxY(self.text.frame), CGRectGetWidth(self.frame)-10,30);
    [self.btn setTitle:@"按钮" forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.btn];
}

@end
