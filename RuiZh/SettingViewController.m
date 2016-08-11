//
//  SettingViewController.m
//  RuiZh
//
//  Created by 行 on 16/8/8.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [super dealloc];
}
- (IBAction)aboutAction {
    UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"瑞中酒店移动助手" message:@"瑞中酒店助手，致力于解决酒店管理一体化，打造一流的酒店管理系统" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//    alert.title = @"瑞中酒店移动助手";
//    alert.message =@"瑞中酒店助手，致力于解决酒店管理一体化，打造一流的酒店管理系统";
//    alert
    [alert show];
    
}

- (IBAction)userReset {
      NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:false forKey:RembPwdKey];
    [defaults setObject:@"" forKey:UserNameKey];
    [defaults setObject:@"" forKey:PwdKey];
    [defaults synchronize];
    [self performSegueWithIdentifier:@"reset" sender:nil];
//    LoginViewController *lv = [[LoginViewController alloc]init];
//    [self.navigationController 	pushViewController:lv animated:true];
}
@end
