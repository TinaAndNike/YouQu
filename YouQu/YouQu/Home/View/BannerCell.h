//
//  BannerCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/1.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BannerCell : UITableViewCell


//建造banner
- (void)buildeBannerScrollViewWithHigh:(CGFloat)high andImageArr:(NSArray *)imageArr;

@end
