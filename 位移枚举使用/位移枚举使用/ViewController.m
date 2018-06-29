//
//  ViewController.m
//  位移枚举使用
//
//  Created by 刘渊 on 2018/6/28.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"


/*
 NS_OPTIONS ：一般用来定义位移相关操作的枚举值。
 NS_ENUM： 一般用来定义普通的枚举。
 
 十进制1在二进制中表示为0001
 位运算符 << 表示左移
 
 */
typedef NS_OPTIONS(NSUInteger, DirectionType){
    DirectionTypeUp = 1 << 0,       //十进制1  0001中 1 左移 0位  0001十进制表示为1
    DirectionTypeLeft = 1 << 1,     //十进制2  0001中 1 左移 1位  0010十进制表示为2
    DirectionTypeDown = 1 << 2,     //十进制4  0001中 1 左移 2位  0100十进制表示为4
    DirectionTypeRight = 1 << 3,    //十进制8  0001中 1 左移 3位  1000十进制表示为8
};


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test:DirectionTypeUp | DirectionTypeLeft | DirectionTypeRight];
    
    // DirectionTypeUp    表示 0001
    // DirectionTypeLeft  表示 0010
    // DirectionTypeRight 表示 1000
    // DirectionTypeDown  表示 0100
}

- (void)test:(DirectionType)options{
    
    //不能使用 if else
    
    
    //options : 1011
    
    if (options & DirectionTypeUp) {           // 1011 & 0001 按位与为 0001
        NSLog(@"向上");
    }
    if (options & DirectionTypeLeft) {   // 1011 & 0010 按位与为 0010
        NSLog(@"向左");
    }
    if (options & DirectionTypeDown) {   // 1011 & 0100 按位与为 0000
        NSLog(@"向下");
    }
    if (options & DirectionTypeRight) {  // 1011 & 1000 按位与为 1000
        NSLog(@"向右");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
