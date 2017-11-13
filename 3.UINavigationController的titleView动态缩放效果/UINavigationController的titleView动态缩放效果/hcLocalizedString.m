//
//  hcLocalizedString.m
//  Cling_ios
//
//  Created by 张晓行 on 2016/12/19.
//
//

#import "hcLocalizedString.h"

@implementation hcLocalizedString
static NSBundle *bundle = nil;
static short iLocalizeLanguage = 0;

+ (NSString *)getLocalizedString:(NSString*)key{
    if(iLocalizeLanguage == 0){ //英文
        return [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"en" ofType:@"lproj"]] localizedStringForKey:key value:nil table:nil];
    }else if(iLocalizeLanguage == 1){  //简体中文
        return [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"zh-Hans" ofType:@"lproj"]] localizedStringForKey:key value:nil table:nil];
    }else if(iLocalizeLanguage == 2){ //繁体中文
        return [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"zh-Hant" ofType:@"lproj"]] localizedStringForKey:key value:nil table:nil];
    }else{
        return  NSLocalizedString(key,comment);
    }

}
+(void)initUserLanguage{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:@"userLanguage"];
    if ([language isKindOfClass:[NSString class]] ) {
        if (language.length > 2) {
            iLocalizeLanguage = 4;
        }else{
            iLocalizeLanguage = [[def valueForKey:@"userLanguage"] intValue];
        }
    }else {
        iLocalizeLanguage = 4;
    }
    
}
+(void)setUserlanguage:(int)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];

    //2.持久化
    [def setValue:[NSString stringWithFormat:@"%d",language] forKey:@"userLanguage"];
    [def synchronize];
    iLocalizeLanguage = language;
}
@end
