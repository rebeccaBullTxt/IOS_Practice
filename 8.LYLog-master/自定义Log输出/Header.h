//
//  Header.h
//  自定义Log输出
//
//  Created by 刘渊 on 2017/9/23.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#ifdef DEBUG
#define DLog(...) NSLog(@"%s(第%d行) :%@",__PRETTY_FUNCTION__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])

//2017-09-28 14:31:08.946396+0800 自定义Log输出[73947:2165107] -[ViewController viewDidLoad](第20行) 刘渊

//#define DLog(args...)  NSLog(@"%s%d行:%@\n",__FUNCTION__,__LINE__,[NSString stringWithFormat:args]);
//2017-09-28 14:36:22.108807+0800 自定义Log输出[74055:2170068] -[ViewController viewDidLoad]20行:刘渊
#else
#define DLog(...)
#endif


/*
 参数解释：
 
 __VA_ARGS__是一个可变参数的宏，很少人知道这个宏，这个可变参数的宏是新的C99规范中新增的，目前似乎只有gcc支（VC6.0的编译器不支持）。宏前面加上##的作用在于，当可变参数的个数为0时，这里的##起到把前面多余的","去掉的作用,否则会编译出错, 你可以试试。
 __FILE__宏在预编译时会替换成当前的源文件名
 3.__LINE__宏在预编译时会替换成当前的行号
 4.__FUNCTION__宏在预编译时会替换成当前的函数名称
 有了以上这几个宏，特别是有了__VA_ARGS__，调试信息的输出就变得灵活多了。
 
 */
