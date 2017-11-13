//
//  ViewController.m
//  开发
//
//  Created by 刘渊 on 2017/9/28.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ViewController

- (void)reachabilityChanged:(NSNotification *)note
{
    Reachability* reachability = [note object];
    NSParameterAssert([reachability isKindOfClass:[Reachability class]]);
    
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable:
            // 无网络连接
            break;
        case ReachableViaWWAN:
            // 网络通过移动网络连接
            break;
        case ReachableViaWiFi:
            // 网络通过 WiFi 连接
            break;
        
        default:
            
            
            break;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
//    if ([Utils currentNetWorkType] == NotReachable) {
//        NSLog(@"网络连接状态不好");
//    }
//    switch (netStatus) {
//        case NotReachable:
//            //无网络连接
//            [Utils showHud:@"成功"];
//
//            break;
//
//        case ReachableViaWWAN:
//            //网络连接通过移动网络
//
//            break;
//
//        case ReachableViaWiFi:
//            //网络通过WiFi连接
//
//            break;
//
//        default:
//
//            break;
//    }
//    NSLog(@"网络连接状态ok");
    
    
    
    
//    NSString *str = @"简书作者:Coder#Z@b";
//    //按@"#简书@作者:"将str分离成数组,然后将数组按@"-"拼接成字符串
//    NSString *filtered = [[str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"#简书@作者:"]] componentsJoinedByString:@"-"];
//    NSLog(@"%@", filtered);
    
    
    
//    NSString *str = @"简书作者:Coder#Z@b";
//    NSCharacterSet *cs;
//    // invertedSet方法是取反字符。所以cs的值为:除了kAlphaNum里的字符,其余的任何字符都是cs
//    NSLog(@"没有反转: %@",[NSCharacterSet characterSetWithCharactersInString:kAlphaNum]);
//
//    cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
//
//    NSLog(@"反转之后: %@",[NSCharacterSet characterSetWithCharactersInString:kAlphaNum]);
//
//    NSString *fil = [str componentsSeparatedByCharactersInSet:cs];
//    NSLog(@"000000 %@",fil);
//
//    // 将str按cs分割成数组(既然能分割,说明cs是str的子集,并且cs中的字符不会在str中出现,相当于str中删除了这些字符),最后将数组按照@""分割成字符串
//    NSString *filtered = [[str componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
//    NSLog(@"字符串->数组->字符串   %@", filtered);
//
//
//
//
//    _textView.text = @"1开发队列是街坊邻居阿弗莱克解封了卡街坊邻居司法局理发卡申达股份公开课妇女们小飞机街坊邻居欧日我为HRIE恢复上课风急浪高还记得刚好看逗号分隔克里斯控件给空间爱哭鬼卡;噶看国红咖啡机阿宽和高卡卡借发货给";
//
//    CGSize size = [Utils textSize:_textView.text font:_textView.font maxSize:CGSizeMake(_textView.frame.size.width-16, 200)];
//
//    NSString *convertStr = [Utils stringToInt:2];
    
//    UIImage *img = [Utils screenShot:self.view];
//    self.img.image = img;
    
//    UIImage *img = [Utils screenShot:self.view withSize:CGSizeMake(200, 200)];
//    self.img.image = img;
}

- (IBAction)btnClick:(id)sender {
    
//    [Utils showHud:@"失败"];
//    [Utils showHud:@"成功" delay:1.4];
//    [Utils showHud:self.view text:@"成功" delay:1.4];
//    [Utils showHud:self.view text:@"成功"];
    
    
//    if ([Utils currentNetWorkType] == NotReachable) {
//        NSLog(@"网络连接状态不好");
//    }else{
//
//        NSLog(@"网络连接状态ok");
//    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
