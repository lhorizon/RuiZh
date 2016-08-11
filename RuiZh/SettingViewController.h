//
//  SettingViewController.h
//  RuiZh
//
//  Created by 行 on 16/8/8.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RembPwdKey @"rmb_pwd"

@interface SettingViewController : ViewController<UIAlertViewDelegate>
- (IBAction)aboutAction;
- (IBAction)userReset;

@end
