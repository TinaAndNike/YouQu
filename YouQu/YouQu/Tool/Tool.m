//
//  Tool.m
//  HalfSugar
//
//  Created by 夏梦雷 on 17/3/28.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (UIImage *)imageWithColor:(UIColor *)color {

    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsGetCurrentContext();
    return image;
}

+ (UIView *)giveMeALineWithColor:(UIColor *)color {

    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = color;
    return lineView;
}

+ (UILabel *)giveMeALabelWithRect:(CGRect)rect text:(NSString *)text textColor:(UIColor *)textColor backgroudColor:(UIColor *)bgColor fontSize:(CGFloat)fontSize weight:(CGFloat)weigt {

    UILabel * label = [[UILabel alloc] initWithFrame:rect];
    label.text = text;
    label.textColor = textColor;
    label.backgroundColor = bgColor;
    label.font = [UIFont systemFontOfSize:fontSize weight:weigt];
    return label;
}

@end
