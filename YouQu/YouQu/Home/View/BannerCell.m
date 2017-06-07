//
//  BannerCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/1.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "BannerCell.h"

@interface BannerCell()<CCCycleScrollViewClickActionDeleage>

@property (nonatomic, strong)XMLBannerScrollView * bannerScrollView;

@end

@implementation BannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}

//建造banner
- (void)buildeBannerScrollViewWithHigh:(CGFloat)high andImageArr:(NSArray *)imageArr {

    //防止复用
    [Tool solveReuseCellWithView:self.contentView];
    
    self.bannerScrollView = [[XMLBannerScrollView alloc] initWithImages:imageArr withFrame:CGRectMake(0, 0, SCREEN_WIDTH, high * SPHEIGHT)];
    NSLog(@"----%ld",imageArr.count);
    self.bannerScrollView.delegate = self;
    self.bannerScrollView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.bannerScrollView];
}

#pragma bannerDelegate
- (void)cyclePageClickAction:(NSInteger)clickIndex {

    NSLog(@"第%ld张图片被点击了",clickIndex);
}

@end
