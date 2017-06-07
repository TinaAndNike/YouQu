//
//  HotPostCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/6.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HotPostCell.h"


@interface HotPostCell()

//postView
@property (nonatomic, strong)UIView * postView;

@property (nonatomic, strong)UIImageView * postImageView;

@property (nonatomic, strong)UILabel * postLabel;

//样式一
@property (nonatomic,strong)UILabel * styleOneLabel;


@end
@implementation HotPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//oneStyle
- (void)initStyleOnelabelText:(NSString *)text imageViewArray:(NSArray *)array postImage:(UIImage *)image postText:(NSString *)postText {

    [Tool solveReuseCellWithView:self.contentView];
    
    [self initPostViewWihtImage:image titleText:postText];
    
    _styleOneLabel = [Tool giveMeALabelWithRect:CGRectMake(13 * SPWIDTH,CGRectGetMaxY(_postView.frame) + 16 * SPHEIGHT, 200, 19 * SPHEIGHT) text:text textColor:[UIColor blackColor] backgroudColor:nil fontSize:19 weight:UIFontWeightBold];
    [self.contentView addSubview:_styleOneLabel];
    
    for (int i = 0; i < 3; i++) {
        
        CGFloat imageViewWidth = (SCREEN_WIDTH - ((13 * SPWIDTH) * 2) - ((9 * SPWIDTH) * 2)) / 3;
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((13 * SPWIDTH) + ((9 * SPWIDTH) * i) + (imageViewWidth * i), CGRectGetMaxY(_styleOneLabel.frame) + (17 * SPHEIGHT), imageViewWidth, 126 * SPHEIGHT)];
        imageView.layer.cornerRadius = 3.0;
        imageView.clipsToBounds = YES;
        imageView.image = array[i];
        [self.contentView addSubview:imageView];
    }
}

//headPostView
- (void)initPostViewWihtImage:(UIImage *)image titleText:(NSString *)text {

    _postView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 33 * SPHEIGHT)];
    [self.contentView addSubview:_postView];
    
    _postImageView = [[UIImageView alloc] initWithFrame:DPPCGRectMake(13, 16, 18, 18)];
    _postImageView.image = image;
    [_postView addSubview:_postImageView];
    
    _postLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(_postImageView.frame) + 7 * SPWIDTH, 16 * SPHEIGHT, 200, 18) text:text textColor:[UIColor blackColor] backgroudColor:nil fontSize:12 weight:0];
    [_postView addSubview:_postLabel];
}


@end
