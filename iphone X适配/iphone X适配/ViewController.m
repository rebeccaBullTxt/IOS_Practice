//
//  ViewController.m
//  iphone X适配
//
//  Created by 刘渊 on 2018/6/29.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#import "FirstViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self tableV];
    
    self.title = @"UITableView";
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
}

- (UITableView *)tableV{
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableV.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.backgroundColor = [UIColor redColor];
        [self.view addSubview:_tableV];
    }
    return _tableV;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
    }
    
    cell.contentView.backgroundColor = [UIColor grayColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd组,%zd行",indexPath.section,indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
