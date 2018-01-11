//
//  UIFont+Addtions.h
//  Cling_ios
//
//  Created by Roffa's Mac on 16/4/13.
//
//

#import <UIKit/UIKit.h>

#define FONT_SIZE_72   72.0f
#define FONT_SIZE_65   65.0f
#define FONT_SIZE_40   40.0f
#define FONT_SIZE_36   36.0f
#define FONT_SIZE_32   32.0f
#define FONT_SIZE_30   30.0f
#define FONT_SIZE_26   26.0f
#define FONT_SIZE_23   23.0f
#define FONT_SIZE_22   22.0f
#define FONT_SIZE_24   24.0f
#define FONT_SIZE_25   25.0f
#define FONT_SIZE_14   14.0f
#define FONT_SIZE_13   13.0f
#define FONT_SIZE_18   18.0f
#define Twenty_Size_Font 20.0f
#define NICKNAME_FONT_SIZE   15.0f
#define TITLE_FONT_SIZE      16.0f
#define Forteen_Font_Size    14.0f
#define Thirteen_Font_Size   13.0f
#define TEXT_FONT_SIZE       12.0f
#define Elevn_Font_Size      11.0f
#define TIME_FONT_SIZE       10.0f
#define Nine_Font_Size        9.0f

@interface UIFont (Addtions)
+ (instancetype)helveticFontOfSize:(CGFloat)size;
+ (instancetype)sysFontOfSize:(CGFloat)size;
+ (instancetype)HelveticaNeueBoldFontOfSize:(CGFloat)size;
@end
