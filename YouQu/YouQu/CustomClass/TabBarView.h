//
//  TabBarView.h
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBarView;
    @protocol TabBarViewDelegate <NSObject>
    
- (void) tabBarView:(TabBarView *)tabBarView selectedFrom:(NSInteger)from To:(NSInteger)to;
    
    @end


@interface TabBarView : UIView
    
    @property (nonatomic, weak) id<TabBarViewDelegate>delegate;
    
- (void)addButtonWithImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andBG:(UIImage *)bg andSelectedBG:(UIImage *)seletedBG andTitle:(NSString *)title;

@end
