//
//  Utils.h
//  attribute_text_functions
//
//  Created by 刘渊 on 2018/1/1.
//  Copyright © 2018年 刘渊. All rights reserved.
//

//#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface Utils : NSObject

//+ (NSMutableAttributedString *) getAttributeString:(NSString *) strtext fontName:(NSString*) fontname fontSize:(CGFloat)fontsizes;

+ (NSMutableAttributedString *)getAttributeString:(NSString *)strtext fontName:(NSString *)fontName fontSize:(CGFloat)fontsizes color:(UIColor *)color;


/**
 更新需要过滤掉的文字

 @param text 文本内容
 @param attr 需要属性化的文字
 @param font 字体
 @param color 颜色
 @return 属性文字
 */
+ (NSMutableAttributedString *)getAttributeString:(NSString*)text attr:(NSString*)attr font:(UIFont*)font color:(UIColor*)color;


/**
 要设置很多文字

 @param strtext 文本内容
 @param arrtext 需要属性化的文字集合
 @param fontname 字体
 @param fontsizes 大小
 @param color 颜色
 @return 属性文字
 */
+ (NSMutableAttributedString *)getTargetAttributeString:(NSString*) strtext target:(NSArray *) arrtext fontName:(NSString*) fontname fontSize:(CGFloat)fontsizes color:(UIColor *) color;
@end
