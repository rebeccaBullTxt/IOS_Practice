//
//  ViewController.m
//  NSCalendarDemo
//
//  Created by 刘渊 on 2018/4/28.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    
    
    
    NSLog(@"calendarIdentifier:%@", calendar.calendarIdentifier);
    
    //1. 设置每周的第一天从星期几开始，比如：1代表星期日开始，2代表星期一开始，以此类推。默认值是1
//    calendar.firstWeekday = 2;
    NSLog(@"1.firstWeekday:%ld", calendar.firstWeekday);

    //2.每年或者每月第一周至少包含最少几天比如：设定第一周最少包括3天，则value传入3
//    calendar.minimumDaysInFirstWeek = 5;
     NSLog(@"2.minimumDaysInFirstWeek:%ld", calendar.minimumDaysInFirstWeek);
    
    //3.设置本地化信息
    NSLog(@"3.locale: %@",calendar.locale);
    
    //4.获取最大和最小范围
    NSRange range = [calendar maximumRangeOfUnit:NSCalendarUnitYear];
    NSLog(@"4.range1 = %@",NSStringFromRange(range));
    
    range = [calendar minimumRangeOfUnit:NSCalendarUnitYear];
    NSLog(@"range2 = %@",NSStringFromRange(range));
    
    //5.获取一个小的单位在一个大的单位里的序数,获取当日是本周的第几天
    NSUInteger day = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    NSLog(@"5.ordinalityOfUnit: %lu", (unsigned long)day);
    
    NSUInteger day1 = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@"当日是本月第几天: %lu",day1);
    
    NSUInteger day2 = [calendar ordinalityOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date];
    NSLog(@"本周是本月第几周: %lu",day2);
    
    //6.根据参数提供的时间点，得到一个小的单位在一个大的单位里面的取值范围
    range = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    NSLog(@"6.参数当日是本周的取值范围 = %@",NSStringFromRange(range));
    
    //7.根据参数提供的时间点，返回所在日历单位的开始时间。如果startDate和interval均可以计算，则返回YES；否则返回NO
    NSTimeInterval count = 0;
    NSDate *dateOut = nil;
    
    // 获取时间所处的月份，起始时间点
    BOOL rangeOfUnit = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&dateOut interval:&count forDate:date];
    if (rangeOfUnit) {
        //得到本地时间，避免时区问题
        NSInteger interval = [calendar.timeZone secondsFromGMTForDate:dateOut];
        NSDate *localDate = [dateOut dateByAddingTimeInterval:interval];
        NSLog(@"%@", dateOut);
        NSLog(@"%@",localDate);
        NSLog(@"%f",count);
    }else{
        NSLog(@"无法计算");
    }
    
    // 返回某个给定的日期是否在一个周末期间,如果startDate和interval均可以计算，则返回YES；否则返回NO
    rangeOfUnit = [calendar rangeOfWeekendStartDate:&dateOut interval:&count containingDate:date];
    if (rangeOfUnit) {
        //得到本地时间，避免时区问题
        NSInteger interval = [calendar.timeZone secondsFromGMTForDate:dateOut];
        NSDate *localeDate = [dateOut dateByAddingTimeInterval:interval];
        NSLog(@"%@", dateOut);
        NSLog(@"%@",localeDate);
        NSLog(@"%f",count);
    } else {
        NSLog(@"无法计算");
    }
    
    
    //8.时间比较
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
