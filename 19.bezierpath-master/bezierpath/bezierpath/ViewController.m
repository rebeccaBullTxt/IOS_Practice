//
//  ViewController.m
//  bezierpath
//
//  Created by 刘渊 on 2017/11/1.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"
#import "DrawPolygonViewController.h"//多边形
#import "RectViewController.h"       //矩形/正方形
#import "OvalInRectViewController.h" //圆或者椭圆
#import "ArcCenterViewController.h"  //弧线
#import "QuadCurveToPointViewController.h" //二次贝塞尔曲线
#import "CurveToPointViewController.h" //三次贝塞尔曲线
#import "RoundedRectViewController.h"
#import "RoundingCornersViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    
    self.navigationItem.title = @"UIBezierPath常用方法";
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    _titleArr = @[@"画多边形",@"画矩形(正方形)", @"创建圆形或者椭圆形", @"创建一段弧线", @"绘制二次贝塞尔曲线", @"绘制三次贝塞尔曲线", @"画带圆角的矩形", @"指定矩形的某角为圆角"];
    
}

//MARK: tableview 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellStr];
    }
    cell.textLabel.text = [_titleArr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        DrawPolygonViewController *polygon = [[DrawPolygonViewController alloc]init];
        [self navigationControllerPush:polygon titleName:_titleArr[indexPath.row]];
    }else if(indexPath.row == 1){
        RectViewController *rect = [[RectViewController alloc]init];
        [self navigationControllerPush:rect titleName:_titleArr[indexPath.row]];
    }else if(indexPath.row == 2){
        OvalInRectViewController *ovalIn = [[OvalInRectViewController alloc]init];
        [self navigationControllerPush:ovalIn titleName:_titleArr[indexPath.row]];
    }else if(indexPath.row == 3){
        ArcCenterViewController *arcCenter = [[ArcCenterViewController alloc]init];
        [self navigationControllerPush:arcCenter titleName:_titleArr[indexPath.row]];
    }else if(indexPath.row == 4){
        QuadCurveToPointViewController *quadCurve = [[QuadCurveToPointViewController alloc]init];
        [self navigationControllerPush:quadCurve titleName:_titleArr[indexPath.row]];
    }else if(indexPath.row == 5){
        CurveToPointViewController *curveP = [[CurveToPointViewController alloc]init];
        [self navigationControllerPush:curveP titleName:_titleArr[indexPath.row]];
    }else if (indexPath.row == 6){
        RoundedRectViewController *roundrect = [[RoundedRectViewController alloc]init];
        [self navigationControllerPush:roundrect titleName:_titleArr[indexPath.row]];
    }else if(indexPath.row == 7){
        RoundingCornersViewController *roundingCorners = [[RoundingCornersViewController alloc]init];
        [self navigationControllerPush:roundingCorners titleName:_titleArr[indexPath.row]];
    }
}

- (void)navigationControllerPush:(UIViewController *)viewController titleName:(NSString *)className{
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.navigationItem.title = className;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
