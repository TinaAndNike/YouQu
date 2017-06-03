//
//  HotHeadCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/2.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HotHeadCell.h"


@implementation HotHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initHotHeadImageView:(UIImage *)image {

    [Tool solveReuseCellWithView:self.contentView];
    
    self.hotHeadView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 37 * SPHEIGHT)];
    self.hotHeadView.image = image;
    [self.contentView addSubview:self.hotHeadView];
}

@end
