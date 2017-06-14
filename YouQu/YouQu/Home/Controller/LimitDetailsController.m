//
//  LimitDetailsController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/14.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "LimitDetailsController.h"
#import "LimitDetailsCell.h"
#import "TimeLimitHeadCell.h"

@interface LimitDetailsController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UIView * nowTimeLimitView;

@property (nonatomic, strong)UIView * nextTimeLimitView;

@property (nonatomic, strong)UITableView * tableView;

@end

@implementation LimitDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildeTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 限时显示
- (void)buildeTimeLimitView {

    _nowTimeLimitView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH / 2, 50)];
    
}

#pragma mark - 搭建tableView
- (void)buildeTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    //注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"LimitDetailsCell" bundle:nil] forCellReuseIdentifier:@"limitDetailsCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TimeLimitHeadCell" bundle:nil] forCellReuseIdentifier:@"timeLimitHeadCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
}

#pragma mark - TbaleViewDalagete
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        return 44;
    } else {
    
        return 129;
    }
}
#pragma mark - 复用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        TimeLimitHeadCell * limitHeadCell = [tableView dequeueReusableCellWithIdentifier:@"timeLimitHeadCell" forIndexPath:indexPath];
        limitHeadCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return limitHeadCell;
        
    } else {
    
        LimitDetailsCell * limitCell = [tableView dequeueReusableCellWithIdentifier:@"limitDetailsCell" forIndexPath:indexPath];
        limitCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return limitCell;
    }
}
























@end
