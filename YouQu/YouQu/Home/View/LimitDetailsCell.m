//
//  LimitDetailsCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/14.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "LimitDetailsCell.h"

@implementation LimitDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:@"￥99:99" attributes:attribtDic];
    
    _coustDownLabel.attributedText = attribtStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
