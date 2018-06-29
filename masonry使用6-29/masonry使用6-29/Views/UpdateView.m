//
//  UpdateView.m
//  masonry使用6-29
//
//  Created by 刘渊 on 2018/6/29.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "UpdateView.h"
#import "Masonry.h"
@interface UpdateView()

@property (nonatomic,strong) UIButton *growingBtn;
@property (nonatomic,assign) CGSize btnSize;

@end
@implementation UpdateView

- (instancetype)init{
    self = [super init];
    if (!self) return nil;
    
    self.growingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.growingBtn setTitle:@"Grow Me!" forState:UIControlStateNormal];
    self.growingBtn.layer.borderColor = UIColor.greenColor.CGColor;
    self.growingBtn.layer.borderWidth = 3;
    
    [self.growingBtn addTarget:self action:@selector(didTapGrowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.growingBtn];
    
    self.btnSize = CGSizeMake(100, 100);
    
    return self;
}


/*
 默认情况下，View的autoresizing工作会根据当前位置自动设置约束。我们在使用代码写自己的约束布局代码时，必须设置当前View的translatesAutoresizingMaskIntoConstraints为NO，否则无法正常运作。IB默认是NO。
 requiresConstraintBasedLayout ：我们应该在自定义View中重写这个方法。如果我们要使用Auto Layout布局当前视图，应该设置为返回YES。
 + (BOOL)requiresConstraintBasedLayout //返回view是否是约束布局模式,ios6，返回值决定了是否是autoLayout布局模式。使用autolayout返回YES
 */
+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints{
    
    [self.growingBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(self.btnSize.width)).priorityMedium();
        make.height.equalTo(@(self.btnSize.height)).priorityMedium();
        make.width.lessThanOrEqualTo(self);
        make.height.lessThanOrEqualTo(self);
    }];
    
    //according to apple super should be called at end of method
    [super updateConstraints];
}

- (void)didTapGrowButton:(UIButton *)btn{
    
    self.btnSize = CGSizeMake(self.btnSize.width * 1.3, self.btnSize.height * 1.3);
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
