//
//  XMLPageControl.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/5.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "XMLPageControl.h"
#define dotW 5
#define magrin 4

@implementation XMLPageControl

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //计算圆点间距
    CGFloat marginX = dotW + magrin;
    
    //计算整个pageControll的宽度
    CGFloat newW = (self.subviews.count - 1 ) * marginX;
    
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    
    //设置居中
    CGPoint center = self.center;
    center.x = self.superview.center.x;
    self.center = center;
    
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        if (i == self.currentPage) {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
        }else {
            [dot setFrame:CGRectMake(i * marginX, dot.frame.origin.y, dotW, dotW)];
        }
    }
    
    for (int i = 0; i < self.subviews.count; i ++) {
        
        UIImageView * subImageView = self.subviews[i];
        CGSize size;
        size.width = 5;
        size.height = 5;
        subImageView.frame = CGRectMake(subImageView.frame.origin.x, subImageView.frame.origin.y, size.width, size.height);
    }
}


@end
