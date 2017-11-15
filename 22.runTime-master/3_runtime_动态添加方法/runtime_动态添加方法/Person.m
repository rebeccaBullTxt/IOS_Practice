//
//  Person.m
//  runtime_动态添加方法
//
//  Created by 刘渊 on 2017/9/7.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person


//不带参数:
/*
 // 默认一个方法都有两个参数,self,_cmd,隐式参数
 // self:方法调用者
 // _cmd:调用方法的编号
 */

//随便一个函数入口
void eatAAA(id self,SEL _cmd){
    NSLog(@"调用eat %@ %@",self,NSStringFromSelector(_cmd));
}


/*
 带参数:  param1隐式参数
 void aaaa(id self, SEL _cmd, id param1)
 {
 
 NSLog(@"调用eat %@ %@ %@",self,NSStringFromSelector(_cmd),param1);
 }

 
 */



//动态添加方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    // 动态添加方法,首先实现这个resolveInstanceMethod
    // resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
    // resolveInstanceMethod作用:就知道哪些方法没有实现,从而动态添加方法
    // sel:没有实现方法
    
//    IMP:方法实现,函数入口
    
    NSLog(@"%@",NSStringFromSelector(sel));
    
    //动态添加eat方法
//    if ([NSStringFromSelector(sel) isEqualToString:@"eat"]) {}
    if (sel == @selector(eat)) {
        
        //给类添加方法
        class_addMethod(self, sel, (IMP)eatAAA, "v@:");
        
        return YES;
    }
    
    
    /*
     带参数:
     if (sel == @selector(eat:)) {
     
     //给类添加方法
     class_addMethod(self, sel, (IMP)aaaa, "v@:@");
     
     return YES;
     }
     
     */
    
    return [super resolveInstanceMethod:sel];

}


//带参数:

@end
