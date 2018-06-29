//
//  LUTestCell.m
//  响应者链
//
//  Created by 刘渊 on 2018/4/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "LUTestCell.h"
#import "UIResponder+LYResponder.h"

@interface LUTestCell()
@property (nonatomic,strong) UIButton *btn;

@end

@implementation LUTestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self btn];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (UIButton *)btn{
    
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 50, 30)];
        _btn.backgroundColor = [UIColor greenColor];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_btn];
    }
    return _btn;
}


- (void)btnClick:(UIButton *)sender{
//    NSLog(@"按钮点击");
    
    [self.nextResponder routerEventWithName:@"showCell" userInfo:@{@"text":@"liuyuan"}];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
