//
//  ViewController.m
//  UIBezierPath使用
//
//  Created by 刘渊 on 2018/1/23.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
@interface ViewController ()

@property (nonatomic,strong) DrawView *drawV;
@end

@implementation ViewController

//保存屏幕截图,并存储至相册
- (IBAction)BtnClick:(UIButton *)sender {
    
    //    开启图片context。参数1:context的大小。参数2:是否不透明。参数三：缩放比，0 表示当前屏幕的缩放比
    UIGraphicsBeginImageContextWithOptions(_drawV.bounds.size, YES, 0);
    
    //    获取图片的范围
    [_drawV drawViewHierarchyInRect:_drawV.bounds afterScreenUpdates:YES];
    
    //    从context获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //    结束context，开启一定要结束
    UIGraphicsEndImageContext();
    
    //    将图片保存至照片库
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//系统指定的保存后结束要执行的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"%@",contextInfo);
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _drawV = [[DrawView alloc]init];
    _drawV.frame = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
    _drawV.backgroundColor = [UIColor redColor];
    [self.view addSubview:_drawV];
    
//    [self test1];
}


//保存屏幕截图,存储到相册
- (void)test1{
    //    开启一个图形的context。开启就别忘了关闭。
    //    iOS8.0 以后还需要获得用户许可的权限。之前的iOS不需要。
    //    在plist中设置申请用户许可时的提示文字。
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
