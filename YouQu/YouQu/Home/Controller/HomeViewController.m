//
//  HomeViewController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerCell.h"
#import "ClassifyCell.h"
#import "TimeLimitCell.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

//nav透明
@property (nonatomic, strong)UIImageView * transImageView;

@property (nonatomic, strong)UIImageView * homeNavImageView;

@property (nonatomic, strong)UIButton * leftBtn;

@property (nonatomic, strong)UIButton * rightBtn;

@property (nonatomic, strong)UIBarButtonItem * rightItem;

@property (nonatomic, assign)BOOL isAlpah;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"首页";
    //建造tableView
    [self buildeTableView];
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
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 28, 28)];
    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_left_image"] forState:UIControlStateNormal];
    _leftBtn.highlighted = NO;
    [_leftBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_transImageView addSubview:_leftBtn];
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 48, 20, 28, 28)];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"nav_right_image"] forState:UIControlStateNormal];
    _rightBtn.highlighted = NO;
    [_rightBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_transImageView addSubview:_rightBtn];
    
}

- (void)btnClick:(UIButton *)btn {

    NSLog(@"我标题点击了");
}

- (void)navBtnClick:(UIButton *)btn {

    if (btn == _leftBtn) {
        
        NSLog(@"我是右边的");
        
    } else {
    
        NSLog(@"我是左边的");
    }
}

#pragma mark - 建造tableView
- (void)buildeTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, SCREEN_HEIGHT + 20) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor grayColor];
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //bannerCell
    [_tableView registerClass:[BannerCell class] forCellReuseIdentifier:@"bannerCell"];
    //classifyCll
    [_tableView registerClass:[ClassifyCell class] forCellReuseIdentifier:@"classifyCell"];
    //timeLimit
    [_tableView registerClass:[TimeLimitCell class] forCellReuseIdentifier:@"timeLimitCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

#define mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

#pragma mark - Cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        return 180;
    } else if (indexPath.row == 1) {
    
        return 150 * SPHEIGHT;
    } else if (indexPath.row == 2){
    
        return 35;
    } else {
    
        return 50;
    }
}

#pragma mark - Cell复用的方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        BannerCell * bannerCell = [tableView dequeueReusableCellWithIdentifier:@"bannerCell" forIndexPath:indexPath];
        [bannerCell buildeBannerScrollViewWithHigh:180 andImageArr:nil];
        return bannerCell;
    } else if (indexPath.row == 1) {
    
        ClassifyCell * classifyCell = [tableView dequeueReusableCellWithIdentifier:@"classifyCell" forIndexPath:indexPath];
        classifyCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [classifyCell createClassifyBtn];
        return classifyCell;
       
    } else if (indexPath.row == 2) {
    
        TimeLimitCell * timeLimitCell = [tableView dequeueReusableCellWithIdentifier:@"timeLimitCell" forIndexPath:indexPath];
        [timeLimitCell createTimeLimit];
        return timeLimitCell;
    } else {
    
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.text = @"Tina";
        return cell;
    }
}

//调用tableView的滑动方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    _homeNavImageView.alpha = scrollView.contentOffset.y / 200;
    //NSLog(@"------%lf-----%lf",scrollView.contentOffset.y,imageViewAlpah);
}

@end
