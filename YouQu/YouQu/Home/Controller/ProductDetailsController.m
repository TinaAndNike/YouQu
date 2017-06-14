//
//  ProductDetailsController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/9.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ProductDetailsController.h"
#import "RootTabBarController.h"
#import "ProductHeadCell.h"
#import "ProductDetailsCell.h"
#import "NavSecondView.h"
#import "ScreenView.h"

@interface ProductDetailsController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

//创建一个全局tabBar的属性用来调用封装的隐藏tabBar的方法
@property (nonatomic, strong)RootTabBarController * rootBar;

//头视图
@property (nonatomic, strong)UIView * topView;

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)NavSecondView * secondView;

//内容视图
@property (nonatomic, strong)UICollectionView * collectionView;

@property (nonatomic, strong)UIView * secondNavView;

//筛选视图
@property (nonatomic, strong)ScreenView * screenView;
//遮盖图片
@property (nonatomic, strong)UIButton * maskView;


@end

@implementation ProductDetailsController

//判断侧滑
static BOOL _isPoping;

- (void)viewDidLoad {
    [super viewDidLoad];
    _rootBar = (id)self.tabBarController;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"套套天堂";
    [self buildeCollectionView];
    [self configNavigation];
    [self buildeMaskImageViewAndScreenView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildeCollectionView {

    UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 7 * SPWIDTH;
    layout.minimumInteritemSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = HEXCOLOR(0xf2f2f2);
    //注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"ProductHeadCell" bundle:nil] forCellWithReuseIdentifier:@"headCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"ProductDetailsCell" bundle:nil] forCellWithReuseIdentifier:@"productDetailsCell"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collCell"];
    [self.view addSubview:_collectionView];
}

//筛选遮盖视图
- (void)buildeMaskImageViewAndScreenView {

    _maskView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _maskView.alpha = 0;
    [_maskView addTarget:self action:@selector(maskViewClick:) forControlEvents:UIControlEventTouchUpInside];
    _maskView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_maskView];
    
    
    //创建筛选视图
    _screenView = [ScreenView initScreenView];
    _screenView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT * 0.7);
    [_screenView createContent];
    //取消block
    //调用screenBlock
    __weak ProductDetailsController * weakSelf = self;
    _screenView.screenBlock = ^(){
    
        [weakSelf maskViewClick:nil];
    };
    [self.view addSubview:_screenView];

}
//遮盖视图点击事件
- (void)maskViewClick:(UIButton *)btn {

    [UIView animateWithDuration:0.33 animations:^{
       
        _screenView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT * 0.7);
        _maskView.alpha = 0;
    }];
    [_secondView cancleScreenBtn];
}

#pragma mark - 侧滑恢复
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (!_isPoping) {
        
        _isPoping = YES;
        return YES;
    }
    return NO;
}

#pragma mark - 页面将要出现
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [_rootBar settabbarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    //在didAppear时置为NO
    _isPoping = NO;
}
#pragma mark - 返回按钮时间
- (void)configNavigation {
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 64)];
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];
    
    UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 9, 15)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(buttonItemBack:) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:backBtn];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor grayColor];
    [_topView addSubview:lineView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_topView.center.x - 75, 30, 150, 18)];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.text = @"套套天堂";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_topView addSubview:_titleLabel];
    
    //创建二级nav
    _secondView = [NavSecondView initNavSecondView];
    _secondView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
    _secondView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_secondView];
    
    //调用screenBlock
    __weak ProductDetailsController * weakSelf = self;
    _secondView.screenBtnBlock = ^(){
    
        [weakSelf screenViewDisplay];
    };
}

- (void)screenViewDisplay {
    
    //显示遮盖视图
    [UIView animateWithDuration:0.33 animations:^{
        
        _maskView.alpha = 0.5;
        _screenView.frame = CGRectMake(0, SCREEN_HEIGHT * 0.3, SCREEN_WIDTH, SCREEN_HEIGHT * 0.7);
    }];
    
    NSLog(@"筛选视图的显示");
}

//返回上页事件
- (void)buttonItemBack:(UIButton *)btn {

    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 滑动代理
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

    if (velocity.y > 0) {
        
        NSLog(@"我可以隐藏了");
        [UIView animateWithDuration:0.33 animations:^{
           
            _topView.frame = CGRectMake(0, -64, SCREEN_WIDTH, 64);
            _secondView.frame = CGRectMake(0, -104, SCREEN_WIDTH, 40);
            _collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    } else {
    
        NSLog(@"我又出来了，哈哈哈");
        [UIView animateWithDuration:0.33 animations:^{
            
            _topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
            _secondView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 40);
            _collectionView.frame = CGRectMake(0, 104, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
    }
}

#pragma mark - coll代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}
//每组的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
    } else {
    
        return 20;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        
        return UIEdgeInsetsMake(0, 0, 0, 0);
    } else {
    
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH, 155 * SPHEIGHT);
    } else {
    
        return CGSizeMake((SCREEN_WIDTH - 7  * SPWIDTH) / 2, (SCREEN_WIDTH - 7  * SPWIDTH) / 2 + 70);
    }
}
#pragma mark - 复用代理
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        
        ProductHeadCell * headCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headCell" forIndexPath:indexPath];
        return headCell;
    } else {
    
        ProductDetailsCell * detailsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"productDetailsCell" forIndexPath:indexPath];
        detailsCell.backgroundColor = [UIColor whiteColor];
        detailsCell.imageLayoutW.constant = (SCREEN_WIDTH - 7  * SPWIDTH) / 2;
        detailsCell.imageLayoutH.constant = (SCREEN_WIDTH - 7  * SPWIDTH) / 2;
        return detailsCell;
    }
}







@end
