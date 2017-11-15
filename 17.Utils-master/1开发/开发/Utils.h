//
//  Utils.h
//  开发
//
//  Created by 刘渊 on 2017/9/28.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface Utils : NSObject

//计算文字的高
+(CGSize)textSize:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;

//int转换为字符串
+(NSString *)stringToInt:(int)value;

//保存到沙盒
+ (void)saveSandbox:(id)value key:(NSString *)key;
//沙盒中读取
+ (id)getSandbox:(NSString *)key;
//删除沙盒内容
+ (void)removeSandbox:(NSString *)key;

+ (void)showHud:(UIView *)view text:(NSString *)text;
+ (void)showHud:(UIView *)view text:(NSString *)text delay:(NSTimeInterval) delay;
+ (void) showHud:(NSString *)text delay:(NSTimeInterval) delay;
+ (void) showHud:(NSString *)text;

//字符串比较
+ (NSComparisonResult)compareString:(NSString *)str1 WithStr2:(NSString *)str2;

//去除掉首尾的空格
+ (NSString *)stringTrimingWhiteSpaceCharacters:(NSString *)trimmingStr;

//去除连续的指定的字符串
+ (NSString *)string:(NSString *)str TrimingInsetCharacters:(NSString *)trimmingStr;

//去除任意的字符集  连续的不连续的都可以
+ (NSString *)string:(NSString *)str TrimingStr:(NSString *)trimingStr;

//字符串分割
- (NSString *)originalString:(NSString *)str1 WithAllowStr:(NSString *)allowStr;
//字符串分割 并以某种方式拼接
- (NSString *)originalString:(NSString *)str1 andLimitedStr:(NSString *)limited WithStrConnect:(NSString *)connectStr;

//屏幕截图
+ (UIImage *)screenShot:(UIView *)view;
+ (UIImage *)screenShot:(UIView *)view withSize:(CGSize)frameSize;

+ (NetworkStatus)currentNetWorkType;


@end
