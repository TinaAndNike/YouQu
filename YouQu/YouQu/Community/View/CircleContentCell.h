//
//  CircleContentCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/8.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleContentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIImageView *circleImageView;
@property (weak, nonatomic) IBOutlet UILabel *circleTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *circleDetailsLabel;
@property (nonatomic, strong)UILabel * dayLabel;
@property (nonatomic, strong)UILabel * dayNumberLabel;

- (void)dayNumberWithStr:(NSString *)str;
@end
