//
//  ShoppingDetailsView.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/16.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "ShoppingDetailsView.h"

@interface ShoppingDetailsView()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong)NSArray * standarTitleArray;


@end
@implementation ShoppingDetailsView

- (void)awakeFromNib {

    [super awakeFromNib];
    _shoppingDetailsImage.layer.cornerRadius = 5;
    _shoppingDetailsImage.clipsToBounds = YES;
    _shoppingDetailsImage.layer.borderWidth = 1;
    _shoppingDetailsImage.layer.borderColor = HEXCOLOR(0xf2f2f2).CGColor;
    
}

+ (ShoppingDetailsView *)initShoppingDetailsView {

    NSArray * arrayView = [[NSBundle mainBundle] loadNibNamed:@"ShoppingDetailsView" owner:self options:nil];
    return [arrayView objectAtIndex:0];
}

#pragma mark - 懒加载
- (NSArray *)standarTitleArray {

    if (_standarTitleArray == nil) {
        
        _standarTitleArray = @[@"我是个规格",@"我是个超级长超级长的规格",@"我不长",@"我也不是是很长"];
    }
    return _standarTitleArray;
}

- (void)buildeScrollViewAndContent {

    UILabel * standardLabel = [Tool giveMeALabelWithRect:CGRectMake(15, 15, 60, 20) text:@"规格" textColor:[UIColor blackColor] backgroudColor:nil fontSize:18 weight:0];
    [_scrollView addSubview:standardLabel];
    
    //用collectionView来写，棒极了
    //固定index
    int index = 0;
    for (int i = 0; i < 2; i++) {
    
        for (int j = 0; j < 2; j++) {
            
        }
    }
}




















@end
