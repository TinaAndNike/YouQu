//
//  ClassifyCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/1.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ClassifyCell.h"
#import "TabBarBtn.h"


#define btnTag 100

@implementation ClassifyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)createClassifyBtn {
    
    //删除复用图层
    [Tool solveReuseCellWithView:self.contentView];
    //建造按钮
    NSArray * labelTextName = @[@"套套天堂",@"情趣服饰",@"男用玩具",@"女用玩具",@"男女喷剂",@"润滑助剂",@"调教玩具",@"免费试用",@"撸一撸",@"分类"];
    NSArray * buttonImageName = @[@"home_fenlei__01",@"home_fenlei__02",@"home_fenlei__03",@"home_fenlei__04",@"home_fenlei__05",@"home_fenlei__06",@"home_fenlei__07",@"home_fenlei__08",@"home_fenlei__09",@"home_fenlei__10"];
    CGFloat highSp = 13 * SPHEIGHT;
    CGFloat rlSp = 29 * SPWIDTH;
    CGFloat btnHBSp = 31 * SPHEIGHT;
    CGFloat btnRLSp = 34 * SPWIDTH;
    CGFloat labelHSp = 7 * SPHEIGHT;
    CGFloat labelSp = 26 * SPWIDTH;
    CGFloat labelRlSp = 27 * SPWIDTH;
    CGFloat labelWidth = (SCREEN_WIDTH - (labelSp * 2) - (labelRlSp * 4)) / 5;
    CGFloat btnWidth = (SCREEN_WIDTH - (rlSp * 2) - (btnRLSp * 4)) / 5;
    int index = 0;
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 5; j ++) {
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(rlSp + (btnWidth * j) + (btnRLSp * j), highSp + (btnWidth * i) + (btnHBSp * i), btnWidth, btnWidth)];
            btn.tag = btnTag + index;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setImage:[UIImage imageNamed:buttonImageName[index]] forState:UIControlStateNormal];
            [self.contentView addSubview:btn];
            
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(labelSp + (labelWidth * j) + (labelRlSp * j), CGRectGetMaxY(btn.frame) + labelHSp, labelWidth, 10 * SPWIDTH)];
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:10 * SPHEIGHT weight:UIFontWeightThin];
            label.text = labelTextName[index];
            [self.contentView addSubview:label];
            //递增index
            index ++;
        }
    }
}

- (void)btnClick:(UIButton *)btn {

    self.classifyBlock();
}

@end
