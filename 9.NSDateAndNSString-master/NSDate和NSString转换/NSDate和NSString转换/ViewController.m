//
//  ViewController.m
//  NSDate和NSString转换
//
//  Created by 刘渊 on 2017/10/9.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 //0 简单使用
 //1 添加工具类 转换的地方多  需要添加工具类
 //2 添加分类
 项目用到了从服务器返回距离1970年多少秒的发布的数据，然后计算多少当前时间距离消息发布的时间，1分钟以内显示几秒前，1小时以内显示几分钟前，1天以内显示几小时前，超过一天则显示具体日期，这是需求
 添加 NSDate扩展类
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo1];
}


//NSDate转为NSString
- (void)demo1{
    //0 获g取当前系统时间
    NSDate *currentDate = [NSDate date];
    
    //1 用来格式化NSDate对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //2 设置格式zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    //3 NSDate转为NSString
    NSString *currentDateString = [dateFormatter stringFromDate:currentDate];
    //4 输出currentDateString
    NSLog(@"%@",currentDateString);
    
    //设置时区
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [dateFormatter setTimeZone:timeZone];
    //将用timeIntervalSince1970计算出来的时间加上delta，就可以获得本地的具体时间了 否则会相差 8个小时
    NSInteger delta = [timeZone secondsFromGMT];
    
//    NSDate对象包含两个部分，日期（Date）和时间（Time）。格式化的时间字符串主要也是针对日期和时间的。NSDateFormatter是一个很常用的类，用于格式化NSDate对象，支持本地化的信息。
    
    /*
     yyyy-MM-dd HH:mm:ss.SSS
     yyyy-MM-dd HH:mm:ss
     yyyy-MM-dd
     MM dd yyyy
     
     G: 公元时代，例如AD公元
     yy: 年的后2位
     yyyy: 完整年
     MM: 月，显示为1-12
     MMM: 月，显示为英文月份简写,如 Jan
     MMMM: 月，显示为英文月份全称，如 Janualy
     dd: 日，2位数表示，如02
     d: 日，1-2位显示，如 2
     EEE: 简写星期几，如Sun
     EEEE: 全写星期几，如Sunday
     aa: 上下午，AM/PM
     H: 时，24小时制，0-23
     K：时，12小时制，0-11
     m: 分，1-2位
     mm: 分，2位
     s: 秒，1-2位
     ss: 秒，2位
     S: 毫秒
     
     */
    
    
//    NSLocale类是将与国家和语言相关的信息进行简单的组合，包括货币、语言、国家等的信息。
//    获取当前系统设置语言的标识符
    NSString *str = [[NSLocale currentLocale]localeIdentifier];
    NSLog(@"%@",str);
    NSLocale *usLocale = [[NSLocale alloc]initWithLocaleIdentifier: str];
    dateFormatter.locale = usLocale;
    /*
     NSLocale用法简介
     用户更改了系统语言, 使用NSLocale 获取地区时间和地区
     
     获取国家、货币、语言地区编码
     +ISOCountryCodes//所有的ISO定义的国家地区编码
     +ISOCurrencyCodes//所有的ISO定义的货币编码
     +ISOLanguageCodes//所有ISO定义的语言编码
     以上我们可以用NSLog打印出来看一看。
     */
    
}


//NSString转为NSDate
- (void)demo2{
    //需要转化的字符串
    NSString *dateString = @"2015-06-26 08:08:08";
    //设置转换的格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
