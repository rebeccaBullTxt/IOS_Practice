//
//  NSDateStringUtil.h
//  NSDate和NSString转换
//
//  Created by 刘渊 on 2017/10/9.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateStringUtil : NSObject

//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date;

//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)string;

@end
