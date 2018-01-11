//
//  UIViewController+Addition.h
//  MyOwnKeyChainWrapper
//
//  Created by 刘渊 on 2018/1/11.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ButtonNormal @"statusNormal"
#define ButtonHighlighted @"statusHighlight"
#define ButtonDisabled    @"statusDisable"
#define ButtonSelected    @"statusSelect"


//当前手机版本
#define DeviceVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

@interface UIViewController (Addition)
- (void)topTitle:(NSString *)title;
//设置头标题   type:1、左边带图 2、右边带图 3、两边带图 0、不带图片
- (void)topTitle:(NSString *)title withImages:(NSArray *)array withType:(NSInteger)type;

//设置nav背景图
- (void)setTopNavBackGround;
- (void)setNavBackGround:(NSString *)image;
- (void)setNavBackGroundImage:(UIImage *)image;

@end
