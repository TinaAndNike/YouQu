//
//  PublicCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/3.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicCell : UITableViewCell <CCCycleScrollViewClickActionDeleage>

@property (nonatomic, strong)UIView * headView;

@property (nonatomic, strong)UILabel * headLabel;

@property (nonatomic, strong)UILabel * detailsLabel;

- (void)initConfigHeadViewWithHeadText:(NSString *)headText detailsText:(NSString *)detailsText;


@property (nonatomic, strong)XMLBannerScrollView * bannerScrollView;

- (void)buildeConfigBannerScrollViewWithImages:(NSArray *)images bannerHight:(CGFloat)hight;


//底视图样式一
@property (nonatomic, strong)UIView * bottomView;

- (void)buildeBottomViewWihtDict:(NSDictionary *)dict;

//底视图样式二
@property (nonatomic, strong)UIView * underwearBottomView;

- (void)buildeUnderwearBottmViewWithDict:(NSDictionary *)dict;

@end
