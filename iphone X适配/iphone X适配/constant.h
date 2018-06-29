//
//  constant.h
//  iphone X适配
//
//  Created by 刘渊 on 2018/6/29.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#ifndef constant_h
#define constant_h

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ISIPHONEX (ScreenHeight == 812.0f) ? YES : NO

/*
 1.导航栏高度 88 非非IPoneX手机为64
 2.状态栏高度44 非IPoneX手机为20
 3.tabar高度83 非IPhoneX手机为49
 */

#define HeightNavContentBar 44.0f
#define HeightStatusBar (ISIPHONEX==YES)?44.0f: 20.0f
#define HeightNavBar    (ISIPHONEX==YES)?88.0f: 64.0f
#define HeightTabBar    (ISIPHONEX==YES)?83.0f: 49.0f

#endif /* constant_h */
