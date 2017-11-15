//
//  Utils.m
//  调整段落行间距
//
//  Created by 刘渊 on 2017/10/18.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "Utils.h"

@implementation Utils

//判断用户运动状态
//68kg重量标准
//param：sec,运动的时间长
//param:steps,运动步数
//return:0,未发生运动 ；  1，慢走4km/h、1.5步/秒 2,快走8km/h、3步/秒  3,慢跑9km/h、3.3步/秒 4,快跑12km/h、4.4步/秒
+ (int)motionState:(int)sec step:(int)steps{
    
    CGFloat f = (CGFloat)steps/sec;
    if (f < 0.1 ) {
        return 0;
    }else if (f <= 1.5f){
        return 1;
    }else if (f <= 3.0f){
        return 2;
    }else if (f <= 3.3f){
        return 3;
    }else{
        return 4;
    }
}

//根据步数换算成每分钟消耗卡路里
+ (CGFloat)caloriesState:(int)sec step:(int)steps{
    int motion = [Utils motionState:sec step:steps];
    if (motion == 0) {
        return 1;
    }else if(motion == 1){
        return 4;
    }else if(motion == 2){
        return 9;
    }else if(motion == 3){
        return 11;
    }else{
        return 12;
    }
}

//根据速度换算成每分钟消耗卡路里
+ (CGFloat)caloriesFromSpeed:(double)dis time:(double)ts{
    if (ts < 0.1) {
        return 0;
    }
    CGFloat speed = dis/ts;
    if (speed < 0.1) {
        return 1*ts/60.0;
    }else if(speed <= 4/3.6){
        return 4*ts/60.0;
    }else if(speed <= 8/3.6){
        return 9*ts/60.0;
    }else if(speed < 9/3.6){
        return 11*ts/60.0;
    }else{
        return 12*ts/60.0;
    }
}

+ (NSMutableAttributedString*)paragraphSpace:(int)lineSpace attrString:(NSString*)str{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    return attributedString;
}


+ (void)saveSandbox:(id)value key:(NSString *)key{
    if ( key != nil ) {
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+(id)getSandbox:(NSString *)key{
    if (key == nil) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
+ (void)removeSandbox:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}


#pragma mark - archiver functions
//保存自定义对象
+ (BOOL)saveArchiver:(id)value forPath:(NSString *)path{
    return [NSKeyedArchiver archiveRootObject:value toFile:path];
}
+ (id)getArchiver:(NSString *)path{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}


@end
