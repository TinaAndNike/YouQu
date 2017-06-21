//
//  ShoppingDetailsCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/19.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ShoppingDetailsCell.h"

@interface ShoppingDetailsCell()


@property (nonatomic, weak)UILabel * weakView;

@end
@implementation ShoppingDetailsCell

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        _shoppingTagLabel = [[UILabel alloc] init];
        _shoppingTagLabel.font = [UIFont systemFontOfSize:13];
        _shoppingTagLabel.numberOfLines = 1;
        _shoppingTagLabel.textColor = FONTUNIFY_COLOR;
        [self.contentView addSubview:_shoppingTagLabel];
    }
    
    return self;
}

//配置label
- (void)cofigShoppingTagLabelWithString:(NSString *)string widthWidth:(CGFloat)width {

    if (width + 40 == SCREEN_WIDTH) {
        
        _shoppingTagLabel.frame = CGRectMake(0, 0, width, 35);

    } else {
    
        _shoppingTagLabel.frame = CGRectMake(20, 0, self.contentView.frame.size.width - 40, 35);
    }
    _shoppingTagLabel.text = string;
}




@end
