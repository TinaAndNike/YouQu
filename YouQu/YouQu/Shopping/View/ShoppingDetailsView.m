//
//  ShoppingDetailsView.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/16.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ShoppingDetailsView.h"
#import "ShoppingDetailsCell.h"
#import "EqualSpaceFlowLayoutEvolve.h"

@interface ShoppingDetailsView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

//选择中的collCell
@property (nonatomic, assign)BOOL isOneSelectCell;

//数据源数组
@property (nonatomic, strong)NSArray * standarTitleArray;

//头视图文字
@property (nonatomic, strong)UILabel * shoppingTitleLabel;

//底视图View
@property (nonatomic, strong)UIView * footerAddView;
//底视图numberLable
@property (nonatomic, strong)UILabel * numberLabel;

//动态接收宽度
@property (nonatomic, assign)CGFloat collCellTagWidth;

//村粗动态高度的数组
@property (nonatomic, strong)NSMutableArray * tagWidthArray;


@end
@implementation ShoppingDetailsView

- (void)awakeFromNib {

    [super awakeFromNib];
    //初始化coll宽度
    //_collCellTagWidth = 0;
    
    //初始化商品图片
    _shoppingDetailsImage.layer.cornerRadius = 5;
    _shoppingDetailsImage.clipsToBounds = YES;
    _shoppingDetailsImage.layer.borderWidth = 1;
    _shoppingDetailsImage.layer.borderColor = HEXCOLOR(0xf2f2f2).CGColor;
    
    //初始化CollectionView
    EqualSpaceFlowLayoutEvolve * flowLayout = [[EqualSpaceFlowLayoutEvolve alloc]initWthType:AlignWithLeft];
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collCell"];
    [_collectionView registerClass:[ShoppingDetailsCell class] forCellWithReuseIdentifier:@"shoppingTagCell"];
    //头视图
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shoppingHeadView"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shoppingHeadViewTwo"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"shoppingFooterView"];
    
}

+ (ShoppingDetailsView *)initShoppingDetailsView {

    NSArray * arrayView = [[NSBundle mainBundle] loadNibNamed:@"ShoppingDetailsView" owner:self options:nil];
    return [arrayView objectAtIndex:0];
}

#pragma mark - 懒加载
- (NSArray *)standarTitleArray {

    if (_standarTitleArray == nil) {
        
        _standarTitleArray = @[@"我是个规格",@"我是很长的个规格",@"我是个很长很长很长规格",@"我是个规格",@"规格",@"我是个很长很长很长很长很长很长很长很长很长很长很很长很长很规格"];
    }
    return _standarTitleArray;
}

//cell的动态宽度
- (NSMutableArray *)tagWidthArray {
    
    if (_tagWidthArray == nil) {
        
        _tagWidthArray = [[NSMutableArray alloc] init];
        [self collCellAutoWidthWithTagTitleArray:self.standarTitleArray];
    }
    return _tagWidthArray;
}

//底视图懒加载
- (UIView *)footerAddView {

    if (_footerAddView == nil) {
        
        _footerAddView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 150, 15, 130, 44)];
        _footerAddView.backgroundColor = HEXCOLOR(0xcccccc);
        CGFloat subAndW = 130 / 3;
        UIButton * subtractBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, subAndW, 44)];
        [subtractBtn setTitle:@"－" forState:UIControlStateNormal];
        [subtractBtn setTitleColor:FONTUNIFY_COLOR forState:UIControlStateNormal];
        [_footerAddView addSubview:subtractBtn];
        
        _numberLabel = [Tool giveMeALabelWithRect:CGRectMake(CGRectGetMaxX(subtractBtn.frame), 0, subAndW, 44) text:@"9" textColor:[UIColor blackColor] backgroudColor:[UIColor whiteColor] fontSize:15 weight:0];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.layer.borderColor = HEXCOLOR(0xcccccc).CGColor;
        _numberLabel.layer.borderWidth = 2;
        [_footerAddView addSubview:_numberLabel];
        
        UIButton * addBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_numberLabel.frame), 0, subAndW, 44)];
        [addBtn setTitle:@"＋" forState:UIControlStateNormal];
        [addBtn setTitleColor:FONTUNIFY_COLOR forState:UIControlStateNormal];
        [_footerAddView addSubview:addBtn];
    }
    return _footerAddView;
}

