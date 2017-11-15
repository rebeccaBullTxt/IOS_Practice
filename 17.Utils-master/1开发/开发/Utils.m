//
//  Utils.m
//  开发
//
//  Created by 刘渊 on 2017/9/28.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import "Utils.h"
#import "MBProgressHUD.h"
#define DeviceVersion ([[[UIDevice currentDevice] systemVersion] floatValue])


@implementation Utils

+ (CGSize)textSize:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    
    CGSize size;
        
    //计算文本的大小
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    
    /*
     
     maxSize:文本绘制时占据的矩形块  就是给定的最大值
     文本绘制时的附加选项
     NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
     */
        
    size = [text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    // iOS7_API_根据文字 字数动态确定Label宽高
    
    
    
    return size;
}

+ (NSString *)stringToInt:(int)value{
    
    return [NSString stringWithFormat:@"%d",value];
}


#pragma mark - user default fuctions
+ (void)saveSandbox:(id)value key:(NSString *)key{
    if (key != nil) {
        [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

+ (id)getSandbox:(NSString *)key{
    if (key == nil) {
        return nil;
    }
    
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];
}

+ (void)removeSandbox:(NSString *)key{
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

#pragma mark - hud functions
+ (void)showHud:(UIView *)view text:(NSString *)text{
    
    [self showHud:view text:text delay:1.4];
}

+ (void)showHud:(UIView *)view text:(NSString *)text delay:(NSTimeInterval)delay{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.label.text = text;
    if (view.frame.origin.y > 150) {
        hud.yOffset = 20;
    }
    [hud hideAnimated:YES afterDelay:delay];
}

+ (void)showHud:(NSString *)text delay:(NSTimeInterval)delay{
    UIWindow *coverWindow = [[UIApplication sharedApplication].delegate window];
    [self showHud:coverWindow text:text delay:delay];
}

+ (void)showHud:(NSString *)text{
    [self showHud:text delay:1.4];
}

//字符串比较函数
+ (NSComparisonResult)compareString:(NSString *)str1 WithStr2:(NSString *)str2{
//    NSOrderedAscending的意思是：左边的操作对象小于右边的对象。
//    NSOrderedDescending的意思是：左边的操作对象大于右边的对象。
    
    if (str1 == nil) {
        return NSOrderedAscending;
    }else if (str2 == nil){
        return NSOrderedDescending;
    }
    
    NSCharacterSet *charSet  = [NSCharacterSet characterSetWithCharactersInString:@". ,;"];
    NSArray *arr1 = [str1 componentsSeparatedByCharactersInSet:charSet];
    NSArray *arr2 = [str2 componentsSeparatedByCharactersInSet:charSet];
    
    if ([arr1 count] < 2 || [arr2 count] < 2) {
        return NSOrderedSame;
    }
    
    if ([arr1[0] integerValue] > [arr2[0] integerValue]) {
        return NSOrderedDescending;
    }else if ([arr1[0] integerValue] < [arr2[0] integerValue]){
        return NSOrderedAscending;
    }else{
        if ( [arr1[1] integerValue] > [arr2 [1] integerValue]) {
            return NSOrderedDescending;
        } else if ( [arr1[1] integerValue] < [arr2 [1] integerValue]) {
            return NSOrderedAscending;
        }
    }
    
    return NSOrderedSame;
}

//去除首尾的空格
+ (NSString *)stringTrimingWhiteSpaceCharacters:(NSString *)trimmingStr{
    
    NSString *strResult = [trimmingStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return strResult;
}

//去除连续的指定的字符串
+ (NSString *)string:(NSString *)str TrimingInsetCharacters:(NSString *)trimmingStr{
    
    id cs = [NSCharacterSet characterSetWithCharactersInString:trimmingStr];
    NSString *strResult = [str stringByTrimmingCharactersInSet:cs];
    return strResult;
}

//去除任意的字符集  连续的不连续的都可以
+ (NSString *)string:(NSString *)str TrimingStr:(NSString *)trimingStr{
    
    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:trimingStr];
    NSMutableString *theStr = [NSMutableString stringWithString:str];
    
    NSString *strResult = [Utils clearIllegitCharacters:theStr andCharacterSet:cs];
    return strResult;
}

//过滤掉敏感字符串
+ (NSString *)clearIllegitCharacters:(NSMutableString *)originString andCharacterSet:(NSCharacterSet *)cs{
    
    NSString *strResult = nil;
    NSRange range2;
    
    do {
        
        range2 = [originString rangeOfCharacterFromSet:cs options:NSLiteralSearch];
        if (range2.location != NSNotFound) {
            //删除range2代表的字符
//            [originString deleteCharactersInRange:range2];
            //用*替换掉range2代表的字符
            [originString replaceCharactersInRange:range2 withString:@"*"];
        }
        
    } while (range2.location != NSNotFound);
    // range2.location不为NSNotFound,就执行do{},直至等于NSNotFound,就不再执行do{}

    //可变字符串转为不可变
    strResult = [[NSString alloc]initWithString:originString];
    return strResult;
}

//#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
//字符串分割1
/*
 原始字符串
 允许出现的字符
 */
- (NSString *)originalString:(NSString *)str1 WithAllowStr:(NSString *)allowStr{

    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:allowStr] invertedSet];
    
    // 将str按cs分割成数组(既然能分割,说明cs是str的子集,并且cs中的字符不会在str中出现,相当于str中删除了这些字符),最后将数组按照@""分割成字符串
    NSString *filtered = [[str1 componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    return filtered;
}


/*
 NSString *str = @"简书作者:Coder#Z@b";
 //按@"#简书@作者:"将str分离成数组,然后将数组按@"-"拼接成字符串
 NSString *filtered = [[str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"#简书@作者:"]] componentsJoinedByString:@"-"];
 NSLog(@"%@", filtered);
 */
//字符串分割方式2 相当于去除了某些内容
/*
 原始字符串
 需要删除的字符串
 用来连接的字符串
 */
- (NSString *)originalString:(NSString *)str1 andLimitedStr:(NSString *)limited WithStrConnect:(NSString *)connectStr{
    
    //剔除掉某些字符,将str分离成数组,再将数组按@"-"拼接成字符串
    NSString *filtered = [[str1 componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:limited]] componentsJoinedByString:@"-"];
    return filtered;
    
}

#pragma  mark - screen capture functions
+ (UIImage *)screenShot:(UIView *)view{
    UIImage *img;
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)screenShot:(UIView *)view withSize:(CGSize)frameSize{
//    CGRect frameBak = view.frame;
    view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, frameSize.width, frameSize.height);
    UIGraphicsBeginImageContextWithOptions(frameSize, NO, 0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
//    view.frame = frameBak;
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
    return viewImage;
}

#pragma mark - netWork
+ (NetworkStatus)currentNetWorkType{
    
    Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    //开始网络连接状态监听
    [r startNotifier];
    
    return [r currentReachabilityStatus];
}

@end
