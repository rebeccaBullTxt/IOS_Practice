//
//  AnimalFactory.h
//  FactoryDemo
//
//  Created by 刘渊 on 2018/5/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
@interface AnimalFactory : Animal
- (Animal *)createAnimal;

//+ (Dog *)createDog;
//+ (Cat *)createCat;
@end
