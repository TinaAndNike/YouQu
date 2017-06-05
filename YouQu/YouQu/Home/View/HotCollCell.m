//
//  HotCollCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/3.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HotCollCell.h"

@implementation HotCollCell

- (void)initConfigWithImageView:(UIImage *)image titleText:(NSString *)titleText deatilsText:(NSString *)teatilsText {
}

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self initConfigControl];
    }
    return self;
}

- (void)initConfigControl {

    self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 10;
    
    _imageView = [[UIImageView alloc] initWithFrame:ADACGRectMake(0, 0, 120, 120)];
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [Tool giveMeALabelWithRect:ADACGRectMake(15 * SPWIDTH, CGRectGetMaxY(_imageView.frame) + 10 * SPHEIGHT, 120, 13) text:@"" textColor:[UIColor blackColor] backgroudColor:nil fontSize:13 weight:0];
    [self.contentView addSubview:_titleLabel];
    
    _detailsLabel = [Tool giveMeALabelWithRect:ADACGRectMake(15 * SPWIDTH, CGRectGetMaxY(_titleLabel.frame) + 6 * SPHEIGHT, 120,10 ) text:@"" textColor:[UIColor grayColor] backgroudColor:nil fontSize:10 weight:0];
    [self.contentView addSubview:_detailsLabel];
}

@end
