//
//  LYListViewController.m
//  masonry使用6-29
//
//  Created by 刘渊 on 2018/6/29.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

#import "LYListViewController.h"
#import "BaseViewController.h"
#import "BaseView.h"
#import "UpdateView.h"
#import "RemakeView.h"
@interface LYListViewController ()
@property (nonatomic, strong) NSArray *exampleControllers;

@end

@implementation LYListViewController

- (instancetype)init{
    if (self = [super init]) {
        
        self.title = @"LYExamples";
        self.exampleControllers = @[
                                    [[BaseViewController alloc] initWithTitle:@"Basic"
                                                                          viewClass:BaseView.class],
                                    [[BaseViewController alloc] initWithTitle:@"Update Constraints"
                                                                          viewClass:UpdateView.class],
                                    [[BaseViewController alloc] initWithTitle:@"Remake Constraints"
                                                                          viewClass:RemakeView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Using Constants"
//                                                                          viewClass:MASExampleConstantsView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Composite Edges"
//                                                                          viewClass:MASExampleSidesView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Aspect Fit"
//                                                                          viewClass:MASExampleAspectFitView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Basic Animated"
//                                                                          viewClass:MASExampleAnimatedView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Debugging Helpers"
//                                                                          viewClass:MASExampleDebuggingView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Bacony Labels"
//                                                                          viewClass:MASExampleLabelView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"UIScrollView"
//                                                                          viewClass:MASExampleScrollView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Array"
//                                                                          viewClass:MASExampleArrayView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Attribute Chaining"
//                                                                          viewClass:MASExampleAttributeChainingView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Margins"
//                                                                          viewClass:MASExampleMarginView.class],
//                                    [[MASExampleViewController alloc] initWithTitle:@"Views Distribute"
//                                                                          viewClass:MASExampleDistributeView.class],
                                    ];
        
        return self;
    }else{
        return nil;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.exampleControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
    }
    UIViewController *vcs = self.exampleControllers[indexPath.row];
    cell.textLabel.text = vcs.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc = self.exampleControllers[indexPath.row];
    vc.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
