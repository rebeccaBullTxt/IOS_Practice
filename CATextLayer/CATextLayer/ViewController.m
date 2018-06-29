//
//  ViewController.m
//  CATextLayer
//
//  Created by 刘渊 on 2018/5/9.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATextLayer *lary = [CATextLayer layer];
    lary.string = @"dasfasa";
    lary.bounds = CGRectMake(0, 0, 320, 20);
    lary.font = (__bridge CFTypeRef _Nullable)(@"HiraKakuProN-W3");//字体的名字 不是 UIFont
    lary.fontSize = 12.f;//字体的大小
//    或者
    //UIFont *font = [UIFont systemFontOfSize:14];
    //    CFStringRef fontCFString = (__bridge CFStringRef)font.fontName;
    //       CGFontRef fontRef = CGFontCreateWithFontName(fontCFString);
    //       textLayer.font = fontRef;
    //       textLayer.fontSize = font.pointSize;
    //       CGFontRelease(fontRef); //与CFRelease的功能相当 当字体的null的时候不会引起程序出错
    
    lary.wrapped = YES;//默认为No.  当Yes时，字符串自动适应layer的bounds大小
    lary.alignmentMode = kCAAlignmentCenter;//字体的对齐方式
    lary.position = CGPointMake(160, 410);//layer在view的位置 适用于跟随摸一个不固定长的的控件后面需要的
    lary.contentsScale = [UIScreen mainScreen].scale;//解决文字模糊 以Retina方式来渲染，防止画出来的文本像素化
    lary.foregroundColor =[UIColor redColor].CGColor;//字体的颜色 文本颜色
    [self.view.layer addSublayer:lary];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
