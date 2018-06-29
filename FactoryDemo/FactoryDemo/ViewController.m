//
//  ViewController.m
//  FactoryDemo
//
//  Created by 刘渊 on 2018/5/22.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Cat.h"
#import "AnimalFactory.h"
#import "DogFactory.h"
#import "CatFactory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    AnimalFactory *dogFactory=[[DogFactory alloc]init];
    
    Animal *animal1=[dogFactory createAnimal];
    [animal1 laugh];
    
    Animal *animal2=[dogFactory createAnimal];
    [animal2 laugh];
    
    Animal *animal100=[dogFactory createAnimal];
    [animal100 laugh];
    
//    Dog *dog = [AnimalFactory createDog];
//    Cat *cat = [AnimalFactory createCat];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
