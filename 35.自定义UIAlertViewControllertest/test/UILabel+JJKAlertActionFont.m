//
//  UILabel+JJKAlertActionFont.m
//  test
//
//  Created by 刘渊 on 2017/12/6.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "UILabel+JJKAlertActionFont.h"

@implementation UILabel (JJKAlertActionFont)

- (void)setAppearanceFont:(UIFont *)appearanceFont
{
    if(appearanceFont)
    {
        [self setFont:appearanceFont];
    }
}


- (UIFont *)appearanceFont
{
    return self.font;
}

@end
