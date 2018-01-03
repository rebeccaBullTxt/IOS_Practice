//
//  ViewController.h
//  时间戳使用
//
//  Created by 刘渊 on 2018/1/2.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG
//#define ENABLE_DEBUG_SANDBOX
//#define DEBUG_DEVICE_DETAIL
//#define ENABLE_REG_DEV_LOG
#define LOG(args...)  NSLog(@"%s%d行:%@\n",__FUNCTION__,__LINE__,[NSString stringWithFormat:args]);
#else
//#include "externalrelease.h"
#endif

//#ifdef ENABLE_DEBUG_SANDBOX
//#define LOG(args...)  NSLog(@"%s%d行:%@\n",__FUNCTION__,__LINE__,[NSString stringWithFormat:args]);
//#else
//#define LOG(args...)
//#endif


@interface ViewController : UIViewController


@end

