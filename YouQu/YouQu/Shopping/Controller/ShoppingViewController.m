//
//  ShoppingViewController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ShoppingViewController.h"
#import "CommodityCollCell.h"
#import "ShoppingRecCollCell.h"
#import "ShoppingDetailsView.h"

@interface ShoppingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UIView * topView;

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UICollectionView * collectionView;

@property (nonatomic, strong)UIButton * maskView;

@property (nonatomic, strong)ShoppingDetailsView * shoppingDetailsView;

@property (nonatomic, weak)UIWindow * window;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"购物车";
    
    [self configNavigation];
    
    [self buildeCollectionView];
    
    [self createMaskView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}
- (UIWindow *)window {

    if (_window == nil) {
        
        _window = [UIApplication sharedApplication].keyWindow;
        _window.backgroundColor = [UIColor blackColor];
    }
    return _window;
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

#pragma mark - 自定制导航栏
- (void)configNavigation {
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 64)];
    _topView.backgroundColor = HEXCOLOR(0xfed23b);
    [self.view addSubview:_topView];
    
//    UIButton * backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 9, 15)];
//    [backBtn setBackgroundImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(buttonItemBack:) forControlEvents:UIControlEventTouchUpInside];
//    [_topView addSubview:backBtn];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor grayColor];
    [_topView addSubview:lineView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_topView.center.x - 75, 30, 150, 18)];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.text = @"套套天堂";
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [_topView addSubview:_titleLabel];
}

#pragma mark - 遮盖视图
- (void)createMaskView {

    _maskView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _maskView.backgroundColor = [UIColor blackColor];
    _maskView.alpha = 0;
    [_maskView addTarget:self action:@selector(maskBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_maskView];
    
    _shoppingDetailsView = [ShoppingDetailsView initShoppingDetailsView];
    _shoppingDetailsView.frame = CGRectMake(0, SCREEN_HEIGHT + 50 * SPHEIGHT, SCREEN_WIDTH, 467 * SPHEIGHT);
    [self.window addSubview:_shoppingDetailsView];
}

//遮盖图点击事件
- (void)maskBtnClick:(UIButton *)btn {

    [UIView animateWithDuration:0.33 animations:^{
        
        self.view.transform = CGAffineTransformMakeScale(1, 1);
        _maskView.alpha = 0;
        _shoppingDetailsView.frame = CGRectMake(0, SCREEN_HEIGHT + 50 * SPHEIGHT, SCREEN_WIDTH, 467 * SPHEIGHT);
    }];
}
#pragma mark - 建造collectionView
- (void)buildeCollectionView {

    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 103) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:[CommodityCollCell class] forCellWithReuseIdentifier:@"commodityCollCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"ShoppingRecCollCell" bundle:nil] forCellWithReuseIdentifier:@"shoppingRecColl"];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collCell"];
    //头视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    [self.view addSubview:_collectionView];

}

#pragma mark - CollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
    } else {
    
        return 6;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 0) {
        
        return UIEdgeInsetsMake(0, 0, 0, 0);
    } else {
    
        return UIEdgeInsetsMake(0, 16 * SPWIDTH, 16 * SPHEIGHT, 16 * SPWIDTH);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH, 260);
    } else {
    
        return CGSizeMake((SCREEN_WIDTH - ((16 * SPWIDTH) * 3)) / 2, (SCREEN_WIDTH - ((16 * SPWIDTH) * 3)) / 2 + 60);
    }
}

#pragma mark - headAndFoot
//设置header的size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
    
        return CGSizeMake(SCREEN_WIDTH, 35);
    } else {
    
        return CGSizeMake(SCREEN_WIDTH, 0.01);
    }
}

//用来设置头视图headerView和footerView（可以复用）
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        
        UICollectionReusableView* headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        UIImageView* headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
        headImageView.contentMode = UIViewContentModeScaleAspectFit;
        headImageView.image = [UIImage imageNamed:@"commendImage"];
        [headerView addSubview:headImageView];
        
        return headerView;

    } else {
    
        UICollectionReusableView* headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        return headerView;
    }
}

#pragma mark - 复用collCell
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        CommodityCollCell * commodity = [collectionView dequeueReusableCellWithReuseIdentifier:@"commodityCollCell" forIndexPath:indexPath];
        commodity.backgroundColor = HEXCOLOR(0xf2f2f2);
        return commodity;
        
    } else {
    
        ShoppingRecCollCell * recCollCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shoppingRecColl" forIndexPath:indexPath];
        recCollCell.imageLayoutH.constant = (SCREEN_WIDTH - ((16 * SPWIDTH) * 3)) / 2;
        recCollCell.imageLayoutW.constant = (SCREEN_WIDTH - ((16 * SPWIDTH) * 3)) / 2;
        //调用购物车按钮block
        recCollCell.shoppingRecBtnBlock = ^(){
        
            [UIView animateWithDuration:0.33 animations:^{
                
                self.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
                _maskView.alpha = 0.5;
                _shoppingDetailsView.frame = CGRectMake(0, SCREEN_HEIGHT - 467* SPHEIGHT, SCREEN_WIDTH, 467 * SPHEIGHT);
            }];
        };
        return recCollCell;
    }
}
@end
