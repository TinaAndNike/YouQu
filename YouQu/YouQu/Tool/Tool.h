//
//  Tool.h
//  HalfSugar
//
//  Created by 夏梦雷 on 17/3/28.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Tool : NSObject

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIView *)giveMeALineWithColor:(UIColor *)color;

+ (UILabel *)giveMeALabelWithRect:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor backgroudColor:(UIColor *)bgColor fontSize:(CGFloat)fontSize weight:(CGFloat)weigt;

+ (UIButton *)giveMeAButtonWithRect:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor barkgroudColor:(UIColor *)bgColor barkgroudImage:(UIImage *)image fontOfSize:(CGFloat) fontSize;

+ (void)solveReuseCellWithView:(UIView *)superView;

@end
