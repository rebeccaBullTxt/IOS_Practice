//
//  ViewController.m
//  打开ios文档
//
//  Created by 刘渊 on 2018/4/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
//#import ""


@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupUI];
    
}

- (void)setupUI{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取document路径
    NSString *documents = [array lastObject];
    
    //拼接的绝对路径
    NSString *documentPath = [documents stringByAppendingPathComponent:@"myReport/file"];
    //得到文件夹名称
    NSArray *fileNameArray = [manager subpathsAtPath:documentPath];
    
    
    NSString *path = [NSString stringWithFormat:@"%@/%@", documentPath, fileNameArray[0]];
    
    //加载文件
    [self loadDocument:path inView:_webView];
}

#pragma mark - 加载文件
- (void)loadDocument:(NSString *)documentPath inView:(UIWebView *)webView{
    // NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:documentPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
