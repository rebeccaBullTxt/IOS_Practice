//
//  ViewController.m
//  12345
//
//  Created by 刘渊 on 2017/11/23.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
//    [dataFormatter setDateFormat:@"EEEE"];
    NSString *str1 = [self currentDateWithFormatter:@"EEEE"];
}

- (NSString *)currentDateWithFormatter:(NSString *)formatter
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:formatter];
    NSString *weekString = [dateformatter stringFromDate:date];
    return weekString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
