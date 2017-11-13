//
//  AboutAuthorCell.m
//  UINavigationController的titleView动态缩放效果
//
//  Created by 刘渊 on 2017/11/2.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "AboutAuthorCell.h"

@implementation AboutAuthorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)editBtnClick:(id)sender {
    
    if (self.selfBlock) {
        _selfBlock();
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
