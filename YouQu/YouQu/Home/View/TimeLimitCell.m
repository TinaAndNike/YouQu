//
//  TimeLimitCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/1.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "TimeLimitCell.h"

@implementation TimeLimitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//创建限时cell
- (void)createTimeLimit {

    CGFloat spring = 29 * SPWIDTH;
    UILabel * timeLimit = [Tool giveMeALabelWithRect:CGRectMake(spring, 0, 70, 25) text:@"限时抢购" textColor:[UIColor blackColor] backgroudColor:HEXCOLOR(0xd9d9d9) fontSize:14 * SPHEIGHT weight:UIFontWeightBold];
    timeLimit.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:timeLimit];
    
}

@end
