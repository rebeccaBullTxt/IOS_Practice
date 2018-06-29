//
//  myView.m
//  masonry使用
//
//  Created by 刘渊 on 2018/6/21.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "myView.h"
#import "Masonry.h"
@interface myView()
@property (weak, nonatomic) IBOutlet UILabel *lab_123;
@property (weak, nonatomic) IBOutlet UIImageView *img;

//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@end

@implementation myView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    
}

- (void)updateConstraints{
    [super updateConstraints];
    
//    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

//    [_lab_123 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.img.mas_centerY).offset(50);
//    }];
//    [_lab_123 mas_remakeConstraints:^(MASConstraintMaker *make) {
////        make.center.equalTo(self);
//        make.centerY.equalTo(self);
//        make.left.equalTo(self.img).offset(10);
//        make.size.mas_equalTo(CGSizeMake(150, 21));
//    }];
    
//    NSArray *constraints = self.lab_123.constraints;
//    for (NSLayoutConstraint *constraint in constraints) {
//        if (constraint.firstAttribute == self.bottomConstraint) {
////            constraint.constant = 50;
//            constraint.constant = _img.center.y + 50;
//        }
//    }
    
    
    
}

@end
