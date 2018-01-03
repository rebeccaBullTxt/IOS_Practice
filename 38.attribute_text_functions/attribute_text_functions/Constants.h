//
//  Constants.h
//  attribute_text_functions
//
//  Created by 刘渊 on 2018/1/1.
//  Copyright © 2018年 刘渊. All rights reserved.
//

#ifdef DEBUG

#define LOG(args...)  NSLog(@"%s%d行:%@\n",__FUNCTION__,__LINE__,[NSString stringWithFormat:args]);
//#define LOG(args...)

#else
#endif
