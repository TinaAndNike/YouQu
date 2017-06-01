//
//  HomeViewController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

//nav透明
@property (nonatomic, strong)UIImageView * transImageView;

@property (nonatomic, strong)UIImageView * homeNavImageView;

@property (nonatomic, strong)UIImageView * leftBtnImageView;

@property (nonatomic, strong)UIImageView * rightBtnImageView;

@property (nonatomic, strong)UIBarButtonItem * rightItem;

@property (nonatomic, assign)BOOL isAlpah;

//scrollView
@property (nonatomic, strong)UIScrollView * headScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"首页";
    //建造tableView
    [self buildeTableView];
    [self buildeScrollView];
    //透明nav
    [self lucencyNavigation];
}

#pragma mark - 隐藏Nav和页面将要出现和消失
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - 自定制Nav
- (void)lucencyNavigation {

    _transImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _transImageView.image = [UIImage imageNamed:@"transImage"];
    _transImageView.userInteractionEnabled = YES;
    [self.view addSubview:_transImageView];
    
    _homeNavImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _homeNavImageView.image = [UIImage imageNamed:@"home_navigation"];
    _homeNavImageView.userInteractionEnabled = YES;
    [_transImageView addSubview:_homeNavImageView];
    
    _leftBtnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 28, 28)];
    _leftBtnImageView.image = [UIImage imageNamed:@"nav_left_image"];
    _leftBtnImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * navImageTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navImageTapClick:)];
    [_leftBtnImageView addGestureRecognizer:navImageTap];
    [_transImageView addSubview:_leftBtnImageView];
    
    _rightBtnImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 48, 20, 28, 28)];
    _rightBtnImageView.image = [UIImage imageNamed:@"nav_right_image"];
    [_rightBtnImageView addGestureRecognizer:navImageTap];
    [_transImageView addSubview:_rightBtnImageView];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_transImageView addSubview:btn];
}

- (void)btnClick:(UIButton *)btn {

    NSLog(@"我标题点击了");
}

- (void)navImageTapClick:(UITapGestureRecognizer *)tap {

    if (tap.view == _leftBtnImageView) {
        
        NSLog(@"我是右边的");
        
    } else {
    
        NSLog(@"我是左边的");
    }
}

#pragma mark - 建造tableView
- (void)buildeTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT + 20) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor grayColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 50;
    //偏移180像素
    _tableView.contentInset = UIEdgeInsetsMake(180, 0, 0, 0);
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

#pragma mark - 建造ScrollView
- (void)buildeScrollView {

    _headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -180, SCREEN_WIDTH, 180)];
    _headScrollView.showsHorizontalScrollIndicator = NO;
    _headScrollView.pagingEnabled = YES;
    _headScrollView.backgroundColor = [UIColor orangeColor];
    [_tableView addSubview:_headScrollView];
    
}
#define mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"Tina";
    return cell;
}

//调用tableView的滑动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //if (scrollView == _tableView) {
        
        CGFloat minAlpah = -64;
        CGFloat maxAlpah = 20;
        CGFloat scrollViewY = scrollView.contentOffset.y;
        CGFloat imageViewAlpah = (scrollViewY - minAlpah) / (maxAlpah - minAlpah);
        _homeNavImageView.alpha = scrollView.contentOffset.y / 200;
        
        NSLog(@"------%lf-----%lf------%lf",scrollView.contentOffset.y,imageViewAlpah,_headScrollView.frame.origin.y);
    //}
}

@end
