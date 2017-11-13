//
//  ViewController.m
//  test
//
//  Created by 刘渊 on 2017/11/10.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 
 
 tag使用
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getInt];
    
    [self createBtn];
    
    
    //浮点数去掉小数点后 0.00以及价格格式显示
    NSString *str1 = [self removeFloatAllZero:[NSString stringWithFormat:@"%@",@"123.00"]];
    NSLog(@"str1 = %@",str1);
}

- (NSString *)removeFloatAllZero:(NSString *)string{
    //方法一:
//    NSString *testNum = string;
//    NSString *outNum = [NSString stringWithFormat:@"%@",@(testNum.floatValue)];
//    return outNum;
    
    //方法二:
        NSString * testNumber = string;
        NSString * s = nil;
        NSInteger offset = testNumber.length - 1;
        while (offset)
        {
            s = [testNumber substringWithRange:NSMakeRange(offset, 1)];
            if ([s isEqualToString:@"0"] || [s isEqualToString:@"."])
            {
                offset--;
            }
            else
            {
                break;
            }
        }
        NSString * outNumber = [testNumber substringToIndex:offset+1];
        NSLog(@"outNumber = %@", outNumber);
    return outNumber;
}

- (void)getInt{
    
    //会经过强制类型转换
    float l = 32.56;
    int m;
    m = l;
    NSLog(@"m = %d",m);
    
    float f = 1.5;
    int a;
    a = (int)f;
    NSLog(@"a = %d",a);
    
    //高斯函数,向下取整数
    float d = 1.6;
    int b;
    b = floor(d);
    NSLog(@"a = %d",b);
    
    //ceil 函数,向上取整数
    float e = 1.5;
    int c;
    c = ceilf(e);
    NSLog(@"e = %d",c);
    
    //强制类型转换
    float g = 1.5;
    int h;
    h = (int)(g+0.5);
    NSLog(@"h = %d",h);
    
    
    //round函数,如果参数是小数,求本身的四舍五入
    float n = 32.56;
//    roundf(n) 33.000000
    NSLog(@"%.f",roundf(n));
    
}

- (void)createBtn{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 60, 80, 40);
    
    [button setTitle:@"扫按1" forState:UIControlStateNormal];
    [button setTag:22];
    
    [button addTarget:self action:@selector(ClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(20, 100, 80, 40);
    [button2 setTag:21];
    
    [button2 setTitle:@"按钮2" forState:UIControlStateNormal];
    
    [button2 addTarget:self action:@selector(ClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
}

- (void)ClickEvent:(UIButton *)button{
    
    NSUInteger btnTag = [button tag];
    if (btnTag == 21) {
        NSLog(@"\n button is : button2");
        button.hidden = YES;
    }else{
        NSLog(@"\n button is : button1");
    }
    
    UIButton *myBtn = (UIButton *)[self.view viewWithTag:21];
//    myBtn.hidden = YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
