//
//  LimitCollCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/2.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "LimitCollCell.h"

@implementation LimitCollCell

- (void)initControlImageView:(UIImage *)image priceLabelText:(NSString *)priceText costDownLabel:(NSString *)costDownText {

    //删除所有复用的View
    [Tool solveReuseCellWithView:self.contentView];
    
    
    self.imageView = [[UIImageView alloc] initWithFrame:ADACGRectMake(0, 0, 100, 106)];
    self.imageView.image = image;
    [self.contentView addSubview:self.imageView];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:ADACGRectMake(0, CGRectGetMaxY(self.imageView.frame), 50, 20)];
    self.priceLabel = [Tool giveMeALabelWithRect:ADACGRectMake(0, CGRectGetMaxY(self.imageView.frame), 50, 20) text:priceText textColor:[UIColor orangeColor] backgroudColor:nil fontSize:13 weight:0];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.priceLabel];
    
    if (costDownText == nil) {
        
        self.priceLabel.frame = ADACGRectMake(0, CGRectGetMaxY(self.imageView.frame), 100, 20);
    } else {
    
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        self.costDownLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(self.priceLabel.frame), CGRectGetMaxY(self.imageView.frame), 50, 20) text:@"" textColor:[UIColor grayColor] backgroudColor:nil fontSize:12 weight:0];
        NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:costDownText attributes:attribtDic];
        self.costDownLabel.attributedText = attStr;
        [self.contentView addSubview:self.costDownLabel];
    }
}

@end
