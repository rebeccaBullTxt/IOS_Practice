//
//  ViewController.m
//  响应者链
//
//  Created by 刘渊 on 2018/4/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#import "LUTestCell.h"
#import "UIResponder+LYResponder.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableV;

@end

@implementation ViewController

- (UITableView *)tableV{
    
    if (!_tableV) {
        _tableV = [[UITableView alloc]initWithFrame:UIScreen.mainScreen.bounds style:UITableViewStylePlain];
        
        _tableV.delegate = self;
        _tableV.dataSource = self;
        
        _tableV.backgroundColor = [UIColor redColor];
        [self.view addSubview:_tableV];
    }
    
    return _tableV;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//
//    }

    LUTestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[LUTestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd组,第%zd行的cell",indexPath.section,indexPath.row];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self tableV];
    
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    if (![eventName isEqualToString:@"showCell"]) {
        
        UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"ViewController中捕获" message:userInfo[@"text"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertV show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
