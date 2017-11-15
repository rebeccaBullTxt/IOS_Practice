//
//  Status.m
//  5_字典转模型,kvc实现
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "Status.h"

@implementation Status

+ (Status *)statusWithDict:(NSDictionary *)dict{
    
    Status *status = [[self alloc]init];
    
    //kvc字典转模型  根据字典中所有的key 去模型里找是否有对应的属性名
    [status setValuesForKeysWithDictionary:dict];
    
    return status;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    //key没有找到的key
    if ([key isEqualToString:@"id"]) {
        _ID = [value integerValue];
    }
    
    NSLog(@"%@ %@",key,value);
}



@end
