//
//  Utils.m
//  attribute_text_functions
//
//  Created by 刘渊 on 2018/1/1.
//  Copyright © 2018年 刘渊. All rights reserved.
//

#import "Utils.h"
#import "Constants.h"

@implementation Utils

//+ (NSMutableAttributedString *)getAttributeString:(NSString *)strtext fontName:(NSString *)fontname fontSize:(CGFloat)fontsizes{
//
//    NSString *strSubText =
//
//}

+ (NSMutableAttributedString *)getAttributeString:(NSString *)strtext fontName:(NSString *)fontName fontSize:(CGFloat)fontsizes color:(UIColor *)color{
    
    if (strtext == nil) {
        return nil;
    }
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:strtext];
    
    if (![strtext isKindOfClass:[NSString class]]) {
        LOG(@"WARNING: %@",strtext);
        return attrStr;
    }
    
    NSArray *arrayTarget = @[@"公里",@"小时"];
    NSRange r = [strtext rangeOfString:@":"];
    
    NSString *strNew = strtext;
    if (r.length > 0) {
        //过滤掉冒号前文字，防止文字与需要属性化文字相同
        strNew = [strtext substringFromIndex:r.location];
    }
    
    NSRange newRange;
    for (NSString *strTarget in arrayTarget) {
        NSRange range = [strNew rangeOfString:strTarget];
        if (range.length <= 0) {
            continue;
        }
        
        newRange = range;
        if (r.length > 0) {
            newRange.location = r.location + range.location;
        }
        
        [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:fontsizes] range:newRange];
        
        if (color != nil) {
            [attrStr addAttribute:NSForegroundColorAttributeName value:color range:newRange];
        }
    }
    return attrStr;
}

+ (NSMutableAttributedString *)getAttributeString:(NSString*)text attr:(NSString*)attr font:(UIFont*)font color:(UIColor*)color{
    if (text == nil) {
        return nil;
    }
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text ];
    NSRange rang = [text rangeOfString:attr];
    if (rang.length < 1) {
        return nil;
    }
    
    if (color != nil) {
        [attrStr addAttributes:@{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:color
                                 }
                         range:rang];
    }else{
        [attrStr addAttributes:@{
                                 NSFontAttributeName:font
                                 }
                         range:rang];
    }
    
    return attrStr;
}

+ (NSMutableAttributedString *)getTargetAttributeString:(NSString *)strtext target:(NSArray *)arrtext fontName:(NSString *)fontname fontSize:(CGFloat)fontsizes color:(UIColor *)color{
    NSMutableAttributedString * attrStr = nil;
    
    if ( arrtext != nil ) {
        for ( NSString * strTarget in arrtext ) {
            NSRange rang = [strtext rangeOfString:strTarget];
            if (rang.length <= 0) {
                continue;
            }
            
            if ( attrStr == nil ) {
                attrStr = [[NSMutableAttributedString alloc] initWithString:strtext];
            }
            
            [attrStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontname size:fontsizes] range:rang];
            
            if (color != nil) {
                [attrStr addAttribute:NSForegroundColorAttributeName value:color range:rang];
            }
        }
    }
    return attrStr;
}



@end
