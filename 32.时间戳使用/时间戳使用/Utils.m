//
//  Utils.m
//  时间戳使用
//
//  Created by 刘渊 on 2018/1/2.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "Utils.h"
#import "Date.h"
@implementation Utils{
    
    NSDateFormatter *_formatter;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _formatter = [[NSDateFormatter alloc] init];
    }
    return self;
}
-(unsigned int)getDayBeginTimestamp:(unsigned int)timestamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    [_formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *string = [_formatter stringFromDate:date];
    NSDate *dayBeginDate = [_formatter dateFromString:string];
    return dayBeginDate.timeIntervalSince1970;
}

+ (NSTimeInterval)getDayBeginTimeWithTime:(NSTimeInterval)time{
    
    NSDate *anyDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSTimeInterval interval = [anyDate getIntervalTimeZone];
    int mod = ((int)(time+interval-57600)) % 86400;  //时间戳从1970/1/1 8:0:0 开始  目标时区今天已经过去多少秒  1097
    NSTimeInterval d = (int)time - mod ;  //
    return d;
}

+ (int)getWeekDay:(NSTimeInterval)time
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    int weekday = (int)[components weekday];
    
    return weekday;
}

+ (NSString *)getWeekDayDescWithTime:(NSTimeInterval)time
{
    NSString *str;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    int weekday = (int)[components weekday];
    
    switch (weekday)
    {
        case 1:
            str = @"周末";
            break;
        case 2:
            str = @"周一";
            break;
        case 3:
            str = @"周二";
            break;
        case 4:
            str = @"周三";
            break;
        case 5:
            str = @"周四";
            break;
        case 6:
            str = @"周五";
            break;
        case 7:
            str = @"周六";
            break;
            
        default:
            break;
    }
    return str;
}

+ (NSString *)currentDateWithFormatter:(NSString *)formatter
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:formatter];
    NSString *weekString = [dateformatter stringFromDate:date];
    return weekString;
}

+ (NSTimeInterval) getWeekBeginTimeWithDateTime:(NSTimeInterval) time
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    NSInteger weekday = [components weekday];
    
    NSTimeInterval beginTime = [self getDayBeginTimeWithTime: time - (weekday - 1) * 24 * 3600];
    
    return beginTime;
}
@end
