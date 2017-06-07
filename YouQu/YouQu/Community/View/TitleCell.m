//
//  TitleCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/6.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell

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
        
        [self initImageViewAndTitleLabel];
    }
    return self;
}

- (void)initImageViewAndTitleLabel {

    _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(13 * SPWIDTH, 15 * SPHEIGHT, 15 * SPWIDTH,18 * SPHEIGHT)];
    [self.contentView addSubview:_titleImageView];
    
    _titleLabel = [Tool giveMeALabelWithRect:CGRectMake(CGRectGetMaxX(_titleImageView.frame) + 7 * SPWIDTH, 0, 200, 48 * SPHEIGHT) text:@"" textColor:[UIColor blackColor] backgroudColor:nil fontSize:15 weight:UIFontWeightBold];
    [self.contentView addSubview:_titleLabel];
}

@end
