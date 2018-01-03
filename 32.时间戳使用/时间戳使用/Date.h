//
//  CustomDate.h
//  tzz
//
//  Created by zzy on 10/17/11.
//  Copyright 2011 Zhengzhiyu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (Helpers)

//获取年月日如:19871127.
- (NSString *)getFormatYearMonthDay;
- (NSString *)getFormatYearMonthDayHM;
- (int )getWeekOfYear;
- (NSDate *)dateAfterDay:(int)day;
- (NSDate *)dateafterMonth:(int)month;
- (int)getDay;
- (int)getMonth;
- (int)getYear;
- (int )getHour;
- (int)getMinute;
- (int )getHour:(NSDate *)date;
- (int)getMinute:(NSDate *)date;
- (NSString *)stringDaysAgo;
- (NSString *)stringDateAgo;
- (NSString*)getTime;
- (NSUInteger)yearAgo;
- (NSUInteger)daysAgo;
- (NSUInteger)weekday;
+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)string;
//返回该月的第一天
- (NSDate *)beginningOfMonth;
//返回当前周的周末
- (NSDate *)endOfWeek;
- (NSDate *)endOfMonth;
-(int)firstWeekDayInMonth;
-(int)numDaysInMonth;
-(NSDate *)offsetMonth:(int)numMonths;
-(NSDate *)offsetDay:(int)numDays;
-(NSDate *)offsetHours:(int)hours;
//获取其他时区与中国时区时间戳差  中国时间加上方法返回的时间差，等于当前时区的时间戳
- (NSTimeInterval)getIntervalTimeZone;
- (NSDate *)beginningOfWeek;
@end
