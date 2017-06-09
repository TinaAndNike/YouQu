//
//  MineheadCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/9.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "MineheadCell.h"

@implementation MineheadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _avatarImageView.layer.cornerRadius = _avatarImageView.frame.size.width / 2;
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.layer.borderWidth = 2;
    _avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)collAndFootClick:(UIButton *)sender {
    
    if (sender == _collectBtn) {
        
        NSLog(@"我是收藏");
    } else {
    
        NSLog(@"我是足迹");
    }
}

@end
