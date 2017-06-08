//
//  HotPostCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/6.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "HotPostCell.h"


@interface HotPostCell()

//内容视图
@property (nonatomic, strong)UIView * matterView;

//热帖的出自哪里和图片
@property (nonatomic, strong)UIImageView * postImageView;

@property (nonatomic, strong)UILabel * postLabel;

//点赞视图DotPraise
@property (nonatomic, strong)UIView * praiseView;

//点赞和评论评论按钮和显示个数
@property (nonatomic, assign)BOOL isDotAnimate;


//存储点赞数
@property (nonatomic, assign)int dotPraiseNumber;

@property (nonatomic, strong)UIButton * dotPraiseBtn;

@property (nonatomic, strong)UILabel * dotPraiseLabel;

@property (nonatomic, strong)UIButton * commentBtn;

@property (nonatomic, strong)UILabel * commentLabel;

//显示时间label
@property (nonatomic, strong)UILabel * timeLabel;

//样式一
@property (nonatomic,strong)UILabel * styleOneLabel;

//样式一图片的高度
@property (nonatomic, assign)CGFloat oneStyleImageWidth;

//样式二
@property (nonatomic, strong)UILabel * styleTwolabel;

@property (nonatomic, strong)UILabel * styleTwoDetailsLabel;

@property (nonatomic, strong)UIImageView * styleTwoImageView;


@end
@implementation HotPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//oneStyle
- (void)initStyleOnelabelText:(NSString *)text imageViewArray:(NSArray *)array postImage:(UIImage *)postImage postText:(NSString *)postText DotText:(NSString *)dotText commentText:(NSString *)commentText oneStyleDymHight:(void (^)(CGFloat hight))hight{

    [Tool solveReuseCellWithView:self.contentView];
    
    _isDotAnimate = YES;
    
    //转换点赞数为int
    _dotPraiseNumber = [dotText intValue];
    NSLog(@"--------%d",_dotPraiseNumber);
    
    _matterView = [[UIView alloc] init];
    [self.contentView addSubview:_matterView];
    
    //帖子样式显示
    _styleOneLabel = [Tool giveMeAdaptiveLabelWithPoint:CGPointMake(13 * SPWIDTH,14 * SPHEIGHT) Width:SCREEN_WIDTH - (23 * SPWIDTH) text:text textColor:[UIColor blackColor] backgroudColor:nil fontSize:19 weight:UIFontWeightRegular numberOfLines:2];
    
    [_matterView addSubview:_styleOneLabel];
    
    _oneStyleImageWidth = (SCREEN_WIDTH - ((13 * SPWIDTH) * 2) - ((9 * SPWIDTH) * 2)) / 3;
    for (int i = 0; i < 3; i++) {
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake((13 * SPWIDTH) + ((9 * SPWIDTH) * i) + (_oneStyleImageWidth * i), CGRectGetMaxY(_styleOneLabel.frame) + (12 * SPHEIGHT), _oneStyleImageWidth, _oneStyleImageWidth)];
        imageView.layer.cornerRadius = 3.0;
        imageView.clipsToBounds = YES;
        imageView.image = array[i];
        [_matterView addSubview:imageView];
    }
    
    //在这里赋予_matterViewFrame
    _matterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(_styleOneLabel.frame) + (12 * SPHEIGHT) + _oneStyleImageWidth);
    //动态传高度,用block
    hight(_matterView.frame.size.height + (50 * SPHEIGHT));
    
    //点赞视图
    [self initPraiseViewWithDotText:dotText commentText:commentText PostViewWihtImage:postImage postTitleText:postText];
}

//twoStyle
- (void)initStyleTwolabelText:(NSString *)text detailsText:(NSString *)detailsText twoStyleImage:(UIImage *)twoImage postImage:(UIImage *)postImage postText:(NSString *)postText DotText:(NSString *)dotText commentText:(NSString *)commentText oneStyleDymHight:(void(^)(CGFloat hight)) hight {

    [Tool solveReuseCellWithView:self.contentView];
    
    _isDotAnimate = YES;
    
    //转换点赞数为int
    _dotPraiseNumber = [dotText intValue];
    NSLog(@"--------%d",_dotPraiseNumber);
    
    _matterView = [[UIView alloc] init];
    [self.contentView addSubview:_matterView];
    
    //帖子样式二
    CGFloat twoLabelWidth = SCREEN_WIDTH - (26 * SPWIDTH) - (155 * SPWIDTH);
    _styleTwolabel = [Tool giveMeAdaptiveLabelWithPoint:CGPointMake(13 * SPWIDTH,16 * SPHEIGHT) Width:twoLabelWidth text:text textColor:[UIColor blackColor] backgroudColor:nil fontSize:19 weight:UIFontWeightRegular numberOfLines:2];
    [_matterView addSubview:_styleTwolabel];
    
    _styleTwoDetailsLabel = [Tool giveMeAdaptiveLabelWithPoint:CGPointMake(13 * SPWIDTH, CGRectGetMaxY(_styleTwolabel.frame) + 16 * SPHEIGHT) Width:twoLabelWidth text:detailsText textColor:[UIColor grayColor] backgroudColor:nil fontSize:15 weight:0 numberOfLines:3];
    [_matterView addSubview:_styleTwoDetailsLabel];
    
    CGFloat styleTwoImageWH = SCREEN_WIDTH - twoLabelWidth - (26 * SPWIDTH) - (26 * SPWIDTH);
    _styleTwoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_styleTwolabel.frame) + 26 * SPWIDTH, 16 * SPHEIGHT, styleTwoImageWH, styleTwoImageWH)];
    _styleTwoImageView.layer.cornerRadius = 5.0;
    _styleTwoImageView.clipsToBounds = YES;
    _styleTwoImageView.image = twoImage;
    [_matterView addSubview:_styleTwoImageView];
    
    //在这里赋予_matterViewFrame
    _matterView.frame = CGRectMake(0, 0, SCREEN_WIDTH, styleTwoImageWH + (16 * SPHEIGHT));
    //动态传高度,用block
    hight(_matterView.frame.size.height + (50 * SPHEIGHT));
    //点赞视图
    [self initPraiseViewWithDotText:dotText commentText:commentText PostViewWihtImage:postImage postTitleText:postText];
}

