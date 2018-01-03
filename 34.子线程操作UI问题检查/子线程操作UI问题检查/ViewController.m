//
//  ViewController.m
//  子线程操作UI问题检查
//
//  Created by 刘渊 on 2017/12/25.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

#ifdef DEBUG


#else


#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImageWithURL:[NSURL URLWithString:@"https://image.baidu.com/search/detail?z=0&word=网际飞侠作品&hs=0&pn=3&spn=0&di=0&pi=42852472217&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cs=1717164438%2C696265458&os=&simid=&adpicid=0&lpn=0&fm=&sme=&cg=&bdtype=-1&oriquery=&objurl=http%3A%2F%2Fb.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fd31b0ef41bd5ad6e4411652088cb39dbb7fd3c0b.jpg&fromurl=&gsm=0&catename=pcindexhot"]];
}

-(void)setImageWithURL:(NSString *)imageDownloadUrl{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(44, 64, 250, 250)];
    NSURL *URL = [NSURL URLWithString:imageDownloadUrl];
    NSError *ERROR;
    NSData *imageData = [NSData dataWithContentsOfURL:URL options:NSDataReadingMappedIfSafe error:&ERROR];
    UIImage *image = [UIImage imageWithData:imageData];
    [imageView setImage:image];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
