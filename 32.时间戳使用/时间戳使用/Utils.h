//
//  Utils.h
//  时间戳使用
//
//  Created by 刘渊 on 2018/1/2.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

//获取当天开始时间
-(unsigned int)getDayBeginTimestamp:(unsigned int)timestamp;

//获取任意时间 当前开始时间
+ (NSTimeInterval)getDayBeginTimeWithTime:(NSTimeInterval)time;

//获取本周第几天
+ (int)getWeekDay:(NSTimeInterval)time;

//获取当前周几
+ (NSString *)getWeekDayDescWithTime:(NSTimeInterval)time;

//获取当天星期几
+ (NSString *)currentDateWithFormatter:(NSString *)formatter;

//根据任意时间获取到 本周时间
+ (NSTimeInterval) getWeekBeginTimeWithDateTime:(NSTimeInterval) time;
@end
