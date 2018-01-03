//
//  CustomDate.m
//  tzz
//
//  Created by zzy on 10/17/11.
//  Copyright 2011 Zhengzhiyu. All rights reserved.
//

#import "Date.h"

@implementation NSDate(Helpers)

//获取年月日如:1987-11-27.
- (NSString *)getFormatYearMonthDay
{
	NSString *string = [NSString stringWithFormat:@"%d-%02d-%02d",[self getYear],[self getMonth],[self getDay]];
	return string;
}
//获取年月日如:11-27.
- (NSString *)getFormatMonthDay
{
	NSString *string = [NSString stringWithFormat:@"%02d-%02d",[self getMonth],[self getDay]];
	return string;
}
//获取年月日如:1987-11-27、11-27、11:27.
- (NSString *)getFormatYearMonthDayHM{
    NSString *string = nil;
    NSDate *date = [NSDate date];
    if([date getYear] == [self getYear]){
        if (date.getDay == self.getDay && date.getMonth == self.getMonth) { // 今天时间
            string = [NSString stringWithFormat:@"%@ %02d:%02d",@"今天",[self getHour],[self getMinute]];
        }else{
            string = [NSString stringWithFormat:@"%@ ",[self getFormatMonthDay]];
        }
    }
    else{
        string = [NSString stringWithFormat:@"%@",[self getFormatYearMonthDay]];
    }
    return string;
}
- (NSString*)getTime{
    NSString *string = nil;
    NSDate *date = [NSDate date];
    if([date getYear] == [self getYear]){
        if (date.getDay == self.getDay && date.getMonth == self.getMonth) { // 今天时间
            string = [NSString stringWithFormat:@"%@ %02d:%02d",@"今天",[self getHour],[self getMinute]];
        }else if(date.getDay == (self.getDay+1) && date.getMonth == self.getMonth){  //昨天
            string = [NSString stringWithFormat:@"%@ %02d:%02d",@"昨天",[self getHour],[self getMinute]];
        }else{
            string = [NSString stringWithFormat:@"%@ %02d:%02d",[self getFormatMonthDay],[self getHour],[self getMinute]];
        }
    }
    else{
        string = [NSString stringWithFormat:@"%@ %02d:%02d",[self getFormatYearMonthDay],[self getHour],[self getMinute]];
    }
    return string;

}
//该日期是该年的第几周
- (int )getWeekOfYear
{
	int i;
	int year = [self getYear];
	NSDate *date = [self endOfWeek];
	for (i = 1;[[date dateAfterDay:-7 * i] getYear] == year;i++) 
	{
	}
	return i;
}
//返回day天后的日期(若day为负数,则为|day|天前的日期)
- (NSDate *)dateAfterDay:(int)day
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	// NSDateComponents *weekdayComponents = [calendar components:NSWeekdayCalendarUnit fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:day];
	NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
	
	
	return dateAfterDay;
}
//month个月后的日期
- (NSDate *)dateafterMonth:(int)month
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	[componentsToAdd setMonth:month];
	NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
		
	return dateAfterMonth;
}
//获取日
- (int)getDay{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:self];
	return (int)[dayComponents day];
}
//获取月
- (int)getMonth
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:self];
	return (int)[dayComponents month];
}
//获取年
- (int)getYear
{
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:self];
	return (int)[dayComponents year];
}
//获取小时
- (int )getHour {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	NSInteger hour = [components hour];
	return (int)hour;
}
//获取分钟
- (int)getMinute {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
	NSDateComponents *components = [calendar components:unitFlags fromDate:self];
	NSInteger minute = [components minute];
	return (int)minute;
}
- (int )getHour:(NSDate *)date {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
	NSDateComponents *components = [calendar components:unitFlags fromDate:date];
	NSInteger hour = [components hour];
	return (int)hour;
}
- (int)getMinute:(NSDate *)date {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSUInteger unitFlags =NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay |NSCalendarUnitHour|NSCalendarUnitMinute;
	NSDateComponents *components = [calendar components:unitFlags fromDate:date];
	NSInteger minute = [components minute];
	return (int)minute;
}
//在当前日期前几天
- (NSUInteger)daysAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components day];
}
//在当前日期前几时
- (NSUInteger)hourAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSCalendarUnitHour)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components hour];
}
//在当前日期前几分
- (NSUInteger)MinuteAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSCalendarUnitMinute)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components minute];
}
//在当前日期前几秒
- (NSUInteger)secondAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSCalendarUnitSecond)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components second];
}
//在当前日期前几月
- (NSUInteger)MonthAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSCalendarUnitMonth)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components month];
}
//在当前日期前几年
- (NSUInteger)yearAgo {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:(NSCalendarUnitYear)
											   fromDate:self
												 toDate:[NSDate date]
												options:0];
	return [components year];
}
//午夜时间距今几天
- (NSUInteger)daysAgoAgainstMidnight {
	// get a midnight version of ourself:
	NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
	[mdf setDateFormat:@"yyyy-MM-dd"];
	NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];
	
	return (int)[midnight timeIntervalSinceNow] / 86400 *-1;
}

