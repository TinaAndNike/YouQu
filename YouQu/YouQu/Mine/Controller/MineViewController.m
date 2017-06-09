//
//  MineViewController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/5/31.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "MineViewController.h"
#import "MineheadCell.h"
#import "MineMessageCell.h"
#import "MineFunctionCell.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView * tableView;

@property (nonatomic, strong)NSArray * functionImageArray;

@property (nonatomic, strong)NSArray * functionSectionTwo;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self buildeTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 隐藏Nav和页面将要出现和消失
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
#pragma mark - 懒加载
- (NSArray *)functionImageArray {

    if (_functionImageArray == nil) {
        
        _functionImageArray = @[@"mineFunc_section1_01",@"mineFunc_section1_02",@"mineFunc_section1_03",@"mineFunc_section1_04",@"mineFunc_section1_05"];
    }
    return _functionImageArray;
}

- (NSArray *)functionSectionTwo {

    if (_functionSectionTwo == nil) {
        
        _functionSectionTwo = @[@"mineFunc_section2_01",@"mineFunc_section2_02",@"mineFunc_section2_03"];
    }
    return _functionSectionTwo;
}

#pragma mark - 建造tableView
- (void)buildeTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = HEXCOLOR(0xf2f2f2);
//    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.sectionHeaderHeight = 0;
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.001)];
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"MineheadCell" bundle:nil] forCellReuseIdentifier:@"headCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"MineMessageCell" bundle:nil] forCellReuseIdentifier:@"messageCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"MineFunctionCell" bundle:nil] forCellReuseIdentifier:@"functionCell"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - tableViewDalegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
    
        return 2;
    } else if (section == 1) {
    
        return 5;
    } else {
    
        return 3;
    }
}

//底部foot的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 20;
}

//每个cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            return 160;
        } else {
        
            return 75;
        }
        
    } else if (indexPath.section == 1) {
        
        return 48;
    } else {
        
        return 48;
    }
}

#pragma mark - 复用cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
           
            MineheadCell * headCell = [tableView dequeueReusableCellWithIdentifier:@"headCell" forIndexPath:indexPath];
            return headCell;
            
        } else {
        
            MineMessageCell * messageCell = [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
            return messageCell;
            
        }
    } else {
    
        MineFunctionCell * functionCell = [tableView dequeueReusableCellWithIdentifier:@"functionCell" forIndexPath:indexPath];
        if (indexPath.section == 1) {
            
            functionCell.functionImageView.image = [UIImage imageNamed:self.functionImageArray[indexPath.row]];
            
        } else {
        
            functionCell.functionImageView.image = [UIImage imageNamed:self.functionSectionTwo[indexPath.row]];
        }
        return functionCell;
    }
}

















@end
