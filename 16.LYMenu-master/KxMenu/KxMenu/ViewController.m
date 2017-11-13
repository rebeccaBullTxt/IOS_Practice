//
//  ViewController.m
//  KxMenu
//
//  Created by 刘渊 on 2017/9/29.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"
#import "KxMenu.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)btnClick:(UIButton *)sender {
    
    NSArray *menuArray = @[
                           
                           [KxMenuItem menuItem:@"扫一扫" image:[UIImage imageNamed:@"123"] target:self action:NULL],
                           [KxMenuItem menuItem:@"加好友" image:[UIImage imageNamed:@"123"] target:self action:NULL],
                           [KxMenuItem menuItem:@"创建讨论组" image:[UIImage imageNamed:@"123"] target:self action:NULL],
                           [KxMenuItem menuItem:@"发送到电脑" image:[UIImage imageNamed:@"123"] target:self action:NULL],
                           [KxMenuItem menuItem:@"面对面快传" image:[UIImage imageNamed:@"123"] target:self action:NULL],
                           [KxMenuItem menuItem:@"收钱" image:[UIImage imageNamed:@"123"] target:self action:NULL]
                           
                           ];
    
    [menuArray enumerateObjectsUsingBlock:^(KxMenuItem *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        obj.alignment = NSTextAlignmentCenter;
    }];
    
    
    //基础配置
    [KxMenu setTitleFont:[UIFont fontWithName:@"HelveticaNeue" size:10]];
    
    [KxMenu setTintColor:[UIColor whiteColor]];
    
//    [KxMenu setTintColor:[UIColor colorWithRed:10/255.0f green:45/255.0f blue:65/255.0f alpha:1.0]];
    
//    KxMenuItem *first = menuArray[0];
//    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
//    first.alignment = NSTextAlignmentCenter;
    
    CGRect rect = sender.frame;
    CGFloat height = 10;
    
//    height = 64;
    
    /*
     
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
    CGRect rect=button.frame;
    CGFloat height=0.0;
    if(IOS7>=7.0)
    {
        height=64;
    }
    else
    {
        height=0.0;
    }
    [KxMenu showMenuInView:self.view
                  fromRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height)
     
                 menuItems:menuItems];
    */
    
    
    //菜单显示
//    [KxMenu showMenuInView:self.view fromRect:sender.frame menuItems:menuArray];
    [KxMenu showMenuInView:self.view fromRect:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height) menuItems:menuArray];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
