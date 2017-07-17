//
//  RegisterController.h
//  YouQu
//
//  Created by 夏梦雷 on 17/6/22.
//  Copyright © 2017年 夏梦雷. All rights reserved.
//

#import "RootDetailsController.h"

@interface RegisterController : RootDetailsController
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *yanzhengTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end
