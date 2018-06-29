//
//  DashLineViewUtil.m
//  dashLineViewDemo
//
//  Created by 刘渊 on 2018/5/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "DashLineViewUtil.h"

@implementation DashLineViewUtil{
    CGFloat fdashLength;
    UIColor *lineCol;
    int t;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //默认宽度和颜色
        fdashLength = 3;
        lineCol = [UIColor blackColor];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setFDashLength:(CGFloat)fDashLength{
    fdashLength = fDashLength;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor{
    lineCol = lineColor;
    [self setNeedsDisplay];
}

- (void)setType:(int)type{
    t = type;
}

- (void)drawRect:(CGRect)rect{
    
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    if (t == 1) {
        CGContextSetStrokeColorWithColor(context, lineCol.CGColor);
    }else{
        CGFloat partren[] = {fdashLength,fdashLength};
        if (fdashLength<2) {
            partren[1] = 2.0;
        }
        CGContextSetStrokeColorWithColor(context, lineCol.CGColor);
        CGContextSetLineDash(context, 0, partren , 2); //画虚线
    }
    
    if (t == 2) {
        CGContextSetLineWidth(context,self.frame.size.width);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, 0, self.frame.size.height);
        CGContextStrokePath(context);
    }else{
        CGContextSetLineWidth(context,self.frame.size.height);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, self.frame.size.width, 0);
        CGContextStrokePath(context);
    }
    
    /*
     context – 绘图上下文
     phase - 稍后再说
     lengths – 指明虚线是如何交替绘制，具体看例子
     count – lengths数组的长度
     
     lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
     如果把lengths值改为｛10, 20, 10｝，则表示先绘制10个点，跳过20个点，绘制10个点，跳过10个点，再绘制20个点，
     
     phase参数表示在第一个虚线绘制的时候跳过多少个点，举例说明：
     
     float lengths[] = {10,5};
     CGContextSetLineDash(context, 0, lengths, 2);
     CGContextMoveToPoint(context, 0.0, 20.0);
     CGContextAddLineToPoint(context, 310.0, 20.0);
     CGContextStrokePath(context);
     
     CGContextSetLineDash(context, 5, lengths, 2);
     CGContextMoveToPoint(context, 0.0, 40.0);
     CGContextAddLineToPoint(context, 310.0, 40.0);
     CGContextStrokePath(context);
     
     CGContextSetLineDash(context, 8, lengths, 2);
     CGContextMoveToPoint(context, 0.0, 60.0);
     CGContextAddLineToPoint(context, 310.0, 60.);
     CGContextStrokePath(context);
     
     由于lengths值为｛10，5｝，第一条线就是绘制10，跳过5，反复绘制。
     第二条线的phase值为5，则首先绘制【10减去5】，再跳过5，绘制10，反复绘制。
     第三条给也如此，先绘制2，再跳过5，如此反复。
     */
    
    
}

@end
