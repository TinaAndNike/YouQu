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
    
    //删除所有复用view
    [Tool solveReuseCellWithView:self.contentView];

    CGFloat spring = 16 * SPWIDTH;
    UILabel * timeLimit = [Tool giveMeALabelWithRect:ADACGRectMake(spring, 0, 70, 25) text:@"限时抢购" textColor:[UIColor blackColor] backgroudColor:HEXCOLOR(0xd9d9d9) fontSize:14 weight:UIFontWeightBold];
    timeLimit.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:timeLimit];
    
    UILabel * fieldLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(timeLimit.frame) + 5 * SPWIDTH, 0, 52, 25) text:@"10:00场" textColor:[UIColor blackColor] backgroudColor:nil fontSize:14 weight:0];
    [self.contentView addSubview:fieldLabel];
    
    UILabel * timeLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(fieldLabel.frame) + 5 * SPWIDTH, 0, 60, 25) text:@"11:11:11" textColor:[UIColor orangeColor] backgroudColor:nil fontSize:14 weight:0];
    [self.contentView addSubview:timeLabel];
    
    UIButton * allBtn = [Tool giveMeAButtonWithRect:ADACGRectMake(SCREEN_WIDTH - spring - (70 * SPWIDTH), 0, 70, 25) title:@"查看全部>" titleColor:[UIColor grayColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:14];
    [allBtn addTarget:self action:@selector(allBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:allBtn];
}

- (void)allBtnClick:(UIButton *)btn {

    NSLog(@"我是全部按钮点击事件");
}

@end