- (NSString *)stringDaysAgo {
    NSString *text = nil;
    NSInteger agoInt = [self secondAgo];
    if (agoInt < 180) {
        text = [NSString stringWithFormat:@"%@",@"刚刚"];
        return text;
    }
    agoInt = [self MinuteAgo];
    if (agoInt < 60) {
        text = [NSString stringWithFormat:@"%d %@",(int)agoInt,@"分钟前"];
        return text;
    }
    agoInt = [self hourAgo];
    if (agoInt < 24) {
        text = [NSString stringWithFormat:@"%d %@", (int)agoInt,@"小时前"];
        return text;
    }
    agoInt = [self daysAgoAgainstMidnight];
    if (agoInt < 31) {
        if (agoInt < 2) {
            text = [NSString stringWithFormat:@"%@",@"昨天"];
        }else{
            text = [NSString stringWithFormat:@"%d %@", (int)agoInt,@"天前"];
        }
        
        return text;
    }
    agoInt = [self MonthAgo];
    if (agoInt < 12) {
        text = [NSString stringWithFormat:@"%d %@", (int)agoInt,@"个月前"];
        return text;
    }
    agoInt = [self yearAgo];
    text = [NSString stringWithFormat:@"%d %@", (int)agoInt,@"年前"];
    return text;

}
- (NSString *)stringDateAgo {
    NSString *text = nil;
    NSUInteger daysAgo = [self daysAgoAgainstMidnight] ;
    switch (daysAgo) {
        case 0:
            text = [NSString stringWithFormat:@"%@ %@",@"今天", [self stringWithFormat:@"HH:mm"]];
            break;
        case 1:
            text = [NSString stringWithFormat:@"%@ %@",@"昨天", [self stringWithFormat:@"HH:mm"]];
            break;
        default:
        {
            if(self.getYear == [NSDate date].getYear){  //今年
                text = [NSString stringWithFormat:@"%@", [self stringWithFormat:@"MM-dd HH:mm"]];
            }else{
                text = [NSString stringWithFormat:@"%@", [self stringWithFormat:@"yyyy-MM-dd HH:mm"]];
            }
            
        }
            break;
    }
    return text;
}


//返回一周的第几天(周末为第一天)
- (NSUInteger)weekday {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitWeekday) fromDate:self];
	return [weekdayComponents weekday];
}
//转为NSString类型的
+ (NSDate *)dateFromString:(NSString *)string {
	return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
	NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
	[inputFormatter setDateFormat:format];
	NSDate *date = [inputFormatter dateFromString:string];
	return date;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
	return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date {
	return [date string];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed {
	/* 
	 * if the date is in today, display 12-hour time with meridian,
	 * if it is within the last 7 days, display weekday name (Friday)
	 * if within the calendar year, display as Jan 23
	 * else display as Nov 11, 2008
	 */
	
	NSDate *today = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *offsetComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
													 fromDate:today];
	
	NSDate *midnight = [calendar dateFromComponents:offsetComponents];
	
	NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];
	NSString *displayString = nil;
	
	// comparing against midnight
	if ([date compare:midnight] == NSOrderedDescending) {
		if (prefixed) {
			[displayFormatter setDateFormat:@"'at' h:mm a"]; // at 11:30 am
		} else {
			[displayFormatter setDateFormat:@"h:mm a"]; // 11:30 am
		}
	} else {
		// check if date is within last 7 days
		NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
		[componentsToSubtract setDay:-7];
		NSDate *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
		
		if ([date compare:lastweek] == NSOrderedDescending) {
			[displayFormatter setDateFormat:@"EEEE"]; // Tuesday
		} else {
			// check if same calendar year
			NSInteger thisYear = [offsetComponents year];
			
			NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay)
														   fromDate:date];
			NSInteger thatYear = [dateComponents year];
			if (thatYear >= thisYear) {
				[displayFormatter setDateFormat:@"MMM d"];
			} else {
				[displayFormatter setDateFormat:@"MMM d, yyyy"];
			}
		}
		if (prefixed) {
			NSString *dateFormat = [displayFormatter dateFormat];
			NSString *prefix = @"'on' ";
			[displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
		}
	}
	
	// use display formatter to return formatted date string
	displayString = [displayFormatter stringFromDate:date];
	
	return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date {
	return [self stringForDisplayFromDate:date prefixed:NO];
}

