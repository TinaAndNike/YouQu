//
//  ProductDetailsController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/9.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ProductDetailsController.h"

@interface ProductDetailsController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView * collectionView;

@property (nonatomic, strong)UIView * headView;

@end

@implementation ProductDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"套套天堂";
    [self configNavigation];
    [self buildeCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildeCollectionView {

    UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collCell"];
    [self.view addSubview:_collectionView];
}

#pragma mark - 页面将要出现
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    //self.navigationController.navigationBar.frame = CGRectMake(0, -MAXFLOAT, SCREEN_WIDTH, 64);
}

#pragma mark - 返回按钮时间
- (void)configNavigation {

    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backImage"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemBack:)];
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, 64)];
   // [self.view addSubview:_headView];
    _headView.backgroundColor = [UIColor orangeColor];
}

- (void)buttonItemBack:(UIBarButtonItem *)barBtn {

    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 滑动代理
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

    if (velocity.y > 0) {
        
        NSLog(@"我可以隐藏了");
        [UIView animateWithDuration:0.33 animations:^{
           
            [self.navigationController setNavigationBarHidden:velocity.y>0 animated:YES];
            _collectionView.frame = CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT - 44);
        }];
    } else {
    
        NSLog(@"我又出来了，哈哈哈");
        [UIView animateWithDuration:0.33 animations:^{
            
            //[self.navigationController setNavigationBarHidden:velocity.y>0 animated:YES];
            _collectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44);
        }];
    }
}

#pragma mark - coll代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake((SCREEN_WIDTH - 20) / 2, (SCREEN_WIDTH - 20) / 2);
}
#pragma mark - 复用代理
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell * collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
    collCell.backgroundColor = [UIColor cyanColor];
    return collCell;
}







@end
