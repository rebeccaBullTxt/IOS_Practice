//
//  BaseView.m
//  masonry使用6-29
//
//  Created by 刘渊 on 2018/6/29.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "BaseView.h"
#import "Masonry.h"
@implementation BaseView

- (id)init{
    
    self = [super init];
    if (!self) return nil;
    
    
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];
    
    int padding = 10;
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(self).offset(padding);
        make.left.equalTo(self).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(redView.mas_left).offset(-padding);
        make.width.equalTo(redView);
        
        make.height.mas_equalTo(redView);
        make.height.mas_equalTo(blueView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(padding);
        make.left.equalTo(greenView.mas_right).offset(padding);
        make.bottom.equalTo(blueView.mas_top).offset(-padding);
        make.right.equalTo(self).offset(-padding);
        make.width.equalTo(greenView);
        
        make.height.mas_equalTo(@[greenView,blueView]);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(greenView.mas_bottom).offset(padding);
        make.left.equalTo(self).offset(padding);
        make.bottom.equalTo(self).offset(-padding);
        make.right.equalTo(self).offset(-padding);
        
        make.height.mas_equalTo(@[greenView.mas_height,redView.mas_height]);
    }];
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
