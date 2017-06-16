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
    if (bgColor == nil) {
        
        label.backgroundColor = [UIColor clearColor];
    } else {
    
         label.backgroundColor = bgColor;
    }
    if (weigt == 0) {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT];
    } else {
    
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT weight:weigt];
    }
    
    return label;
}

+ (UILabel *)giveMeAdaptiveLabelWithPoint:(CGPoint)point Width:(CGFloat)width text:(NSString *)text textColor:(UIColor *)textColor backgroudColor:(UIColor *)bgColor fontSize:(CGFloat)fontSize weight:(CGFloat)weigt numberOfLines:(int)numberLines{

    UILabel * label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    if (bgColor == nil) {
        
        label.backgroundColor = [UIColor clearColor];
    } else {
        
        label.backgroundColor = bgColor;
    }
    if (weigt == 0) {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT];
    } else {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT weight:weigt];
    }
    label.numberOfLines = numberLines;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize adaptiveSize = CGSizeMake(width, MAXFLOAT);
    CGSize labelSize = [label sizeThatFits:adaptiveSize];
    label.frame = CGRectMake(point.x, point.y, labelSize.width, labelSize.height);
    return label;
}

//特殊自适应宽度
+ (CGFloat)specialAdaptionLabelWidthTitleString:(NSString *)string fontSize:(CGFloat)fontSize weigt:(CGFloat)weigt {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = string;
    if (weigt == 0) {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT];
    } else {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT weight:weigt];
    }

    [label sizeToFit];
    return label.frame.size.width;
}

+ (UIButton *)giveMeAButtonWithRect:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor barkgroudColor:(UIColor *)bgColor barkgroudImage:(UIImage *)image fontOfSize:(CGFloat) fontSize{

    UIButton * btn = [[UIButton alloc] initWithFrame:rect];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    if (bgColor != nil) {
        
        [btn setBackgroundColor:bgColor];
    }
    if (image != nil) {
        
        [btn setBackgroundImage:image forState:UIControlStateNormal];
    }
    if (fontSize != 0) {
        
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT];
    }
    
    return btn;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title fontSize:(CGFloat )fontSize weigt:(CGFloat)weigt{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    
    if (weigt == 0) {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT];
    } else {
        
        label.font = [UIFont systemFontOfSize:fontSize * SPHEIGHT weight:weigt];
    }
    [label sizeToFit];
    return label.frame.size.width;
}

+ (void)solveReuseCellWithView:(UIView *)superView {

    for (UIView * view in superView.subviews) {
        
        if ([view isKindOfClass:[UIView class]]) {
            
            [view removeFromSuperview];
        }
        
    }
}









@end
