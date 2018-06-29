//
//  Utils.m
//  test
//
//  Created by 刘渊 on 2018/1/15.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "Utils.h"

@implementation Utils

-(NSInteger)getCurrentMonthForDays{
    // 创建一个日期类对象(当前月的calendar对象)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSRange是一个结构体，其中location是一个以0为开始的index，length是表示对象的长度。他们都是NSUInteger类型。
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}

-(NSInteger)getNextNMonthForDays:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    // 调用rangeOfUnit方法:(返回一样是一个结构体)两个参数一个大单位，一个小单位(.length就是天数，.location就是月)
    NSInteger monthNum = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    return monthNum;
}

-(NSDate *)getAMonthframDate:(NSDate*)date {
    // 指定日历单位，如日期和月份。(这里指定了年月日，还有其他字段添加单位.特别齐全 ：世纪，年月日时分秒等等等)
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];// 指定日历的算法
    NSCalendarUnit dayInfoUnits  = NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
    NSDateComponents *components = [calendar components: dayInfoUnits fromDate:date];
    // 指定1号
    components.day = 1;
    // 指定月份(我这里是获取当前月份的下1个月的1号的date对象,所以用的++，其上个月或者其他同理)
    components.month++;
    // 转成需要的date对象return
    NSDate * nextMonthDate =[calendar dateFromComponents:components];
    return nextMonthDate;
}

-(NSInteger)getFirstDayWeekForMonth:(NSDate*)date
{
    // NSCalendarIdentifierGregorian : 指定日历的算法
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // NSDateComponents封装了日期的组件,年月日时分秒等(个人感觉像是平时用的model模型)
    // 调用NSCalendar的components:fromDate:方法返回一个NSDateComponents对象
    // 需要的参数分别components:所需要的日期单位 date:目标月份的date对象
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];
    NSLog(@"NSDateComponents是这个样子的:%@",comps);
    // 直接调用自己weekDay属性
    NSInteger weekday = [comps weekday];
#warning mark --找了很多原因不知道为什么星期数总是比实际快一天,有时间找更好的解决方法（暂时用-1天处理了）
    weekday--;
    NSLog(@"[comps weekday] = %ld",(long)weekday);
    if (weekday == 7) {
        return 0;
    }else return weekday;
}

/**
 *  @author jaki, 15-09-21 17:09:42
 *  @brief  获取一个标准时间戳与当前时间的时间差
 *  @param tinterval 时间戳
 *  @return 距离当前时间的时间间隔
 */
-(NSString *)getStandardTimeInterval:(NSTimeInterval)interval{
    //进行时间差比较
    //当前时间与1970时间戳(秒为单位)
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    // 当前时间戳-当时时间戳=差值(比如朋友圈动态发表时间为10分钟前(当前时间-发表时间))
    NSTimeInterval timeInterval = time-interval;
    //计算出天、小时、分钟
    int day = timeInterval/(60*60*24);
    int hour = ((long)timeInterval%(60*60*24))/(60*60);
    int minite = ((long)timeInterval%(60*60*24))%(60*60)/60;
    NSMutableString * timeStr = [[NSMutableString alloc]init];
    // 逻辑判断
    if (day!=0) {
        [timeStr appendString:[NSString stringWithFormat:@"%d天前",day]];
    }else{
        if (hour!=0) {
            [timeStr appendString:[NSString stringWithFormat:@"%d小时前",hour]];
        }else{
            if (minite<1) {
                [timeStr appendString:@"刚刚"];
            }else{
                [timeStr appendString:[NSString stringWithFormat:@"%d分钟前",minite]];
            }
        }
    }
    return timeStr;
}


-(NSString *)getCurrentTime{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    // 格式化系统时间字符串</code>
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * time = [formatter stringFromDate:[NSDate date]];
    return time;
}

//返回年月日时分秒
-(int)getYear{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.year;
    
}
-(int)getMonth{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.month;
}
-(int)getDay{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.day;
}
-(int)getHour{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.hour;
}
-(int)getMinute{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.minute;
}
-(int)getSecond{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =  NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.second;
}


// date对象转换成字符串（最后return根据自己需求处理）
-(NSString * )theTargetDateConversionStr:(NSDate * )date
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [dateFormat stringFromDate:date];
    // 根据自己需求处理字符串
    return [currentDateStr substringToIndex:7];
}


// NSString对象转date
-(NSDate* )theTargetStringConversionDate:(NSString *)str
{
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:str];
    return date;
}



@end
