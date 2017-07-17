//
//  RegisterController.m
//  YouQu
//
//  Created by 夏梦雷 on 17/6/22.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    _registerBtn.layer.cornerRadius = 20;
    _registerBtn.clipsToBounds = YES;
}

- (IBAction)registerBlackBtnClick:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [_userTextField resignFirstResponder];
    [_yanzhengTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

@end
