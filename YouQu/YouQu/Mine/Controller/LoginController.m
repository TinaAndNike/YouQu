//
//  LoginController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/22.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "LoginController.h"
#import "RegisterController.h"

@interface LoginController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initXibContro];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化Xib控件
- (void)initXibContro {

    _loginBtn.layer.cornerRadius = 20;
    _loginBtn.clipsToBounds = YES;
    
    _registBtn.layer.cornerRadius = 20;
    _registBtn.clipsToBounds = YES;
    
    
}

- (IBAction)loginBackClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 登陆注册按钮点击事件
//登陆按钮点击事件
- (IBAction)loginBtnClick:(UIButton *)sender {
}
//注册按钮点击事件
- (IBAction)registerBtnClick:(UIButton *)sender {
    
    [self.navigationController pushViewController:[RegisterController new] animated:YES];
}

#pragma mark - 隐藏nav
- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

//注销键盘响应事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [_userTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

@end
