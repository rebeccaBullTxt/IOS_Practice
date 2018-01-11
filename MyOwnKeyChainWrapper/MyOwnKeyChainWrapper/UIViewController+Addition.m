//
//  UIViewController+Addition.m
//  MyOwnKeyChainWrapper
//
//  Created by 刘渊 on 2018/1/11.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//



#import "UIViewController+Addition.h"
#import "UIView+Addition.h"
#import "UIFont+Addtions.h"
@implementation UIViewController (Addition)

- (void)setTopNavBackGround {
    [self setNavBackGround:nil];
}
- (void)setNavBackGround:(NSString *)image{
    UIImage *nav_background = nil;
    
    if (image == nil) {
        nav_background = [[UIImage imageNamed:@"nav_bar_bg.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    } else {
        nav_background = [[UIImage imageNamed:image] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    }
    
    [self setNavBackGroundImage:nav_background];
}


/*
 [self.navigationController.navigationBar setTintColor: NE_BARCOLOR_WHITE];
 [self.navigationController.navigationBar setBarTintColor: NE_BARCOLOR_ORANGE];
 可以看出我的宏定义一个是白色，一个是橙色，设置tintColor后文字和图标变成白色，而背景变成橙色。
 */
- (void) setNavBackGroundImage:(UIImage *)image{
//    if ([Utils getSandbox:@"themeNumberForColor"] == NULL || !([[Utils getSandbox:@"themeNumberForColor"] length] > 0)) {
//        if( [self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] ) {
//            if (DeviceVersion >= 7.0) {
//
//                [self.navigationController.navigationBar setBackgroundImage:image forBarPosition:0 barMetrics:UIBarMetricsDefault ];
//            }else{
//                [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//            }
//        } else {
//            self.navigationController.navigationBar.layer.contents = (id) image.CGImage;
//        }
//    }else {
//        self.navigationController.navigationBar.barTintColor = [Utils getThemeNumberOfColor:[[Utils getSandbox:@"themeNumberForColor"] intValue]];
//
//    }
}




- (void)topTitle:(NSString *)title{
    [self topTitle:title withImages:nil withType:0];
}

- (void)topTitle:(NSString *)title withImages:(NSArray *)array withType:(NSInteger)type{
    if (array && array.count > 0) {
        NSAssert(array.count > 1, @"确保数组中正好为两个元素");
    }
    UIView *vTitle = self.navigationItem.titleView;
    if (vTitle) {  //如果已经存在
        UILabel *lbl = (UILabel *)[vTitle viewWithTag:606];
        
        lbl.text = title;
        CGSize size;
        if (DeviceVersion >= 7.0) {
            // 计算文本的大小
            NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                        lbl.font, NSFontAttributeName,
                                        //                                [UIColor redColor], NSForegroundColorAttributeName,
                                        //                                [UIColor yellowColor], NSBackgroundColorAttributeName,
                                        nil];
            size = [lbl.text boundingRectWithSize:CGSizeMake(200, 40) // 用于计算文本绘制时占据的矩形块
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  // 文本绘制时的附加选项
                                       attributes:attributes        // 文字的属性
                                          context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
        }else{
            size = [lbl.text sizeWithFont:lbl.font constrainedToSize:CGSizeMake(200, 40) lineBreakMode:NSLineBreakByWordWrapping];
        }
        lbl.width = size.width+5;
        if (lbl.width > vTitle.width) {
            vTitle.width = lbl.width+ 5;
        }
        
        lbl.x = (vTitle.width - lbl.width)/2;
        
        return;
    }
    
    
    NSString *left = [array objectAtIndex:0];
    NSString *right = [array objectAtIndex:1];
    NSInteger px = 0;   //x坐标
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 260, 44)];
    
    NSInteger width = view.width;    //文字宽度
    view.backgroundColor = [UIColor clearColor];
    if (left && left.length > 0) {  //左边有视图
        UIImage *image = [UIImage imageNamed:left];
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(px, (view.height-image.size.height) / 2, image.size.width, image.size.width)];
        imgv.tag = 605;
        imgv.image = image;
        px += image.size.width;
        [view addSubview:imgv];
        
        width -= image.size.width;
    }
    if (right && right.length > 0) {
        UIImage *img = [UIImage imageNamed:right];
        width -= img.size.width;
    }
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(px, 0, 0, view.height)];
    lblTitle.tag = 606;
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textColor = [UIColor whiteColor];
    //    lblTitle.shadowColor = [UIColor grayColor];
    //    lblTitle.shadowOffset = CGSizeMake(0, -2);
    //    lblTitle.font = [UIFont systemFontOfSize:19.0f];
//    lblTitle.font = [UIFont helveticFontOfSize:NICKNAME_FONT_SIZE];
    lblTitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:NICKNAME_FONT_SIZE];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.text = title;
    CGSize size;
    if (DeviceVersion >= 7.0) {
        // 计算文本的大小
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    lblTitle.font, NSFontAttributeName,
                                    //                                [UIColor redColor], NSForegroundColorAttributeName,
                                    //                                [UIColor yellowColor], NSBackgroundColorAttributeName,
                                    nil];
        size = [lblTitle.text boundingRectWithSize:CGSizeMake(200, 40) // 用于计算文本绘制时占据的矩形块
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  // 文本绘制时的附加选项
                                        attributes:attributes        // 文字的属性
                                           context:nil].size; // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
    }else{
        size = [lblTitle.text sizeWithFont:lblTitle.font constrainedToSize:CGSizeMake(200, 40) lineBreakMode:NSLineBreakByWordWrapping];
    }
    lblTitle.width = size.width;
    px += lblTitle.width;
    [view addSubview:lblTitle];
    
    if (right && right.length > 0) {
        UIImage *image = [UIImage imageNamed:right];
        UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(px, (view.height-image.size.height) / 2, image.size.width, image.size.width)];
        imgv.image = image;
        imgv.tag = 607;
        px += image.size.width;
        [view addSubview:imgv];
        
    }
    if ( px < view.width) { //当宽度与原来不等，校准左边，使居中
        view.width = px;
        view.x = (320-px) / 2;
    }
    self.navigationItem.titleView = view;
    
}
@end
