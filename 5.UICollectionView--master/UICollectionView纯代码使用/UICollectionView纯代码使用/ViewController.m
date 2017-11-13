//
//  ViewController.m
//  UICollectionView纯代码使用
//
//  Created by 刘渊 on 2017/10/16.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "ViewController.h"
#import "LYCollectionViewCell.h"


#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collectionV;

@end

@implementation ViewController{
    NSMutableArray *_cellArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self setupNav];
    [self.view addSubview:self.collectionV];
    
    
    
}


- (void)loadData{
    NSArray *imgArray = [NSArray arrayWithObjects:@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png", nil];
    
    //collectionView数据
    _cellArray = [imgArray mutableCopy];
}

- (UICollectionView *)collectionV{
    
    if (_collectionV == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, fDeviceWidth, fDeviceHeight) collectionViewLayout:flowLayout];
        flowLayout.itemSize = CGSizeMake((fDeviceWidth - 20)/2, (fDeviceHeight - 20)/2 + 50);
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 5, 5);
        
        _collectionV.delegate = self;
        _collectionV.dataSource = self;
        
        _collectionV.backgroundColor = [UIColor whiteColor];
        
        [_collectionV registerClass:[LYCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    return _collectionV;
}


- (void)setupNav{
    //导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
    self.navigationItem.title = @"自定义collectionView";
}

#pragma mark - DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _cellArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"cell";
    LYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    [cell sizeToFit];
    
//    cell.backgroundColor = [UIColor redColor];
    cell.imgView.image = [UIImage imageNamed:_cellArray[indexPath.item]];
    cell.text.text = [NSString stringWithFormat:@"Cell %ld",indexPath.item];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
