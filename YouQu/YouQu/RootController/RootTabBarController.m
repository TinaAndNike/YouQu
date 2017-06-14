//
//  RootTabBarController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RootTabBarController.h"
#import "RootNavController.h"
#import "TabBarView.h"
#define CUSTOM_TABBAR 1


@interface RootTabBarController ()<TabBarViewDelegate>
    
@property (nonatomic, strong)TabBarView * tabBarView;

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildeController];
    [self createTabBarBtn];
}

- (void)buildeController {

    NSMutableArray * arrForVC = [[NSMutableArray alloc] init];
    NSArray * VCArr = @[@"HomeViewController",@"CommunityViewController",@"ShoppingViewController",@"MineViewController"];
    for (int i = 0; i < VCArr.count; i++) {
        
        Class cl = NSClassFromString(VCArr[i]);
        UIViewController * vc = [[cl alloc] init];
        RootNavController * nav = [[RootNavController alloc] initWithRootViewController:vc];
        [arrForVC addObject:nav];
    }
    self.viewControllers = arrForVC;
}

- (void)createTabBarBtn {
    
    //删除原有tabBar视图上的item
    CGRect rect = self.tabBar.frame;
    
    NSLog(@"this is hight---%f",rect.size.height);
    
    [self.tabBar removeFromSuperview];
    
    //添加自己的视图
    _tabBarView = [[TabBarView alloc] init];
    _tabBarView.frame = rect;
    _tabBarView.delegate = self;
    _tabBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarView];
    //创建图片数组
    NSArray * image = @[@"tabBar_image_01",@"tabBar_image_02",@"tabBar_image_03",@"tabBar_image_04"];
    NSArray * selectedImage = @[@"tabBar_Selected_01",@"tabBar_Selected_02",@"tabBar_Selected_03",@"tabBar_Selected_04"];
    NSArray * titleArr = @[@"首页",@"社区",@"购物车",@"我的"];
    for (int i = 0; i < self.viewControllers.count; i++) {
        
        UIImage * btnBg = [UIImage imageNamed:image[i]];
        UIImage * btnSecetedBg =[UIImage imageNamed:selectedImage[i]];
        [_tabBarView addButtonWithImage:nil selectedImage:nil andBG:btnBg andSelectedBG:btnSecetedBg andTitle:titleArr[i]];
    }
}
    
//实现代理方法
- (void)tabBarView:(TabBarView *)tabBarView selectedFrom:(NSInteger)from To:(NSInteger)to {
    
    self.selectedIndex = to;
}

//隐藏自定制tabbar的方法
- (void)settabbarHidden:(BOOL)isHidden {
    
    if (CUSTOM_TABBAR == NO) {
        
        return;
    }
    if (isHidden) {
        
        [UIView animateWithDuration:0.33 animations:^{
            
            self.tabBarView.frame = CGRectMake(0, SCREEN_HEIGHT, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        }];
        
    }else {
        
        [UIView animateWithDuration:0.33 animations:^{
            
            self.tabBarView.frame = CGRectMake(0, SCREEN_HEIGHT - self.tabBar.frame.size.height, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
        }];
    }
}

@end