- (UILabel *)shoppingTitleLabel {

    if (_shoppingTitleLabel == nil) {
        
        _shoppingTitleLabel = [Tool giveMeALabelWithRect:CGRectMake(15, 15, 100, 15) text:@"规格" textColor:FONTUNIFY_COLOR backgroudColor:nil fontSize:15 weight:0];
    }
    return _shoppingTitleLabel;
}
#pragma mark - collectionView代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.standarTitleArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    

    return UIEdgeInsetsMake(0, 10, 0, 10);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return CGSizeMake([self.tagWidthArray[indexPath.row] floatValue], 35);
}

#pragma mark - headAndFoot
//设置header的size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return CGSizeMake(SCREEN_WIDTH, 45);
    } else {
        
        return CGSizeMake(SCREEN_WIDTH, 0.01);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {

    return CGSizeMake(SCREEN_WIDTH, 60);
}

//用来设置头视图headerView和footerView（可以复用）
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView* headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"shoppingHeadView" forIndexPath:indexPath];
        [headerView addSubview:self.shoppingTitleLabel];
        
        return headerView;
        
    } else {
        
        UICollectionReusableView* footerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"shoppingFooterView" forIndexPath:indexPath];
        //footetTitleLabel
        UILabel * footerTitleLabel = [Tool giveMeALabelWithRect:CGRectMake(20, 15, 100, 44) text:@"数量" textColor:[UIColor blackColor] backgroudColor:nil fontSize:15 weight:0];
        [footerView addSubview:footerTitleLabel];
        [footerView addSubview:self.footerAddView];
        return footerView;
    }
}

#pragma mark - coll的复用方法
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        
        ShoppingDetailsCell * tagCollCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shoppingTagCell" forIndexPath:indexPath];
        
        UIView * bgCellView = [[UIView alloc] initWithFrame:tagCollCell.bounds];
        bgCellView.layer.borderColor = [UIColor blackColor].CGColor;
        bgCellView.layer.borderWidth = 1;
        tagCollCell.selectedBackgroundView = bgCellView;
        
        UIView * bgView = [[UIView alloc] initWithFrame:tagCollCell.bounds];
        bgView.layer.borderColor = HEXCOLOR(0xf2f2f2).CGColor;
        bgView.layer.borderWidth = 1;
        tagCollCell.backgroundView = bgView;
        
        [tagCollCell cofigShoppingTagLabelWithString:self.standarTitleArray[indexPath.row] widthWidth:[self.tagWidthArray[indexPath.row] floatValue]];
        if (indexPath.row == 0) {
            
            tagCollCell.selected = YES;
            _isOneSelectCell = YES;
        }
        return tagCollCell;
    } else {
    
        UICollectionViewCell * collCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
        collCell.backgroundColor = [UIColor orangeColor];
        return collCell;
    }
}

#pragma mark - cell点击切换样式
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {

    if (_isOneSelectCell) {
        
        ShoppingDetailsCell * eollCell = (ShoppingDetailsCell *)[self recombinationCollsArray];
        eollCell.selected = NO;
        _isOneSelectCell = NO;
    }
    return YES;
}

//collectionView上的cell进行数组重组
- (UICollectionViewCell *)recombinationCollsArray {

    NSArray *visibleCellIndex = [_collectionView visibleCells];
    NSArray *sortedIndexPaths = [visibleCellIndex sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSIndexPath *path1 = (NSIndexPath *)[_collectionView indexPathForCell:obj1];
        NSIndexPath *path2 = (NSIndexPath *)[_collectionView indexPathForCell:obj2];
        return [path1 compare:path2];
    }];
    return sortedIndexPaths.firstObject;
}

#pragma mark - coll的点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"我也是被点击的");
}

#pragma mark - 计算出tag文本的宽度
- (void)collCellAutoWidthWithTagTitleArray:(NSArray *)tagTitleArray {

    for (int i = 0; i < tagTitleArray.count; i ++) {
        
        CGFloat width = [Tool specialAdaptionLabelWidthTitleString:tagTitleArray[i] fontSize:13 weigt:0];
        NSNumber * number;
        if (width > SCREEN_WIDTH - 160) {
            
            number = [NSNumber numberWithFloat:SCREEN_WIDTH - 40];
        } else {
        
            number = [NSNumber numberWithFloat:width + 40];
        }
        [self.tagWidthArray addObject:number];
    }
}













@end
