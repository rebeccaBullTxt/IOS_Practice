//
//  ViewController.m
//  runtime_发送消息
//
//  Created by 刘渊 on 2017/9/6.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

//导入框架;building setting搜索msg设置属性为no
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *p = [[Person alloc]init];
    
    
    //a
    //对象方法,没实现编译不会报错
    [p eat];
    
    //消息机制:任何方法调用,本质都是发送消息
    //方法名转换为方法编号
    //SEL:方法编号 根据方法编号可以找到对应的方法实现
    [p performSelector:@selector(eat)];
    
    //b
    //使用运行时 xcode5之后,不建议使用底层方法
//    objc_msgSend();
    //让p对象发送消息
    
    //c
    objc_msgSend(p, @selector(eat));
    
    //d 带参数
    objc_msgSend(p, @selector(run:),10);
    
    //e类名调用类方法,本质类名转为类对象
//    [Person eat];
    [[Person class]performSelector:@selector(eat)];
    
    //f运行时写法:
    objc_msgSend([Person class], @selector(eat));
    
}

/*
 每个类都有方法列表,根据方法编号映射找到对应的方法实现
 
 */


@end
