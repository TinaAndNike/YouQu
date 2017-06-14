//
//  ScreenView.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/13.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ScreenView.h"

@interface ScreenView()

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


@end

@implementation ScreenView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {

    [super awakeFromNib];
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = NO;
}

- (IBAction)screenViewBtnClick:(UIButton *)sender {
    
    if(sender == _sureBtn) {
    
        NSLog(@"点击确定");
    } else {
    
        self.screenBlock();
        NSLog(@"点击取消");
    }
}

- (void)createContent {

    _oneTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 16)];
    _oneTitleLabel.text = @"类型";
    [_scrollView addSubview:_oneTitleLabel];
    int oneIndex = 0;
    int twoIndex = 0;
    int oneIMax = 7;
    int twoIMax = 5;
    //记录oneTitleBtn中的最大Y
    CGFloat oneTitleBtnMaxY = 0.0;
    //oneTitleBtn
    CGFloat btnW = (SCREEN_WIDTH - 46) / 3;
    CGFloat btnH = 35;
    int loopForOneI = oneIMax % 3 == 0? oneIMax / 3:oneIMax / 3 + 1;
    for (int i = 0; i < loopForOneI; i++) {
        for (int j = 0; j < 3; j++) {
            
            UIButton * btn = [Tool giveMeAButtonWithRect:CGRectMake(15 + (btnW * j) + (8 * j), CGRectGetMaxY(_oneTitleLabel.frame) + 10 + (8 * i) + (btnH * i) , btnW, btnH) title:@"超薄型" titleColor:[UIColor blackColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.layer.borderColor = HEXCOLOR(0xaaaaaa).CGColor;
            btn.layer.borderWidth = 1;
            [_scrollView addSubview:btn];
            oneIndex ++;
            if (oneIndex == oneIMax) {
                
                oneTitleBtnMaxY = CGRectGetMaxY(btn.frame);
                break;
            }
        }
    }
    
    //twoTitleBtn
    _twoTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, oneTitleBtnMaxY + 15, 100, 16)];
    _twoTitleLabel.text = @"分类";
    [_scrollView addSubview:_twoTitleLabel];
    
    //记录twoTitleBtn中的最大Y
    CGFloat twoTitleBtnMaxY = 0.0;
    int loopFroTwoI = twoIMax % 3 == 0? twoIMax / 3:twoIMax / 3 + 1;
    //构造btn
    for (int i = 0; i < loopFroTwoI; i++) {
        for (int j = 0; j < 3; j++) {
            
            UIButton * btn = [Tool giveMeAButtonWithRect:CGRectMake(15 + (btnW * j) + (8 * j), CGRectGetMaxY(_twoTitleLabel.frame) + 10 + (8 * i) + (btnH * i) , btnW, btnH) title:@"杜蕾斯" titleColor:[UIColor blackColor] barkgroudColor:nil barkgroudImage:nil fontOfSize:0];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            btn.layer.borderColor = HEXCOLOR(0xaaaaaa).CGColor;
            btn.layer.borderWidth = 1;
            [_scrollView addSubview:btn];
            twoIndex ++;
            if (twoIndex == twoIMax) {
                
                twoTitleBtnMaxY = CGRectGetMaxY(btn.frame);
                break;
            }
        }
    }
    
    //判断内容的多少来判断contentSize
    if (twoTitleBtnMaxY < _scrollView.frame.size.height) {
        
        _scrollView.scrollEnabled = NO;
    }
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, twoTitleBtnMaxY > _scrollView.frame.size.height ? twoTitleBtnMaxY + 20:_scrollView.frame.size.height);
}



+(ScreenView *)initScreenView {
    
    NSArray * arrayView = [[NSBundle mainBundle] loadNibNamed:@"ScreenView" owner:self options:nil];
    return [arrayView objectAtIndex:0];
}

@end
