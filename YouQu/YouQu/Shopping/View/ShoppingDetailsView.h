//
//  ShoppingDetailsView.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/16.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingDetailsView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *shoppingDetailsImage;

+ (ShoppingDetailsView *)initShoppingDetailsView;

- (void)buildeScrollViewAndContent;
@end
