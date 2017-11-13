//
//  AboutAuthorCell.h
//  UINavigationController的titleView动态缩放效果
//
//  Created by 刘渊 on 2017/11/2.
//  Copyright © 2017年 刘渊. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CellBlock)();

@interface AboutAuthorCell : UITableViewCell

@property (nonatomic,copy) CellBlock selfBlock;

@end
