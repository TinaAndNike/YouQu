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


@property (nonatomic, strong)XMLBannerScrollView * bannerScrollView;

- (void)buildeConfigBannerScrollViewWithImages:(NSArray *)images;

@end
