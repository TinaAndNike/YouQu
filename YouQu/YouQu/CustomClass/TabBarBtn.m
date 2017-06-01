//
//  TabBarBtn.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "TabBarBtn.h"

@implementation TabBarBtn

- (void)setHighlighted:(BOOL)highlighted {
    
    
}
    
    //在这里设置图片的显示模式和文字的显示模式以及文字的font
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self.imageView setContentMode:UIViewContentModeTop];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        self.titleLabel.font = [UIFont systemFontOfSize:10 * SPHEIGHT];
    }
    return self;
}
    
    //重新给按钮的图片设置frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 7, self.frame.size.width , self.frame.size.height );
}

    //重新设置label的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(0, 15, self.frame.size.width, self.frame.size.height);
}

@end
