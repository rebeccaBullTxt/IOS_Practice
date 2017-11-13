//
//  ViewController.m
//  UIPickView
//
//  Created by 刘渊 on 2017/11/13.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) NSArray *proTimeList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    
    // 显示选中框
    pickerView.showsSelectionIndicator=YES;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    
    _proTimeList = [[NSArray alloc]initWithObjects:@"1",@"2",nil];
}

//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _proTimeList.count;
}

//每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 40;
}

//返回选中的行
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//
//    NSString *proTimeS = [_proTimeList objectAtIndex:row];
//
//    NSLog(@"返回选中的行: protimeStr = %@",proTimeS);
//}


//比titleForRow 返回值为NSString 优先级高
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSMutableAttributedString *restr = [[NSMutableAttributedString alloc]initWithString:_proTimeList[row] attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    
    return restr;
    
}

//返回当前行的内容,此处是 将数组中数值添加到滚动的显示栏上
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_proTimeList objectAtIndex:row];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
