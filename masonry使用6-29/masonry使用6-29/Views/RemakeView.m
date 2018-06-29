//
//  RemakeView.m
//  masonry使用6-29
//
//  Created by 刘渊 on 2018/6/29.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "RemakeView.h"
#import "Masonry.h"
@interface RemakeView()

@property (nonatomic,strong) UIButton *movingBtn;

//是否重置约束
@property (nonatomic,assign) BOOL topLeft;
@end

@implementation RemakeView

- (instancetype)init{
    self = [super init];
    if (!self) return nil;
    
    self.movingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.movingBtn setTitle:@"点击进行移动" forState:UIControlStateNormal];
    self.movingBtn.layer.borderColor = [UIColor greenColor].CGColor;
    self.movingBtn.layer.borderWidth = 3;
    [self.movingBtn addTarget:self action:@selector(toggleButtonPosition) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.movingBtn];
    
    self.topLeft = YES;
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}

- (void)updateConstraints{
    [self.movingBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        
        if (self.topLeft) {
            make.left.top.equalTo(self).offset(10);
        }else{
            make.bottom.right.equalTo(self).offset(-10);
        }
    }];
    [super updateConstraints];
}

- (void)toggleButtonPosition {
    self.topLeft = !self.topLeft;
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
