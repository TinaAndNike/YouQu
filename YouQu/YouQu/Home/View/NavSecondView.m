//
//  NavSecondView.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/12.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "NavSecondView.h"

@interface NavSecondView()

@property (nonatomic, weak)UIButton * selectBtn;


@property (weak, nonatomic) IBOutlet UIImageView *priceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *screenImageView;

@end

@implementation NavSecondView

static bool isPriceImage;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {

    [super awakeFromNib];
    [_popularityBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [_ptoductNew setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [_priceBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [_screenBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
}

- (IBAction)navSecondBtnClick:(UIButton *)sender {
    
    self.selectBtn.selected = NO;
    sender.selected = YES;
    self.selectBtn = sender;
    if (sender == _popularityBtn) {
        
        NSLog(@"我是人气按钮");
        
        isPriceImage = NO;
        _priceImageView.image = [UIImage imageNamed:@"product_normal"];
        
    } else if (sender == _ptoductNew) {
        
        NSLog(@"我是新品按钮");
        isPriceImage = NO;
        _priceImageView.image = [UIImage imageNamed:@"product_normal"];
    
    } else {
        
        NSLog(@"我是价格按钮");
        if (!isPriceImage) {
            
            _priceImageView.image = [UIImage imageNamed:@"product_ascOrder"];
            isPriceImage = YES;
        } else {
        
            _priceImageView.image = [UIImage imageNamed:@"product_desOrder"];
            isPriceImage = NO;
        }
    }
}

- (IBAction)screenBtnClick:(UIButton *)sender {
    
    sender.selected = YES;
    _screenImageView.image = [UIImage imageNamed:@"product_filter_select"];
    
    //调用screenBlock
    self.screenBtnBlock();
}

- (void)cancleScreenBtn {
    
    _screenBtn.selected = NO;
    _screenImageView.image = [UIImage imageNamed:@"product_filter_normal"];
}


+ (NavSecondView *)initNavSecondView {

    NSArray * viewArray = [[NSBundle mainBundle] loadNibNamed:@"NavSecondView" owner:self options:nil];
    return [viewArray objectAtIndex:0];
}

@end
