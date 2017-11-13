//
//  SingletonUtils.h
//  单例类
//
//  Created by 刘渊 on 2017/10/9.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonUtils : NSObject<NSCopying,NSMutableCopying>
+ (SingletonUtils *)sharedInstance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone;
@end
