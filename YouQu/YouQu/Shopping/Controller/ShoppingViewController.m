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

@interface ShoppingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView * collectionView;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RANDOM_COLOR;
    self.title = @"购物车";
    
    [self buildeCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

#pragma mark - 建造collectionView
- (void)buildeCollectionView {

    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 10);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
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
        
        return CGSizeMake(SCREEN_WIDTH, 200);
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
        return recCollCell;
    }
}
@end
