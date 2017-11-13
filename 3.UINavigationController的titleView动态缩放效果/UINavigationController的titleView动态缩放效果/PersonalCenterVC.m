//
//  PersonalCenterVC.m
//  UINavigationController的titleView动态缩放效果
//
//  Created by 刘渊 on 2017/11/2.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 contentSize:The size of the content view.其实就是scrollview可以滚动的区域。比如frame = (0, 0, 320, 480) contentSize = (320, 960),代表scrollview可以上下滚动，滚动区域为frame大小的两倍。
 contentOffset:The point at which the origin of the content view is offset from the origin of the scroll view.是scrollview当前显示区域顶点相对于frame定点的偏移量，（向屏幕内拉，偏移量是负值。向屏幕外推，偏移量是正数），比如上个例子，从初始状态向下拉50像素，contentoffset就是(0 ,-50)，从初始状态向上推tableview100像素，contentOffset就是(0 ,100)。
 contentInset:The distance that the content view is inset from the enclosing scroll view。是scrollview的contentview的顶点相对于scrollview的位置，例如你的contentInset = (0 ,100)，那么你的contentview就是从scrollview的(0 ,100)开始显示。
 
 */

#import "PersonalCenterVC.h"
#import "AboutAuthorCell.h"
#import "UIView+Frame.h"
@interface PersonalCenterVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableV;
    UIImageView *_topImageView;
    NSArray *_array;
}
@end

@implementation PersonalCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    [self setupUI];
    
    
    
}

- (void)loadData{
    
    _array = [NSArray array];
    _array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20"];
    
}

- (void)setupUI{
    [self createScaleHeaderView];
    [self createTableView];
    [self createRightButton];
}

- (void)createScaleHeaderView{
    UIView *topBkView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    topBkView.backgroundColor = [UIColor clearColor];
    _topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    _topImageView.layer.cornerRadius = _topImageView.bounds.size.width/2;
    _topImageView.layer.masksToBounds = YES;
    _topImageView.image = [UIImage imageNamed:@"head"];
    [topBkView addSubview:_topImageView];
    
    self.navigationItem.titleView = topBkView;
}

- (void)createRightButton{
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

//MARK:-右上角按钮点击事件
- (void)rightBtnClick {
    
}

- (void)createTableView{
    
    _tableV = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    
    [self.view addSubview:_tableV];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return _array.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }else{
        return 60;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        NSString *ident = @"AboutAuthorCell";
        
        AboutAuthorCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
        
        if (cell == nil) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"AboutAuthorCell" owner:self options:nil] lastObject];
        }
        
        //通过weak,把self弱引用,默认是强引用
        __weak typeof(self) weakSelf = self;
        cell.selfBlock = ^(){
            //block回调里用weakSelf
            typeof(weakSelf) strongSelf = weakSelf;
            cell.contentView.backgroundColor = [strongSelf randomColor];
        };
        
        
        return cell;
    }else{
        NSString *ident = @"myCellID";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
        
        if (_array) {
            cell.textLabel.text = [_array objectAtIndex:indexPath.row];
        }
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:20];
        cell.textLabel.textColor = [UIColor redColor];
        
        return cell;
    }
}

- (UIColor *)randomColor{
    
    CGFloat r = arc4random_uniform(255);
    CGFloat g = arc4random_uniform(255);
    CGFloat b = arc4random_uniform(255);
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIView *buttonV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 60)];
        buttonV.backgroundColor = [UIColor blueColor];
        return buttonV;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 60;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSLog(@"contentInset:{%f,%f,%f,%f}", _tableV.contentInset.top,_tableV.contentInset.right,_tableV.contentInset.bottom,_tableV.contentInset.left);
    
    NSLog(@"contentOffset:{%f,%f}", _tableV.contentOffset.x, _tableV.contentOffset.y);
    
    NSLog(@"contentSize:{%f,%f}", _tableV.contentSize.height, _tableV.contentSize.width);
    /*
     *contentInset: top=64，即是navBar的高度，说明是从这儿开始显示tableview而不是从（0,0,0,0)开始显示的。
     
     *contentOffset: y = -64。当前显示区域顶点相对于frame的偏移量。即是-64，可以理解成从（0，0）的位置向下拉了64像素，上面我们说到过，（向屏幕内拉，偏移量是负值。向屏幕外推，偏移量是正数）。
     
     *contentSize 是tableView的滑动区域。宽度就是屏幕的宽度，高度是cell.Height乘以cell.Count
     */
    
    CGFloat contentSet = scrollView.contentOffset.y + _tableV.contentInset.top;
    if (contentSet >= 0 && contentSet <= 30) {
        _topImageView.transform = CGAffineTransformMakeScale(1 - contentSet/60, 1-contentSet/60);
        _topImageView.y = 0;
    } else if (contentSet > 30) {
        _topImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        _topImageView.y = 0;
    } else if (contentSet < 0 ) {
        _topImageView.transform = CGAffineTransformMakeScale(1, 1);
        _topImageView.y = 0;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
