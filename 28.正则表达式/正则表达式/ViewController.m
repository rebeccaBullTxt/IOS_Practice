//
//  ViewController.m
//  正则表达式
//
//  Created by 刘渊 on 2017/11/10.
//  Copyright © 2017年 LiuYuan. All rights reserved.
/*
 @"^[0-9]+$"
 　　它代表了字符串中只能包含>=1个0-9的数字，语法是不是有一些怪异？
 　　下面我们先撇开iOS中的正则表达式的语法，用通俗的正则表达式语法来为介绍一下。（iOS语法与通俗的正则表达式语法相同，不同在于对转义字符的处理上(语言类的都相同)）
 　　语法：
 　　首先，特殊符号'^'和'$'。他们的作用是分别指出一个字符串的开始和结束。eg：
 　　“^one”：表示所有以”one”开始的字符串（”one cat”，”one123″，·····）；
 　　类似于:- (BOOL)hasPrefix:(NSString )aString;
 　　“a dog$”：表示所以以”a dog”结尾的字符串（”it is a dog”，·····）；
 　　类似于:- (BOOL)hasSuffix:(NSString )aString;
 　　“^apple$”：表示开始和结尾都是”apple”的字符串，这个是唯一的~；
 　　“banana”：表示任何包含”banana”的字符串。
 　　类似于 iOS8的新方法- (BOOL)containsString:(NSString )aString,搜索子串用的。
 　　‘'，'+'和'?'这三个符号，表示一个或N个字符重复出现的次数。它们分别表示“没有或更多”（[0,+∞]取整），“一次或更多”（[1,+∞]取整），“没有或一次”（[0,1]取整）。下面是几个例子：
 　　“ab”：表示一个字符串有一个a后面跟着零个或若干个b（”a”, “ab”, “abbb”,……）；
 　　“ab+”：表示一个字符串有一个a后面跟着至少一个b或者更多（ ”ab”, “abbb”,……）；
 　　“ab?”：表示一个字符串有一个a后面跟着零个或者一个b（ ”a”, “ab”）；
 　　“a?b+$”：表示在字符串的末尾有零个或一个a跟着一个或几个b（ ”b”, “ab”,”bb”,”abb”,……）。
 　　可以用大括号括起来（{}），表示一个重复的具体范围。例如
 　　“ab{4}”：表示一个字符串有一个a跟着4个b（”abbbb”）；
 　　“ab{1,}”：表示一个字符串有一个a跟着至少1个b（”ab”,”abb”,”abbb”,……)；
 　　“ab{3,4}”：表示一个字符串有一个a跟着3到4个b（”abbb”,”abbbb”)。
 　　那么，“”可以用{0，}表示，“+”可以用{1，}表示，“?”可以用{0，1}表示
 　　注意：可以没有下限，但是不能没有上限！例如“ab{,5}”是错误的写法
 　　“ | ”表示“或”操作：
 　　“a|b”：表示一个字符串里有”a”或者”b”；
 　　“(a|bcd)ef”：表示”aef”或”bcdef”；
 　　“(a|b)*c”：表示一串”a”"b”混合的字符串后面跟一个”c”；
 　　方括号”[ ]“表示在括号内的众多字符中，选择1-N个括号内的符合语法的字符作为结果，例如
 　　“[ab]“：表示一个字符串有一个”a”或”b”（相当于”a|b”）；
 　　“[a-d]“：表示一个字符串包含小写的'a'到'd'中的一个（相当于”a|b|c|d”或者”[abcd]“）；
 　　“^[a-zA-Z]“：表示一个以字母开头的字符串；
 　　“[0-9]a”：表示a前有一位的数字；
 　　“[a-zA-Z0-9]$”：表示一个字符串以一个字母或数字结束。
 　　“.”匹配除“\r\n”之外的任何单个字符：
 　　“a.[a-z]“：表示一个字符串有一个”a”后面跟着一个任意字符和一个小写字母；
 　　“^.{5}$”：表示任意1个长度为5的字符串；
 　　“\num” 其中num是一个正整数。表示”\num”之前的字符出现相同的个数，例如
 　　“(.)\1″：表示两个连续的相同字符。
 　　“10{1,2}” : 表示数字1后面跟着1或者2个0 (“10″,”100″)。
 　　” 0{3,} ” 表示数字为至少3个连续的0 （“000”，“0000”，······）。
 　　在方括号里用'^'表示不希望出现的字符，'^'应在方括号里的第一位。
 　　“@[^a-zA-Z]4@”表示两个”@”中不应该出现字母）。
 　　常用的还有：
 　　“ \d ”匹配一个数字字符。等价于[0-9]。
 　　“ \D”匹配一个非数字字符。等价于[^0-9]。
 　　“ \w ”匹配包括下划线的任何单词字符。等价于“[A-Za-z0-9_]”。
 　　“ \W ”匹配任何非单词字符。等价于“[^A-Za-z0-9_]”。
 　　iOS中书写正则表达式，碰到转义字符，多加一个“\”,例如：
 　　全数字字符：@”^\d+$”
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"abc123def 18516514242";
    
    @"^[0-9]+$";//字符串中只能包含 >= 1个 0-9的数字
    
    @"^one";//所有以one开始的字符
    
    @"a dog$";//所有以a dog 结束的字符
    
    @"^apple$";//开始和结束都是 apple
    
    "banana";//任何包含banana的字符串
    
    /*
     typedef NS_OPTIONS(NSUInteger, NSRegularExpressionOptions) {
     NSRegularExpressionCaseInsensitive             = 1 << 0, //不区分字母大小写的模式
     NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1, //忽略掉正则表达式中的空格和#号之后的字符
     NSRegularExpressionIgnoreMetacharacters        = 1 << 2, //将正则表达式整体作为字符串处理
     NSRegularExpressionDotMatchesLineSeparators    = 1 << 3, //允许.匹配任何字符，包括换行符
     NSRegularExpressionAnchorsMatchLines           = 1 << 4, //允许^和$符号匹配行的开头和结尾
     NSRegularExpressionUseUnixLineSeparators       = 1 << 5, //设置\n为唯一的行分隔符，否则所有的都有效。
     NSRegularExpressionUseUnicodeWordBoundaries    = 1 << 6 //使用Unicode TR#29标准作为词的边界，否则所有传统正则表达式的词边界都有效
     };
     */
    
    
    //手机号码匹配
    NSString *pattern = @"1[3578]\\d{9}$";
    
    NSError *error = nil;
    
    //通过规则,创建正则表达式对象
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    //利用对象匹配字符串
    NSArray<NSTextCheckingResult *> *result = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    
    if (result) {
        for (int i = 0; i < result.count; i++) {
            NSTextCheckingResult *res = result[i];
            NSLog(@"str == %@",[str substringWithRange:res.range]);
        }
        
        NSLog(@"result = %@",result);
    }else{
        NSLog(@"error == %@",error.description);
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
