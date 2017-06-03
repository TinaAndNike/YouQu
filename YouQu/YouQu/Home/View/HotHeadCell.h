//
//  HotHeadCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/2.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotHeadCell : UITableViewCell

@property (nonatomic, strong)UIImageView * hotHeadView;

- (void)initHotHeadImageView:(UIImage *)image;

@end
