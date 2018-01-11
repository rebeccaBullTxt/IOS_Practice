//
//  ViewController.m
//  attribute_text_functions
//
//  Created by 刘渊 on 2018/1/1.
//  Copyright © 2018年 刘渊. All rights reserved.
//

#import "ViewController.h"
#import "Utils.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *my_label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [_my_label sizeToFit];
    [self test4];
}

- (void)test1{
    
    _my_label.attributedText = [Utils getAttributeString:@"我今天走了:1000公里" fontName:_my_label.font.fontName fontSize:9.0 color:nil];
    
}

- (void)test2{
       _my_label.attributedText = [Utils getAttributeString:@"我今天走了1000公里" fontName:_my_label.font.fontName fontSize:9.0 color:nil];
}

- (void)test3{
    _my_label.attributedText = [Utils getAttributeString:@"我不知道你叫什么名字小时" attr:@"小时" font:[UIFont systemFontOfSize:10] color:nil];
}

- (void)test4{
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"名字",@"叫做", nil];
    _my_label.attributedText = [Utils getTargetAttributeString:@"我的名字叫做刘" target:array fontName:_my_label.font.fontName fontSize:10 color:[UIColor colorWithWhite:60.0/255 alpha:1.0]];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
