//
//  UIView+Addition.m
//  MyOwnKeyChainWrapper
//
//  Created by 刘渊 on 2018/1/11.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center=self.center;
    center.x=centerX;
    self.center=center;
}
- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center=self.center;
    center.y=centerY;
    self.center=center;
}
- (CGFloat)centerY{
    return self.center.y;
}

- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}
- (CGPoint)orign{
    return self.frame.origin ;
}
- (void)setOrign:(CGPoint)orign{
    CGRect frame = self.frame;
    frame.origin = orign;
    self.frame = frame;
}
- (CGSize)size{
    return self.frame.size;
}
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGFloat)screenx{
    return [UIScreen mainScreen].bounds.size.width;
}
- (CGFloat)screeny{
    return [UIScreen mainScreen].bounds.size.height;
}
- (CGRect)screenRect{
    return [UIScreen mainScreen].bounds;
}
- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)setLayerCorner:(CGFloat)layerCorner{
    self.layer.cornerRadius = layerCorner;
    self.layer.masksToBounds = YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}
@end
