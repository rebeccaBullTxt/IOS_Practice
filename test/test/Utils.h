//
//  Utils.h
//  test
//
//  Created by 刘渊 on 2018/1/15.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
//获取当前月份有多少天
-(NSInteger)getCurrentMonthForDays;

//获取目标月份有多少天
-(NSInteger)getNextNMonthForDays:(NSDate *)date;

//获取某个月1号的date对象
-(NSDate *)getAMonthframDate:(NSDate*)date;

//获取某个月1号是星期几
-(NSInteger)getFirstDayWeekForMonth:(NSDate*)date;

/**
 *  @author jaki, 15-09-21 17:09:42
 *  @brief  获取一个标准时间戳与当前时间的时间差
 *  @param tinterval 时间戳
 *  @return 距离当前时间的时间间隔
 */
-(NSString *)getStandardTimeInterval:(NSTimeInterval)interval;

//获取当前系统时间
-(NSString *)getCurrentTime;


// date对象转换成字符串（最后return根据自己需求处理）
-(NSString * )theTargetDateConversionStr:(NSDate * )date;


// NSString对象转date
-(NSDate* )theTargetStringConversionDate:(NSString *)str;
@end
