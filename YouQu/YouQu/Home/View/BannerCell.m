//
//  BannerCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/1.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "BannerCell.h"

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

    UIScrollView * bannerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, high)];
    bannerScrollView.showsHorizontalScrollIndicator = NO;
    bannerScrollView.pagingEnabled = YES;
    bannerScrollView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:bannerScrollView];
}

@end
