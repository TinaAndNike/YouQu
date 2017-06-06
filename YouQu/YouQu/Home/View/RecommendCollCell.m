//
//  RecommendCollCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/5.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RecommendCollCell.h"


@interface RecommendCollCell()

@property (nonatomic, strong)UIImageView * imageView;

@property (nonatomic, strong)UILabel * titleLabel;

@property (nonatomic, strong)UILabel * detailsLabel;

@end

@implementation RecommendCollCell

- (void)initRecommendWithImageView:(UIImage *)image titleText:(NSString *)titleText deatilsText:(NSString *)teatilsText {

    [Tool solveReuseCellWithView:self.contentView];
    
    CGFloat width = self.contentView.bounds.size.width;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 164 * SPHEIGHT)];
    _imageView.image = image;
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [Tool giveMeALabelWithRect:CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 7 * SPHEIGHT, width, 13 * SPHEIGHT) text:titleText textColor:[UIColor blackColor] backgroudColor:nil fontSize:13 weight:0];
    [self.contentView addSubview:_titleLabel];
    
    _detailsLabel = [Tool giveMeALabelWithRect:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame) + 3 * SPHEIGHT, width, 25 * SPHEIGHT) text:teatilsText textColor:[UIColor grayColor] backgroudColor:nil fontSize:10 weight:0];
    _detailsLabel.numberOfLines = 2;
    [self.contentView addSubview:_detailsLabel];
}

@end
