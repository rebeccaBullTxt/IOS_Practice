//
//  DashLineViewUtil.h
//  dashLineViewDemo
//
//  Created by 刘渊 on 2018/5/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
//view宽高是 线宽高

@interface DashLineViewUtil : UIView

//长度
@property (nonatomic) CGFloat fDashLength;
@property (nonatomic) UIColor *lineColor;

@property (nonatomic) int type; //0:虚线  1:实线 2:竖直虚线

@end
