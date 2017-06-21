//
//  ShoppingDetailsCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/19.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingDetailsCell : UICollectionViewCell

@property (nonatomic, strong)UILabel * shoppingTagLabel;

@property (nonatomic, copy)void(^shoppingTagHeightBlock)();


- (void)cofigShoppingTagLabelWithString:(NSString *)string widthWidth:(CGFloat)width;
@end
