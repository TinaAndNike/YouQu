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


#pragma 头视图
- (void)initConfigHeadViewWithHeadText:(NSString *)headText detailsText:(NSString *)detailsText {
    
    [Tool solveReuseCellWithView:self.contentView];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45 * SPHEIGHT)];
    _headView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_headView];
    
    _headLabel = [Tool giveMeALabelWithRect:ADACGRectMake(16 * SPWIDTH, 0, 70,45 ) text:headText textColor:[UIColor blackColor] backgroudColor:nil fontSize:16 weight:UIFontWeightBold];
    _headLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_headLabel];
    
    _detailsLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(_headLabel.frame), 0, 100, 45) text:detailsText textColor:[UIColor grayColor] backgroudColor:nil fontSize:12 weight:0];
    [self.contentView addSubview:_detailsLabel];
    
    UIButton * allBtn = [Tool giveMeAButtonWithRect:ADACGRectMake(SCREEN_WIDTH - (16 * SPWIDTH) - (60 * SPWIDTH), 0, 60, 45) title:@"查看更多>" titleColor:[UIColor orangeColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:12];
    [allBtn addTarget:self action:@selector(allBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:allBtn];
}

- (void)allBtnClick:(UIButton *)btn {

    NSLog(@"查看更多");
}

#pragma mark - 轮播图

- (void)buildeConfigBannerScrollViewWithImages:(NSArray *)images bannerHight:(CGFloat)hight{
   
    _bannerScrollView = [[XMLBannerScrollView alloc] initWithImages:images withFrame:CGRectMake(0, CGRectGetMaxY(_headView.frame), SCREEN_WIDTH, hight * SPHEIGHT)];
    _bannerScrollView.delegate = self;
    _bannerScrollView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_bannerScrollView];
}

- (void)cyclePageClickAction:(NSInteger)clickIndex {

    NSLog(@"第%ld张图被点击了",clickIndex);
}

#pragma mark - 底视图

- (void)buildeBottomViewWihtDict:(NSDictionary *)dict {
    
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bannerScrollView.frame), SCREEN_WIDTH, 291 * SPHEIGHT)];
    _bottomView.userInteractionEnabled = YES;
    _bottomView.backgroundColor = HEXCOLOR(0xf2f2f2);
    [self.contentView addSubview:_bottomView];
    
    
    CGFloat width = (SCREEN_WIDTH - ((0.5 * 2) + (1 * 2))) / 3;
    CGFloat viewHigth = (290 * SPHEIGHT) / 2;
    for (int i = 0; i < 2; i++) {
        
        for (int j = 0; j < 3; j++) {
        
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0.5 + (1 * j) + (width * j), (1 * i) + (viewHigth * i), width, viewHigth)];
            view.backgroundColor = [UIColor whiteColor];
            [_bottomView addSubview:view];
            UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapGes:)];
            [view addGestureRecognizer:tapGes];
            
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 106 * SPHEIGHT)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.image = [UIImage imageNamed:dict[@"imageName"]];
            [view addSubview:imageView];
            
            NSLog(@"--%f---%f",imageView.frame.size.width,imageView.frame.size.height);
            
            UILabel * titleLabel = [Tool giveMeALabelWithRect:CGRectMake(0, CGRectGetMaxY(imageView.frame), width, 12 * SPHEIGHT) text:dict[@"titleStr"] textColor:[UIColor blackColor] backgroudColor:nil fontSize:12 weight:UIFontWeightBold];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:titleLabel];
            
            UILabel * detailsLabel = [Tool giveMeALabelWithRect:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), width, 18 * SPHEIGHT) text:dict[@"detailsStr"] textColor:[UIColor grayColor] backgroudColor:nil fontSize:10 weight:0];
            detailsLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:detailsLabel];
        }
    }
}

- (void)viewTapGes:(UITapGestureRecognizer *)tap {
    
    self.jumpBlock();
    NSLog(@"我被点击了");
}

#pragma mark - 内衣样式底视图
- (void)buildeUnderwearBottmViewWithDict:(NSDictionary *)dict {

    _underwearBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_bannerScrollView.frame), SCREEN_WIDTH, 252 * SPHEIGHT)];
    _underwearBottomView.userInteractionEnabled = YES;
    _underwearBottomView.backgroundColor = HEXCOLOR(0xf2f2f2);
    [self.contentView addSubview:_underwearBottomView];
    
    CGFloat viewWidth = (SCREEN_WIDTH - 1 * 3) / 2;
    CGFloat viewHight = (250 * SPHEIGHT) / 2;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(1 + (1 * j) + (viewWidth * j), 1 + (1 * i) + (viewHight * i), viewWidth, viewHight)];
            view.backgroundColor = [UIColor whiteColor];
            UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(underwearTapGes:)];
            [view addGestureRecognizer:tapGes];
            [_underwearBottomView addSubview:view];
            
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:ADACGRectMake(viewWidth - (90 * SPWIDTH), 0, 90, 125)];
            imageView.image = [UIImage imageNamed:@"publicImage"];
            [view addSubview:imageView];
            
            NSLog(@"--%f---%f",imageView.frame.size.width,imageView.frame.size.height);
            
            CGFloat labelWitdh = viewWidth - (imageView.bounds.size.width + 15 * SPWIDTH);
            UILabel * titleLabel = [Tool giveMeALabelWithRect:CGRectMake(15 * SPWIDTH, 28 * SPHEIGHT, labelWitdh, 12 * SPHEIGHT) text:dict[@"titleStr"] textColor:[UIColor blackColor] backgroudColor:nil fontSize:12 weight:0];
            [view addSubview:titleLabel];
            
            UILabel * detailsLabel = [Tool giveMeALabelWithRect:CGRectMake(15 * SPWIDTH, CGRectGetMaxY(titleLabel.frame) + 5 * SPHEIGHT, labelWitdh, 10 * SPHEIGHT) text:dict[@"detailsStr"] textColor:[UIColor grayColor] backgroudColor:nil fontSize:10 weight:0];
            [view addSubview:detailsLabel];
            
            UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(15 * SPWIDTH, CGRectGetMaxY(detailsLabel.frame) + 5 * SPHEIGHT, 46 * SPWIDTH, 1)];
            lineView.backgroundColor = HEXCOLOR(0xfed23b);
            [view addSubview:lineView];
        }
    }
}

- (void)underwearTapGes:(UITapGestureRecognizer *)tap {

    NSLog(@"我被点击了");
}









@end
