//
//  NavSecondView.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/12.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavSecondView : UIView

@property (weak, nonatomic) IBOutlet UIButton *popularityBtn;
@property (weak, nonatomic) IBOutlet UIButton *priceBtn;
@property (weak, nonatomic) IBOutlet UIButton *screenBtn;

@property (weak, nonatomic) IBOutlet UIButton *ptoductNew;

+ (NavSecondView *)initNavSecondView;

@end
