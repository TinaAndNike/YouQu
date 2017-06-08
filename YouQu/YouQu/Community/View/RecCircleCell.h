//
//  RecCircleCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/8.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecCircleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *recCellTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *recCellDetailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *recCircleNumber;
@property (weak, nonatomic) IBOutlet UIButton *concernBtn;

@end
