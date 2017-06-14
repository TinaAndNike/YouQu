//
//  ProductDetailsCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/12.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailsCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageLayoutW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageLayoutH;

@end
