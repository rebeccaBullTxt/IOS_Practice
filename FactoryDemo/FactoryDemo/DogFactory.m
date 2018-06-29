//
//  DogFactory.m
//  FactoryDemo
//
//  Created by 刘渊 on 2018/5/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "DogFactory.h"

@implementation DogFactory
- (Animal *)createAnimal{
    return [[Dog alloc]init];
}
@end
