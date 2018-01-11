//
//  UIView+Addition.h
//  MyOwnKeyChainWrapper
//
//  Created by 刘渊 on 2018/1/11.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;
@property(nonatomic,assign) CGFloat centerX;
@property(nonatomic,assign) CGFloat centerY;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGPoint orign;
@property(nonatomic)CGSize size;
@property(nonatomic,readonly)CGFloat screeny;
@property(nonatomic,readonly)CGFloat screenx;   //屏幕宽
@property(nonatomic,readonly)CGRect screenRect;

@end
