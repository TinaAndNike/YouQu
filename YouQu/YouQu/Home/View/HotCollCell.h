//
//  HotCollCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/3.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotCollCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView * imageView;

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UILabel * detailsLabel;

- (void)initConfigWithImageView:(UIImage *)image titleText:(NSString *)titleText deatilsText:(NSString *)teatilsText;



@end
