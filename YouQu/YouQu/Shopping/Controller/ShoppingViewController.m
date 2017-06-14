//
//  ShoppingViewController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ShoppingViewController.h"
#import "ScreenView.h"

@interface ShoppingViewController ()

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RANDOM_COLOR;
    self.title = @"购物车";
    
    [self functwo];
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

- (void)functwo {

    ScreenView * screenView = [ScreenView initScreenView];
    screenView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 49);
    [self.view addSubview:screenView];
    
    [screenView createContent];
}

- (void)funcOne {

    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * 3);
    scrollView.scrollEnabled = YES;
    scrollView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scrollView];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(50, 0, 50, SCREEN_HEIGHT * 2)];
    view.backgroundColor = [UIColor cyanColor];
    [scrollView addSubview:view];
}

@end