- (NSString *)stringWithFormat:(NSString *)format {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:format];
	NSString *timestamp_str = [outputFormatter stringFromDate:self];
	
	return timestamp_str;
}

- (NSString *)string {
	return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateStyle:dateStyle];
	[outputFormatter setTimeStyle:timeStyle];
	NSString *outputString = [outputFormatter stringFromDate:self];
	
	return outputString;
}
//返回周日的的开始时间
- (NSDate *)beginningOfWeek {
	// largely borrowed from "Date and Time Programming Guide for Cocoa"
	// we'll use the default calendar and hope for the best
	
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDate *beginningOfWeek = nil;
	BOOL ok = [calendar rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek
						   interval:NULL forDate:self];
	if (ok) {
		return beginningOfWeek;
	} 
	
	// couldn't calc via range, so try to grab Sunday, assuming gregorian style
	// Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
	
	/*
	 Create a date components to represent the number of days to subtract from the current date.
	 The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
	 */
	NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
	[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
	beginningOfWeek = nil;
	beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
	
	
	//normalize to midnight, extract the year, month, and day components and create a new date from those components.
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit)
											   fromDate:beginningOfWeek];
	return [calendar dateFromComponents:components];
}
//返回当前天的年月日.
- (NSDate *)beginningOfDay {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	NSDateComponents *components = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit |NSDayCalendarUnit) 
											   fromDate:self];
	return [calendar dateFromComponents:components];
}
//返回该月的第一天
- (NSDate *)beginningOfMonth
{
	return [self dateAfterDay:-[self getDay] + 1];
}
//该月的最后一天
- (NSDate *)endOfMonth
{
	return [[[self beginningOfMonth] dateafterMonth:1] dateAfterDay:-1];
}
//返回当前周的周末
- (NSDate *)endOfWeek {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	// Get the weekday component of the current date
	NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
	NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
	// to get the end of week for a particular date, add (7 - weekday) days
	[componentsToAdd setDay:(7 - [weekdayComponents weekday])];
	NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    return endOfWeek;
}
-(int)firstWeekDayInMonth {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:1]; //sunday is first day
    //[gregorian setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"nl_NL"]];
    
    //Set date to first of month
    NSDateComponents *comps = [gregorian components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];
    
    return (int)[gregorian ordinalityOfUnit:NSWeekdayCalendarUnit inUnit:NSWeekCalendarUnit forDate:newDate];
}
-(int)numDaysInMonth {  
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    NSUInteger numberOfDaysInMonth = rng.length;
    return (int)numberOfDaysInMonth;
}
+ (NSString *)dateFormatString {
	return @"yyyy-MM-dd";
}

+ (NSString *)timeFormatString {
	return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
	return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString {
	return [NSDate timestampFormatString];
}
-(NSDate *)offsetMonth:(int)numMonths {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

-(NSDate *)offsetHours:(int)hours {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //[offsetComponents setMonth:numMonths];
    [offsetComponents setHour:hours];
    //[offsetComponents setMinute:30];
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}

-(NSDate *)offsetDay:(int)numDays {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setFirstWeekday:2]; //monday is first day
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];
    //[offsetComponents setHour:1];
    //[offsetComponents setMinute:30];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:self options:0];
}
- (NSTimeInterval)getIntervalTimeZone{
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:self];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;  //interval<1  表示目标时间比源时间晚
    
    return interval;
}
@end
