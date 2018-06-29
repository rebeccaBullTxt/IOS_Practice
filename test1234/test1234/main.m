//
//  main.m
//  test1234
//
//  Created by 刘渊 on 2018/2/7.
//  Copyright © 2018年 LiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int d = 160;
        NSLog(@"公里数%d,%f,%.2f",d,d/1000.0-0.004,d/1000.0-0.004);
        
        float b =160;
        NSLog(@"公里数%d,%f,%.2f",b,b/1000.0-0.005,b/1000.0-0.005);
        
        double c = 160;
        NSLog(@"公里数%d,%f,%.2f",c,c/1000.0-0.005,c/1000.0-0.005);
        
        

//        for (int i = 0; i < 100000; i++) {
////            double a = 140.0/1000;
//            NSLog(@"%.2f",140.0/1000-0.005);
//
//        }
//        NSLog(@"Hello, World!");
    }
    return 0;
}