//点赞视图

- (void)initPraiseViewWithDotText:(NSString *)dotText commentText:(NSString *)commentText PostViewWihtImage:(UIImage *)postImage postTitleText:(NSString *)postText{

    _praiseView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_matterView.frame), SCREEN_WIDTH, 50 * SPHEIGHT)];
    [self.contentView addSubview:_praiseView];
    
    _dotPraiseBtn = [Tool giveMeAButtonWithRect:ADACGRectMake(13 * SPWIDTH, 16 * SPHEIGHT, 16, 16) title:@"" titleColor:nil barkgroudColor:nil barkgroudImage:[UIImage imageNamed:@"comPraise_normal"] fontOfSize:0];
    [_dotPraiseBtn addTarget:self action:@selector(dotPraiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_dotPraiseBtn setBackgroundImage:[UIImage imageNamed:@"comPraise_select"] forState:UIControlStateSelected];
    [_praiseView addSubview:_dotPraiseBtn];
    
    _dotPraiseLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(_dotPraiseBtn.frame) + 9 * SPWIDTH, 16 * SPHEIGHT, 24, 16) text:dotText textColor:[UIColor grayColor] backgroudColor:nil fontSize:12 weight:0];
    [_praiseView addSubview:_dotPraiseLabel];
    
    _commentBtn = [Tool giveMeAButtonWithRect:ADACGRectMake(CGRectGetMaxX(_dotPraiseLabel.frame) + 20 * SPWIDTH, 16 * SPHEIGHT, 16, 16) title:@"" titleColor:nil barkgroudColor:nil barkgroudImage:[UIImage imageNamed:@"comComment"] fontOfSize:0];
    [_commentBtn addTarget:self action:@selector(dotPraiseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_praiseView addSubview:_commentBtn];
    
    _commentLabel = [Tool giveMeALabelWithRect:ADACGRectMake(CGRectGetMaxX(_commentBtn.frame) + 9 * SPWIDTH, 16 * SPHEIGHT, 24, 16) text:commentText textColor:[UIColor grayColor] backgroudColor:nil fontSize:12 weight:0];
    [_praiseView addSubview:_commentLabel];
    
    CGFloat postLabelW = [Tool getWidthWithTitle:postText fontSize:12 weigt:0];
    _postLabel = [Tool giveMeALabelWithRect:CGRectMake(SCREEN_WIDTH - (13 * SPWIDTH) - (postLabelW), 16 * SPHEIGHT, postLabelW, 18 * SPHEIGHT) text:postText textColor:[UIColor grayColor] backgroudColor:nil fontSize:12 weight:0];
    [_praiseView addSubview:_postLabel];
    
    _postImageView = [[UIImageView alloc] initWithFrame:ADACGRectMake(CGRectGetMinX(_postLabel.frame) - (9 * SPWIDTH) - (18 * SPWIDTH), 16 * SPHEIGHT, 18, 18)];
    _postImageView.image = postImage;
    [_praiseView addSubview:_postImageView];

}

//点赞评论按钮点击事件
- (void)dotPraiseBtnClick:(UIButton *)btn {

    if (btn == _dotPraiseBtn) {
        
        [self dotPraiseAnimateWithBtn:btn];
        
    } else {
    
        NSLog(@"进入评论区");
    }
}

//点赞动画
- (void)dotPraiseAnimateWithBtn:(UIButton *)btn {

    [UIView animateWithDuration:0.33 animations:^{
        
        if (_isDotAnimate == YES) {
            
            btn.selected = YES;
            _isDotAnimate = NO;
            _dotPraiseLabel.text = [NSString stringWithFormat:@"%d",_dotPraiseNumber+1];
            
        } else {
            
            btn.selected = NO;
            _isDotAnimate = YES;
            _dotPraiseLabel.text = [NSString stringWithFormat:@"%d",_dotPraiseNumber];
        }
        btn.transform = CGAffineTransformMakeScale(0.4, 0.4);
        btn.transform = CGAffineTransformMakeScale(1.6, 1.6);
        btn.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    }];
}

@end
