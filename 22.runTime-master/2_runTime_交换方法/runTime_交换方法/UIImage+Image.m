//
//  UIImage+Image.m
//  runTime_交换方法
//
//  Created by 刘渊 on 2017/9/7.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>
@implementation UIImage (Image)

+ (UIImage *)ly_imageNamed:(NSString *)imageName{
    
    UIImage *image = [UIImage ly_imageNamed:imageName];
    if (image == nil) {
        NSLog(@"图片加载为空");
    }
    return image;
}

//加载分类的手调用
+ (void)load{
    // class_getClassMethod:获取类方法
    Method imageNamedMethod = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method ly_imageNamedMethod = class_getClassMethod([UIImage class], @selector(ly_imageNamed:));
    
    // 交换方法实现,方法都是定义在类里面
    // class_getMethodImplementation:获取方法实现
    method_exchangeImplementations(imageNamedMethod, ly_imageNamedMethod);
    
}
@end
