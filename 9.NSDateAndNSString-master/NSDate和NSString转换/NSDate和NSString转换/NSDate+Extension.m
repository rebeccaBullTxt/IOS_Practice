//
//  NSDate+Extension.m
//  NSDate和NSString转换
//
//  Created by 刘渊 on 2017/10/9.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)nowFromDateExchange:(int)oldTime{
    
    //oldTime 为服务器返回的消息时间:距离1970年多少秒
    
    //计算现在距离1970年多少秒
    NSDate *date = [NSDate date];
    NSTimeInterval currentTime = [date timeIntervalSince1970];
    
    //计算现在的时间和发布时间的时间差
    double timeDiffence = currentTime - oldTime;
    
    //根据秒数的时间差的不同,返回不同的时间格式
    if (timeDiffence <= 60) {
        return [NSString stringWithFormat:@"%.0f 秒前",timeDiffence];
    }else if (timeDiffence <= 3600) {
        return [NSString stringWithFormat:@"%.0f 分钟前",timeDiffence / 60];
    }else if (timeDiffence <= 86400) {
        return [NSString stringWithFormat:@"%.0f 小时前",timeDiffence / 3600];
    }else if (timeDiffence <= 604800) {
        return [NSString stringWithFormat:@"%.0f 天前",timeDiffence /3600 / 24];
    }else{
        //返回具体的日期 字符串转为NSDate
        NSDate *oldTimeDate = [NSDate dateWithTimeIntervalSince1970:oldTime];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        return [formatter stringFromDate:oldTimeDate];
    }
    
}



@end
