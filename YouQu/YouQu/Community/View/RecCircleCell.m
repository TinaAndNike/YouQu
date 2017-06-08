//
//  RecCircleCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/8.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RecCircleCell.h"

@implementation RecCircleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _concernBtn.layer.borderColor = HEXCOLOR(0xFFD83E).CGColor;
    _concernBtn.layer.borderWidth = 2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)concernBtnClick:(UIButton *)sender {
}


@end
