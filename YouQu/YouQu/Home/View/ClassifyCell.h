//
//  ClassifyCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/1.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyCell : UITableViewCell

@property (nonatomic, copy)void(^classifyBlock)();

//创建分类按钮
- (void)createClassifyBtn;

@end
