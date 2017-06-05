//
//  HotHeadCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/2.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HotHeadCell.h"
#import "HotCollCell.h"


@interface HotHeadCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView * collectionView;

@end

@implementation HotHeadCell

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

    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 199 * SPHEIGHT) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = HEXCOLOR(0xf0f0f0);
    [_collectionView registerClass:[HotCollCell class] forCellWithReuseIdentifier:@"hotCollCell"];
    [self.contentView addSubview:_collectionView];
}

#pragma mark - CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 6;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {

    return UIEdgeInsetsMake(15 * SPHEIGHT, 16 * SPWIDTH, 15 * SPHEIGHT, 10 * SPWIDTH);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(120 * SPWIDTH, 167 * SPHEIGHT);
}
#pragma mark - 复用collCell
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HotCollCell * hotCollCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotCollCell" forIndexPath:indexPath];
    hotCollCell.backgroundColor = [UIColor whiteColor];
    hotCollCell.imageView.image = [UIImage imageNamed:@"IMG_0673.JPG"];
    hotCollCell.titleLabel.text = @"大牌入驻";
    hotCollCell.detailsLabel.text = @"英国杜蕾斯强势入驻";
    return hotCollCell;
}








@end
