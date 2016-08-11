//
//  LoginViewController.h
//  RuiZh
//
//  Created by 行 on 16/7/10.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

- (IBAction)settingUrl;
@property (retain, nonatomic) IBOutlet UIButton *btnVersion;
@property (retain, nonatomic) IBOutlet UIView *viewSetting;
@property (retain, nonatomic) IBOutlet UITextField *urlfield;
@property (retain, nonatomic) IBOutlet UIButton *btnSetting;
@property (retain, nonatomic) IBOutlet UINavigationItem *navigationitem;
- (IBAction)actionSetting;


@end
