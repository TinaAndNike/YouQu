//
//  CircleCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/8.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "CircleCell.h"

@implementation CircleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _moreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    _lineView.backgroundColor = HEXCOLOR(0xc7c7c7);
    [_moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//更多按钮点击事件
- (IBAction)moreBtnClick:(UIButton *)sender {
}

@end
