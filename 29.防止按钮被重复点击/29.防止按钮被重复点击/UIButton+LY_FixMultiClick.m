//
//  UIButton+LY_FixMultiClick.m
//  29.防止按钮被重复点击
//
//  Created by 刘渊 on 2017/11/29.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "UIButton+LY_FixMultiClick.h"
#import <objc/runtime.h>

/*
 
 @property (nonatomic,assign) NSTimeInterval ly_acceptEventInterval;
 
 @property (nonatomic,assign) NSTimeInterval ly_acceptEventTime;
 */

@implementation UIButton (LY_FixMultiClick)

//采用关联对象的方式,为UIButton添加两个属性
// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

- (NSTimeInterval)ly_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setly_acceptEventInterval:(NSTimeInterval)ly_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(ly_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)ly_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setly_acceptEventTime:(NSTimeInterval)ly_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(ly_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    Method before   = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method after    = class_getInstanceMethod(self, @selector(ly_sendAction:to:forEvent:));
    method_exchangeImplementations(before, after);
}

- (void)ly_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.ly_acceptEventTime < self.ly_acceptEventInterval) {
        return;
    }
    
    if (self.ly_acceptEventInterval > 0) {
        self.ly_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    [self ly_sendAction:action to:target forEvent:event];
    
}


@end
