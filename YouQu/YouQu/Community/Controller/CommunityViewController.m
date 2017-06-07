//
//  CommunityViewController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "CommunityViewController.h"
#import "BannerCell.h"
#import "TitleCell.h"
#import "HotPostCell.h"

@interface CommunityViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

//nav
@property (nonatomic, strong)UIView * navHeadView;

@property (nonatomic, strong)UIButton * navLeftBtn;

@property (nonatomic, strong)UIButton * navRightBtn;

@property (nonatomic, strong)UIButton * hotPostBtn;

@property (nonatomic, strong)UIButton * circleBtn;

@property (nonatomic, strong)UIView * navLineView;

//ScrollView
@property (nonatomic, strong)UIScrollView * scrollView;

@property (nonatomic, strong)UIView * hotPostView;

@property (nonatomic, strong)UIView * circleView;

//tableView
@property (nonatomic, strong)UITableView * hotPostTableView;

@property (nonatomic, strong)UITableView * circleTableView;

//存储轮播图
@property (nonatomic, strong)NSMutableArray * comBannerArray;
//村粗hotPostImageArray
@property (nonatomic, strong)NSMutableArray * hotStyleOneAry;


@end

@implementation CommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //nav
    [self communityNavigation];
    //scrollView
    [self buildeScrollView];
    //tableView
    [self buildeHotPostTableView];
    [self buildeCircleTableView];
}

#pragma mark - 懒加载
- (NSMutableArray *)comBannerArray {
    
    if (_comBannerArray == nil) {
        
        _comBannerArray = [[NSMutableArray alloc] init];
        for (int i = 1; i < 4; i ++) {
            
            UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"banner_10%d",i]];
            [_comBannerArray addObject:image];
        }
    }
    return _comBannerArray;
}

- (NSMutableArray *)hotStyleOneAry {
    
    if (_hotStyleOneAry == nil) {
        
        _hotStyleOneAry = [[NSMutableArray alloc] init];
        for (int i = 1; i < 4; i ++) {
            
            UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"styleOne_0%d.JPG",i]];
            [_hotStyleOneAry addObject:image];
        }
    }
    return _hotStyleOneAry;
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
- (void)communityNavigation {
    
    _navHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    _navHeadView.backgroundColor = HEXCOLOR(0xfed23b);
    [self.view addSubview:_navHeadView];
    
    
    _navLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 26, 28, 28)];
    [_navLeftBtn setBackgroundImage:[UIImage imageNamed:@"nav_left_image"] forState:UIControlStateNormal];
    _navLeftBtn.highlighted = NO;
    [_navLeftBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navHeadView addSubview:_navLeftBtn];
    
    _navRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 38, 26, 28, 28)];
    [_navRightBtn setBackgroundImage:[UIImage imageNamed:@"nav_right_image"] forState:UIControlStateNormal];
    _navRightBtn.highlighted = NO;
    [_navRightBtn addTarget:self action:@selector(navBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navHeadView addSubview:_navRightBtn];
    
    CGFloat hotPostBtnX = _navHeadView.frame.size.width / 2 - 55;
    _hotPostBtn = [Tool giveMeAButtonWithRect:CGRectMake(hotPostBtnX, 20, 55, 40) title:@"热帖" titleColor:[UIColor blackColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:16];
    _hotPostBtn.titleLabel.font = [UIFont systemFontOfSize:16 * SPHEIGHT weight:UIFontWeightBold];
    [_hotPostBtn addTarget:self action:@selector(hotAndCircleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navHeadView addSubview:_hotPostBtn];
    
    CGFloat circleBtnX = _navHeadView.frame.size.width / 2;
    _circleBtn = [Tool giveMeAButtonWithRect:CGRectMake(circleBtnX, 20, 55, 40) title:@"圈子" titleColor:[UIColor blackColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:16];
    _circleBtn.titleLabel.font = [UIFont systemFontOfSize:16 * SPHEIGHT weight:UIFontWeightBold];
    [_circleBtn addTarget:self action:@selector(hotAndCircleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_navHeadView addSubview:_circleBtn];
    
    _navLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 2)];
    _navLineView.center = CGPointMake(_hotPostBtn.center.x, 63);
    _navLineView.backgroundColor = [UIColor blackColor];
    [_navHeadView addSubview:_navLineView];
}

//leftAndRightClick
- (void)navBtnClick:(UIButton *)btn {
    
    if (btn == _navLeftBtn) {
        
        NSLog(@"我是右边的");
        
    } else {
        
        NSLog(@"我是左边的");
    }
}

//hotPostBtnAndCircleBtnClick
- (void)hotAndCircleBtnClick:(UIButton *)btn {

    if (btn == _hotPostBtn) {
        
        [UIView animateWithDuration:0.33 animations:^{
            
            _navLineView.center = CGPointMake(_hotPostBtn.center.x, 63);
            _scrollView.contentOffset = CGPointMake(0, 0);
        }];
        
    } else {
    
        [UIView animateWithDuration:0.33 animations:^{
            
            _navLineView.center = CGPointMake(_circleBtn.center.x, 63);
            _scrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
        }];
    }
}

#pragma mark - 滑动ScrollView
- (void)buildeScrollView {

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT  - 112)];
    [self.view addSubview:_scrollView];
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, _scrollView.frame.size.height);
    
    _hotPostView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _scrollView.frame.size.height)];
    _hotPostView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_hotPostView];
    
    _circleView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, _scrollView.frame.size.height)];
    _circleView.backgroundColor = [UIColor yellowColor];
    [_scrollView addSubview:_circleView];
}

