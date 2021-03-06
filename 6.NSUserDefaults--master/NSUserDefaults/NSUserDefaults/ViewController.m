//
//  ViewController.m
//  NSUserDefaults
//
//  Created by 刘渊 on 2017/10/9.
//  Copyright © 2017年 刘渊. All rights reserved.
/*
 如果有一些设置你希望用户即使升级后还可以继续使用，比如玩游戏时得过的最高分、喜好和通知设置、主题颜色甚至一个用户头像，那么你可以使用NSUserDefaults来存储这些信息
 
 图片，可以先将其归档为NSData类型，再存入plist文件
 这些偏好记录在应用包的plist文件中
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //存
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"jack" forKey:@"firstName"];
    [defaults setInteger:10 forKey:@"Age"];
    
    UIImage *image =[UIImage imageNamed:@"somename"];
    NSData *imageData = UIImageJPEGRepresentation(image, 100);//把image归档为NSData
    [defaults setObject:imageData forKey:@"image"];
    
    [defaults synchronize];
//方法synchronise是为了强制存储,其实并非必要，因为这个方法会在系统中默认调用，但是你确认需要马上就存储
    
    
    [self setup];
   
}

- (void)setup{
    
    //读
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *firstName = [defaults objectForKey:@"firstName"];
    NSInteger age = [defaults integerForKey:@"Age"];
    
    NSData *imageData = [defaults dataForKey:@"image"];
    UIImage *image = [UIImage imageWithData:imageData];
    
    
//    这里NSInteger没有星号，因为NSInteger根据系统是64位还是32位来判断自身是long还是int类型，并且它也不是一个标准Objective-C对象。
    
    /*
     由上边的例子可以看到一个方法-setInteger:,这跟常用的-setObject：相比设置类型更明确。其实，NSUserDefaults提供了若干简便方法可以存储某些常用类型的值，例如
     - setBool:forKey:
     - setFloat:forKey:
     - setInteger:forKey:
     - setDouble:forKey:
     - setURL:forKey:
     */
    
    /*
     BOOL showTutorialOnLaunch = [[NSUserDefaults standardUserDefaults] boolForKey:@"ShowTutorial"];
     这种情况下，当key值@“ShowTutorial”已设置后会运行正确。但如果默认数据库没有这个key的默认值时，将会返回NO，这或许就不一定是你需要的值了，因为无法区分NO和no value，前一段所提到的简便方法大多有这种问题。
     解决方式：使用registerDefaults:方法
     首先创建一个包含用户偏好设置信息的DefaultPreferences.plist文件，添加到target中。在运行时，app就可以加载这个文件并且把内容传到registerDefaults :
     
     NSURL *defaultPrefsFile = [[NSBundle mainBundle]
     URLForResource:@"DefaultPreferences" withExtension:@"plist"];
     NSDictionary *defaultPrefs = [NSDictionary dictionaryWithContentsOfURL:defaultPrefsFile];
     [[NSUserDefaults standardUserDefaults] registerDefaults:defaultPrefs];
     
     注意需要在每次启动app并且没有在user defaules中读取数据的时候调用以上方法，因为registerDefaults:不能把这些默认数据存储到硬盘上，所以application:didFinishLaunchingWithOptions是最合适的地方。
     这样做的原因是：默认情况下，应用域是空的，没见键也没有值。当应用第一次设置某项用户偏好设置的值时，相应的值会通过指定的键加入应用域。当通过NSUserDefaults获取某项用户偏好设置的值时，NSUserDefaults会先在应用域中查找，如果找到了值，NSUserDefaults就会返回这个值。如果没有找到，NSUserDefaults就会在注册域中查找并返回默认值。
     
     
     域
     
     user defaults数据库中其实是由多个层级的域组成的，当你读取一个键值的数据时，NSUserDefaults从上到下透过域的层级寻找正确的值，不同的域有不同的功能，有些域是可持久的，有些域则不行。
     
     应用域（application domain）是最重要的域，它存储着你app通过NSUserDefaults set...forKey添加的设置。
     注册域（registration domain）仅有较低的优先权，只有在应用域没有找到值时才从注册域去寻找。
     全局域（global domain）则存储着系统的设置
     语言域（language-specific domains）则包括地区、日期等
     参数域（ argument domain）有最高优先权
     
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
