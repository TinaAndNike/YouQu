//
//  DetailsTwoController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/14.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "DetailsTwoController.h"
#import "ProductDetailsCell.h"
#import "TestCollCell.h"

@interface DetailsTwoController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView * collectionView;

@end

@implementation DetailsTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"商品详情";
    
    [self buildeCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildeCollectionView {
    
    UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
    //layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 5, SCREEN_HEIGHT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = HEXCOLOR(0xf2f2f2);
    //注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"ProductDetailsCell" bundle:nil] forCellWithReuseIdentifier:@"productDetailsCell"];
    [_collectionView registerNib:[UINib nibWithNibName:@"TestCollCell" bundle:nil] forCellWithReuseIdentifier:@"testCollCell"];
    [self.view addSubview:_collectionView];
}

#pragma mark - coll代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
//每组的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 5, 0, 0);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((SCREEN_WIDTH - 15) / 2, (SCREEN_WIDTH - 15) / 2 + 70);
}

#pragma mark - 复用代理
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductDetailsCell * detailsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"productDetailsCell" forIndexPath:indexPath];
    detailsCell.backgroundColor = [UIColor whiteColor];
    detailsCell.imageLayoutW.constant = (SCREEN_WIDTH - 15) / 2;
    detailsCell.imageLayoutH.constant = (SCREEN_WIDTH - 15) / 2;
    return detailsCell;
}

@end
