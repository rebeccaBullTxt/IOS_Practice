//
//  NSObject+Property.m
//  5_字典转模型,kvc实现
//
//  Created by 刘渊 on 2017/9/9.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)createPropertyCodeWithDict:(NSDictionary *)dict{
    
    NSMutableString *strM = [NSMutableString string];

    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        NSLog(@"%@ %@",propertyName,[value class]);
        
        //属性代码
        NSString *code;
       
        if ([value  isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        
        [strM appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",strM);
    
    //@property (nonatomic, assign) int attitudes_count;
    //属性代码
//    NSString *code;
    //属性策略 判断value类型,对象strong,基本数据类型是assign
//    NSString *polity;
    //属性类型
//    NSString *type;
    //属性名
//    NSString *propertyName;
    
//    code = [NSString stringWithFormat:@"@property (nonatomic,%@) %@ %@",polity,type,propertyName];
}
@end
