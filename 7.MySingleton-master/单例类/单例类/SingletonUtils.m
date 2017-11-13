/**
 *
 *                 Created by 刘渊 on 2017/10/9.
 *                 Copyright (c) 2017年 刘渊. All rights reserved.
 *
 *                #####################################################
 *                #                                                   #
 *                #                       _oo0oo_                     #
 *                #                      o8888888o                    #
 *                #                      88" . "88                    #
 *                #                      (| -_- |)                    #
 *                #                      0\  =  /0                    #
 *                #                    ___/`---'\___                  #
 *                #                  .' \\|     |# '.                 #
 *                #                 / \\|||  :  |||# \                #
 *                #                / _||||| -:- |||||- \              #
 *                #               |   | \\\  -  #/ |   |              #
 *                #               | \_|  ''\---/''  |_/ |             #
 *                #               \  .-\__  '-'  ___/-. /             #
 *                #             ___'. .'  /--.--\  `. .'___           #
 *                #          ."" '<  `.___\_<|>_/___.' >' "".         #
 *                #         | | :  `- \`.;`\ _ /`;.`/ - ` : | |       #
 *                #         \  \ `_.   \_ __\ /__ _/   .-` /  /       #
 *                #     =====`-.____`.___ \_____/___.-`___.-'=====    #
 *                #                       `=---='                     #
 *                #     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   #
 *                #                                                   #
 *                #               佛祖保佑         永无BUG              #
 *                #                                                   #
 *                #####################################################
 *
 *
 *
 */
//                 单例模式
//


#import "SingletonUtils.h"

@implementation SingletonUtils

//用来保存唯一的单例对象  static 作用是保证_instance仅作用于当前文件,防止外界拿到修改
static SingletonUtils *_sharedInstance = nil;
//或者
static id _instance;

+ (SingletonUtils *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SingletonUtils alloc]init];
    });
    return _sharedInstance;
}

//或者
+ (instancetype)sharedMySingle{
    //防止多次加锁
    if (_sharedInstance == nil) {
        //加锁防止多个线程同时操作
        @synchronized(self){
            if (nil == _instance) {
                _instance = [[self alloc]init];
            }
        }
    }
    return _instance;
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [super allocWithZone:zone];
    });
    return _sharedInstance;
}

//或者
//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    if (nil == _instance) {
//        @synchronized(self){
//            if (nil == _instance) {
//                _instance = [super allocWithZone:zone];
//            }
//        }
//    }
//    return _instance;
//}

// 因为如果通过copy来创建对象，必须是先有一个对象，所以可以直接返回_instance
// 另外如果通过copy来创建对象，必须实现NSCopying协议,所以如果你敲下面代码没有提示的话，先去遵守协议
- (id)copyWithZone:(NSZone *)zone{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

/* MRC下打开一下代码
 
 - (oneway void)release { }
 - (id)retain { return self; }
 - (NSUInteger)retainCount { return 1;}
 - (id)autorelease { return self;}
 */


@end
