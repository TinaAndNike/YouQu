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

+ (UILabel *)giveMeAdaptiveLabelWithPoint:(CGPoint)point Width:(CGFloat)width text:(NSString *)text textColor:(UIColor *)textColor backgroudColor:(UIColor *)bgColor fontSize:(CGFloat)fontSize weight:(CGFloat)weigt numberOfLines:(int)numberLines;

+ (UIButton *)giveMeAButtonWithRect:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor barkgroudColor:(UIColor *)bgColor barkgroudImage:(UIImage *)image fontOfSize:(CGFloat) fontSize;
//自适应宽度
+ (CGFloat)getWidthWithTitle:(NSString *)title fontSize:(CGFloat )fontSize weigt:(CGFloat)weigt;

+ (void)solveReuseCellWithView:(UIView *)superView;

//特殊自适应宽度
+ (CGFloat)specialAdaptionLabelWidthTitleString:(NSString *)string fontSize:(CGFloat )fontSize weigt:(CGFloat)weigt;

@end
