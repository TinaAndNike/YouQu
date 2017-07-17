//
//  TabBarView.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "TabBarView.h"
#import "TabBarBtn.h"

@interface TabBarView()

@property (nonatomic, weak)UIButton * selectBtn;

@end

@implementation TabBarView

- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andBG:(UIImage *)bg andSelectedBG:(UIImage *)seletedBG andTitle:(NSString *)title {
    
    
    TabBarBtn * btn = [[TabBarBtn alloc] init];
    
    [btn setImage:bg forState:UIControlStateNormal];
    [btn setImage:seletedBG forState:UIControlStateSelected];
    
    //[btn setBackgroundImage:bg forState:UIControlStateNormal];
   // [btn setBackgroundImage:seletedBG forState:UIControlStateSelected];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:HEXCOLOR(0x595959) forState:UIControlStateNormal];
    //[btn setTitleColor:HEXCOLOR(0xfedd81) forState:UIControlStateSelected];
    
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.subviews.count == 1) {
        
        [self btnClick:btn];
    }
}
    
//专门用来布局子视图，调用父类的方法（重新调整tabBarItem的位置时调用这个方法）
- (void)layoutSubviews {
    
    [super layoutSubviews];
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        
        //取得按钮
        TabBarBtn * btn = self.subviews[i];
        btn.tag = i;
        btn.frame = CGRectMake(i * (self.frame.size.width / count), 0, self.frame.size.width / count, self.frame.size.height);
        
        UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, btn.frame.size.width, 0.5)];
        lineView.backgroundColor = [UIColor grayColor];
        [btn addSubview:lineView];
        
    }
}
    
- (void)btnClick:(TabBarBtn *)btn {
    
    self.selectBtn.selected = NO;
    btn.selected = YES;
    self.selectBtn = btn;
    //判断代理执行
    if ([self.delegate respondsToSelector:@selector(tabBarView:selectedFrom:To:)]) {
        
        [self.delegate tabBarView:self selectedFrom:self.selectBtn.tag To:btn.tag];
    }
}

@end