- (void)buildeHotPostTableView {

    _hotPostTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT  - 112) style:UITableViewStylePlain];
    _hotPostTableView.backgroundColor = [UIColor whiteColor];
    [_hotPostView addSubview:_hotPostTableView];
    _hotPostTableView.delegate = self;
    _hotPostTableView.dataSource = self;
    _hotPostTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    //注册复用cell
    //轮播图
    [_hotPostTableView registerClass:[BannerCell class] forCellReuseIdentifier:@"comBanCell"];
    //热帖title
    [_hotPostTableView registerClass:[TitleCell class] forCellReuseIdentifier:@"comTitleCell"];
    //样式一
    [_hotPostTableView registerClass:[HotPostCell class] forCellReuseIdentifier:@"comPostCell"];
    
    [_hotPostTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"hotCell"];
    
}

- (void)buildeCircleTableView {
    
    _circleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT  - 112) style:UITableViewStylePlain];
    _circleTableView.backgroundColor = [UIColor whiteColor];
    [_circleView addSubview:_circleTableView];
    _circleTableView.delegate = self;
    _circleTableView.dataSource = self;
    _circleTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    //注册复用cell
    [_circleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"circleCell"];
    
}

#pragma mark - tableViewDalegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (tableView == _hotPostTableView) {
        
        return 20;
    } else {
    
        return 12;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _hotPostTableView) {
        
        if (indexPath.row == 0) {
            
            return 194 * SPHEIGHT;
        } else if (indexPath.row == 1) {
        
            return 48 * SPHEIGHT;
        } else if (indexPath.row == 2) {
        
            return 255 * SPHEIGHT;
        } else {
        
            return 50;
        }
    } else {
    
        return 50;
    }
}

#pragma mark - tableView复用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (tableView == _hotPostTableView) {
        
        if (indexPath.row == 0) {
            
            BannerCell * bannerCell = [tableView dequeueReusableCellWithIdentifier:@"comBanCell" forIndexPath:indexPath];
            [bannerCell buildeBannerScrollViewWithHigh:194 andImageArr:self.comBannerArray];
            bannerCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return bannerCell;
            
        } else if (indexPath.row == 1) {
        
            TitleCell * titleCell  = [tableView dequeueReusableCellWithIdentifier:@"comTitleCell" forIndexPath:indexPath];
            titleCell.backgroundColor = HEXCOLOR(0xf2f2f2);
            titleCell.selectionStyle = UITableViewCellSelectionStyleNone;
            titleCell.titleImageView.image = [UIImage imageNamed:@"comHotImage"];
            titleCell.titleLabel.text = @"热帖推荐";
            return titleCell;

        } else if (indexPath.row == 2) {
        
            HotPostCell * hotPostCell = [tableView dequeueReusableCellWithIdentifier:@"comPostCell" forIndexPath:indexPath];
            hotPostCell.selectionStyle = UITableViewCellSelectionStyleNone;
            [hotPostCell initStyleOnelabelText:@"同城交友不" imageViewArray:self.hotStyleOneAry postImage:[UIImage imageNamed:@"cityFriend"] postText:@"同城交友"];
            return hotPostCell;
        } else {
        
            UITableViewCell * hotCell = [tableView dequeueReusableCellWithIdentifier:@"hotCell" forIndexPath:indexPath];
            hotCell.textLabel.text = @"Tina";
            return hotCell;
        }
        
    } else {
    
        UITableViewCell * hotCell = [tableView dequeueReusableCellWithIdentifier:@"circleCell" forIndexPath:indexPath];
        hotCell.textLabel.text = @"Tina";
        return hotCell;
    }
}















#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if(scrollView.contentOffset.x == 0) {
    
        [UIView animateWithDuration:0.33 animations:^{
            
            _navLineView.center = CGPointMake(_hotPostBtn.center.x, 63);
        }];
        
    } else if (scrollView.contentOffset.x == SCREEN_WIDTH) {
    
        [UIView animateWithDuration:0.33 animations:^{
            
            _navLineView.center = CGPointMake(_circleBtn.center.x, 63);
        }];
    }
    
}


























@end
