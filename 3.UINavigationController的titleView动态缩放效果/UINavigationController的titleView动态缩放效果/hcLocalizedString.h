//
//  hcLocalizedString.h
//  Cling_ios
//
//  Created by 张晓行 on 2016/12/19.
//
//
#define hcLocalizedString(key, nil) [hcLocalizedString getLocalizedString:key]

//[[hcLocalizedString bundle] localizedStringForKey:(key) value:@"" table:nil]

#import <Foundation/Foundation.h>

@interface hcLocalizedString : NSObject

+ (NSString *)getLocalizedString:(NSString*)key;

+(void)initUserLanguage;//初始化语言文件

+(void)setUserlanguage:(int)language;//设置当前语言

@end
