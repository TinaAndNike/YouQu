//
//  ScreenView.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/13.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//titleLabel
@property (nonatomic, strong)UILabel * oneTitleLabel;
@property (nonatomic, strong)UILabel * twoTitleLabel;

@property (nonatomic, copy)void(^screenBlock)();

+(ScreenView *)initScreenView;

- (void)createContent;

@end
