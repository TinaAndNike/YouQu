//
//  HotPostCell.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/6.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotPostCell : UITableViewCell

//样式一
- (void)initStyleOnelabelText:(NSString *)text imageViewArray:(NSArray *)array postImage:(UIImage *)image postText:(NSString *)postText DotText:(NSString *)dotText commentText:(NSString *)commentText oneStyleDymHight:(void (^)(CGFloat hight))hight;

//样式二
- (void)initStyleTwolabelText:(NSString *)text detailsText:(NSString *)detailsText twoStyleImage:(UIImage *)twoImage postImage:(UIImage *)postImage postText:(NSString *)postText DotText:(NSString *)dotText commentText:(NSString *)commentText oneStyleDymHight:(void(^)(CGFloat hight)) hight;

@end
