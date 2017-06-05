//
//  PublicCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/3.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "PublicCell.h"

@implementation PublicCell

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
        
        [self initConfigHeadView];
    }
    return self;
}

#pragma 头视图
- (void)initConfigHeadView {

    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45 * SPHEIGHT)];
    [self.contentView addSubview:_headView];
    
    _headLabel = [Tool giveMeALabelWithRect:ADACGRectMake(16 * SPWIDTH, 0, 60,45 ) text:@"" textColor:[UIColor blackColor] backgroudColor:nil fontSize:14 weight:UIFontWeightBold];
    _headLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_headLabel];
    
    _detailsLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(_headLabel.frame), 0, 100, 45) text:@"" textColor:[UIColor grayColor] backgroudColor:nil fontSize:12 weight:0];
    [self.contentView addSubview:_detailsLabel];
    
    UIButton * allBtn = [Tool giveMeAButtonWithRect:ADACGRectMake(SCREEN_WIDTH - (16 * SPWIDTH) - (60 * SPWIDTH), 0, 60, 45) title:@"查看更多>" titleColor:[UIColor orangeColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:12];
    [allBtn addTarget:self action:@selector(allBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:allBtn];
}

- (void)allBtnClick:(UIButton *)btn {

    NSLog(@"查看更多");
}

#pragma mark - 轮播图

- (void)buildeConfigBannerScrollViewWithImages:(NSArray *)images {

    //[Tool solveReuseCellWithView:self.contentView];
    for (UIView * view in self.contentView.subviews) {
        
        if ([view isKindOfClass:[XMLBannerScrollView class]]) {
            
            [view removeFromSuperview];
        }
    }
    
    _bannerScrollView = [[XMLBannerScrollView alloc] initWithImages:images withFrame:CGRectMake(0, CGRectGetMaxY(_headView.frame), SCREEN_WIDTH, 109 * SPHEIGHT)];
    _bannerScrollView.delegate = self;
    _bannerScrollView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_bannerScrollView];
}

- (void)cyclePageClickAction:(NSInteger)clickIndex {

    NSLog(@"第%ld张图被点击了",clickIndex);
}



@end
