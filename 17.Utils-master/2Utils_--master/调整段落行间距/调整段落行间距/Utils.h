//
//  Utils.h
//  调整段落行间距
//
//  Created by 刘渊 on 2017/10/18.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Utils : NSObject

//调整段落行间距
+ (NSMutableAttributedString*)paragraphSpace:(int)lineSpace attrString:(NSString*)str;

//判断用户运动状态
//param：sec,运动的时间长
//param:steps,运动步数
//return:0,未发生运动 ；  1，走路状态； 2，奔跑状态
+ (int)motionState:(int)sec step:(int)steps;

//判断用户卡路里消耗
//param：sec,运动的时间长
//param:steps,运动步数
//return:卡路里
+ (CGFloat)caloriesState:(int)sec step:(int)steps;

//根据速度换算成每分钟消耗卡路里
+ (CGFloat)caloriesFromSpeed:(double)dis time:(double)ts;

+ (void)saveSandbox:(id)value key:(NSString *)key;  //保存都沙盒
+ (id)getSandbox:(NSString *)key;                    //沙盒中读取
+ (void)removeSandbox:(NSString *)key;               //删除沙盒内容

+ (BOOL)saveArchiver:(id)value forPath:(NSString *)path;        //保存 自定义对象
+ (id)getArchiver:(NSString *)path;                             //读取 自定义对象文件

@end
