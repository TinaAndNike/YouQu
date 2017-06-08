//
//  CircleContentCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/8.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "CircleContentCell.h"

@implementation CircleContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _dayNumberLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_dayNumberLabel];
    _dayLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_dayLabel];
    
    _circleTitleLabel.font = [UIFont systemFontOfSize:15];
    _circleDetailsLabel.font = [UIFont systemFontOfSize:13];
    _circleDetailsLabel.textColor = [UIColor grayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dayNumberWithStr:(NSString *)str {
    
    CGFloat dayNumberW = [Tool getWidthWithTitle:str fontSize:14 weigt:0];
    _dayNumberLabel.text = str;
    _dayNumberLabel.frame = CGRectMake(SCREEN_WIDTH - 15 - (dayNumberW), 20, dayNumberW, 14);
    _dayNumberLabel.font = [UIFont systemFontOfSize:14 * SPHEIGHT];
    _dayNumberLabel.textColor = [UIColor orangeColor];
    
    _dayLabel.text = @"今日:";
    _dayLabel.frame = CGRectMake(CGRectGetMinX(_dayNumberLabel.frame) - 38 * SPWIDTH, 20, 38 * SPWIDTH, 14);
    _dayLabel.font = [UIFont systemFontOfSize:14 * SPHEIGHT];
    _dayLabel.textColor = [UIColor orangeColor];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - (dayNumberW), 20, dayNumberW, 14)];
    label.backgroundColor = [UIColor redColor];
//    [self.contentView addSubview:label];
}

@end
