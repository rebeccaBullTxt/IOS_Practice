//
//  ViewController.m
//  NSUserDefault存储自定义对象
//
//  Created by 刘渊 on 2018/1/31.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    NSArray*array = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString*cachePath = array[0];
    NSString*filePathName = [cachePath stringByAppendingPathComponent:@"xiaomi.plist"];
    NSArray*dataArray =@[@56,@"xiaoli"];
    [dataArray writeToFile:filePathName atomically:YES];
  
     NSArray*array1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString*cachePath1 = array1[0];
    NSString*filePathName1 = [cachePath1 stringByAppendingPathComponent:@"xiaomi.plist"];
     NSArray*dataArray1 = [NSArray arrayWithContentsOfFile:filePathName1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
