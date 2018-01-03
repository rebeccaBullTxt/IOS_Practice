//
//  ViewController.m
//  同时获取UITableViewCell中的Section和row值
//
//  Created by 刘渊 on 2017/12/25.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *table;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStyleGrouped];
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.view addSubview:self.table];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger number;
    if (section==0) {
        number=2;
    }else if (section==1){
        number=3;
    }else if (section==2){
        number=5;
    }else{
        number=1;
    }
    return number;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *acell=@"acell";
    ZKbuttonTableViewCell *button=[tableView dequeueReusableCellWithIdentifier:acell];
    if (!button) {
        button=[[[NSBundle mainBundle] loadNibNamed:@"ZKbuttonTableViewCell" owner:self options:nil]lastObject];
    }
    
    [button.first addTarget:self action:@selector(btnClick:event:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(void)btnClick:(id)sender event:(id)event{
    //获取触摸点的集合，可以判断多点触摸事件
    NSSet *touches=[event allTouches];
    //两句话是保存触摸起点位置
    UITouch *touch=[touches anyObject];
    CGPoint cureentTouchPosition=[touch locationInView:self.table];
    //得到cell中的IndexPath
    NSIndexPath *indexPath=[self.table indexPathForRowAtPoint:cureentTouchPosition];
    NSLog(@"section----%i,----row---%i",indexPath.section,indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
