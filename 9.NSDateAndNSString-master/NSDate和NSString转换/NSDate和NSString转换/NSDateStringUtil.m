//
//  NSDateStringUtil.m
//  NSDate和NSString转换
//
//  Created by 刘渊 on 2017/10/9.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
     NSLocale类是将与国家和语言相关的信息进行简单的组合，包括货币、语言、国家等的信息。
     获取当前系统设置语言的标识符
 */

#import "NSDateStringUtil.h"

@implementation NSDateStringUtil

+ (NSString *)stringFromDate:(NSDate *)date{
    //获取系统当前时间
    NSDate *currentDate = [NSDate date];
    //用于格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    
    NSString *strLocale = [[NSLocale currentLocale]localeIdentifier];
    NSLog(@"%@",strLocale);
    NSLocale *usLocale = [[NSLocale alloc]initWithLocaleIdentifier: strLocale];
    dateFormatter.locale = usLocale;
    
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    //NSDate转NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //输出currentDateString
    NSLog(@"%@",currentDateString);
    return currentDateString;
}

//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string{
    //需要转换的字符串
    NSString *dateString = @"2015-06-26 08:08:08";
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    NSString *strLocale = [[NSLocale currentLocale]localeIdentifier];
    NSLog(@"%@",strLocale);
    NSLocale *usLocale = [[NSLocale alloc]initWithLocaleIdentifier: strLocale];
    formatter.locale = usLocale;
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //NSString转NSDate
    NSDate *date=[formatter dateFromString:dateString];
    return date;
}

@end
