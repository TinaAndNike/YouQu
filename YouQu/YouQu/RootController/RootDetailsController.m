//
//  RootDetailsController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/13.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RootDetailsController.h"

@interface RootDetailsController ()

//创建一个全局tabBar的属性用来调用封装的隐藏tabBar的方法
@property (nonatomic, strong)RootTabBarController * rootBar;

@end

@implementation RootDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _rootBar = (id)self.tabBarController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [_rootBar settabbarHidden:YES];
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
