//
//  ViewController.m
//  时间戳使用
//
//  Created by 刘渊 on 2018/1/2.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test6];
    
}

- (void)test6{
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    NSTimeInterval weekStart = [Utils getWeekBeginTimeWithDateTime:currentTime];
    LOG(@"%.0f",weekStart);
}

- (void)test5{
    NSString *currentWeekDay = [Utils currentDateWithFormatter:@"EEEE"];
    NSLog(@"%@",currentWeekDay);
}


- (void)test4{
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    NSString *currentWeekDay = [Utils getWeekDayDescWithTime:currentTime];
    LOG(@"%@",currentWeekDay);
}

- (void)test3{
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    int weekDay = [Utils getWeekDay:currentTime];
    LOG(@"%d",weekDay);
}

- (void)test2{
    //给定任意时间,返回任意时间的当天开始时间
    //计算现在距离1970年多少秒
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    int dayBeginTime = [Utils getDayBeginTimeWithTime:currentTime];
    NSLog(@"%d",dayBeginTime);
    
    NSTimeInterval dayEnd = dayBeginTime + 3600 * 24 - 1;
    NSLog(@"%.0f",dayEnd);
}

- (void)test1{
    //计算现在距离1970年多少秒
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    
    //返回输入时间戳的当天时间
    int dayBeginTime = [[Utils new] getDayBeginTimestamp:currentTime];
    NSLog(@"%d",dayBeginTime);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
