//
//  ViewController.m
//  test
//
//  Created by 刘渊 on 2017/12/6.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+JJKAlertActionFont.h"

@interface ViewController ()<UIActionSheetDelegate>
@property (nonatomic,strong) UIActionSheet *actionSheet;

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

#pragma mark - 懒加载
- (UIActionSheet *)actionSheet
{
    if(_actionSheet == nil)
    {
        _actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"早餐前", @"早餐后", @"午餐前", @"午餐后", @"晚餐前", @"晚餐后", @"睡前", @"凌晨", nil];
    }
    
    return _actionSheet;
}


- (IBAction)clickAction:(id)sender {
    
    if([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        NSArray *titles = @[@"早餐前", @"早餐后", @"午餐前", @"午餐后", @"晚餐前", @"晚餐后", @"睡前", @"凌晨"];
        
        [self addActionTarget:alert titles:titles];
        [self addCancelActionTarget:alert title:@"取消"];
        
        // 会更改UIAlertController中所有字体的内容（此方法有个缺点，会修改所以字体的样式）
        UILabel *appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
        UIFont *font = [UIFont systemFontOfSize:15];
        [appearanceLabel setAppearanceFont:font];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        [self.actionSheet showInView:self.view];
    }
    
}


// 添加其他按钮
- (void)addActionTarget:(UIAlertController *)alertController titles:(NSArray *)titles
{
    for (NSString *title in titles) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.btn setTitle:action.title forState:UIControlStateNormal];
        }];
//        [action setValue:[UIColor colorWithHexColor:@"#2a2a2a"] forKey:@"_titleTextColor"];
        [action setValue:[UIColor redColor] forKey:@"_titleTextColor"];
        [alertController addAction:action];
    }
}

// 取消按钮
- (void)addCancelActionTarget:(UIAlertController *)alertController title:(NSString *)title
{
    UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
//    [action setValue:[UIColor colorWithHexColor:@"#7d7d7d"] forKey:@"_titleTextColor"];
    [action setValue:[UIColor yellowColor] forKey:@"_titleTextColor"];
    [alertController addAction:action];
}

// iOS8.0之前可用
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    for (UIView *view in actionSheet.subviews) {
        UIButton *btn = (UIButton *)view;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        if([[btn titleForState:UIControlStateNormal] isEqualToString:@"取消"])
        {
            [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
//            [btn setTitleColor:[UIColor colorWithHexColor:@"#7d7d7d"] forState:UIControlStateNormal];
        }
        else
        {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
