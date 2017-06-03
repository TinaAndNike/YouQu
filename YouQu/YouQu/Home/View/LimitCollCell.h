//
//  LimitCollCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/2.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LimitCollCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView * imageView;

@property (nonatomic, strong)UILabel * priceLabel;

@property (nonatomic, strong)UILabel * costDownLabel;

- (void)initControlImageView:(UIImage *)image priceLabelText:(NSString *)priceText costDownLabel:(NSString *)costDownText;

@end
