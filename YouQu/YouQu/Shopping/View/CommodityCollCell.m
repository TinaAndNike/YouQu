//
//  CommodityCollCell.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/15.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "CommodityCollCell.h"
#import "CommodityCell.h"

@interface CommodityCollCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;
@end

@implementation CommodityCollCell

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        [self buildeTableView];
    }
    return self;
}

- (void)buildeTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 260 - 20) style:UITableViewStylePlain];
    _tableView.bounces = NO;
    _tableView.scrollEnabled = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 120;
    _tableView.backgroundColor = [UIColor whiteColor];
    [_tableView registerNib:[UINib nibWithNibName:@"CommodityCell" bundle:nil] forCellReuseIdentifier:@"commodityCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.contentView addSubview:_tableView];
}

#pragma mark - 表格视图代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

#pragma mark - 滑动删除方法
//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

//删除的方法
//执行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"删除删除删除删除删除删除删除删除删除");
}

#pragma mark - 复用代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CommodityCell * cell = [tableView dequeueReusableCellWithIdentifier:@"commodityCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"我被选择和了");
}
@end
