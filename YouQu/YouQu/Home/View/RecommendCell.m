//
//  recommendCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/5.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RecommendCell.h"
#import "RecommendCollCell.h"


@interface RecommendCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView * collectionView;

@end

@implementation RecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self initCollectionView];
    }
    return self;
}

- (void)initCollectionView {
    
    //头视图
    UIImageView * collHeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35 * SPHEIGHT)];
    collHeadImageView.contentMode = UIViewContentModeScaleAspectFit;
    collHeadImageView.image = [UIImage imageNamed:@"commendImage"];
    [self.contentView addSubview:collHeadImageView];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(collHeadImageView.frame), SCREEN_WIDTH, 440 * SPHEIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.scrollEnabled = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:[RecommendCollCell class] forCellWithReuseIdentifier:@"recommendCollCell"];
    [self.contentView addSubview:_collectionView];
}

#pragma mark - CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 16 * SPWIDTH, 16 * SPHEIGHT, 16 * SPWIDTH);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((SCREEN_WIDTH - ((16 * SPWIDTH) * 3)) / 2, 212 * SPHEIGHT);
}


#pragma mark - 复用collCell
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RecommendCollCell * recommendCollCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendCollCell" forIndexPath:indexPath];
    recommendCollCell.backgroundColor = [UIColor whiteColor];
    [recommendCollCell initRecommendWithImageView:[UIImage imageNamed:@"IMG_0673.JPG"] titleText:@"山寨苹果手机只要" deatilsText:@"山寨苹果手机只要山寨苹果手机只要山寨苹果手机只要￥999"];
    return recommendCollCell;
}

@end
