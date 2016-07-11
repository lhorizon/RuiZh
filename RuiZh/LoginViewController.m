//
//  LoginViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/10.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"

#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RembPwdKey @"rmb_pwd"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoBg;
@property (weak, nonatomic) IBOutlet UITextField *namefield;
@property (weak, nonatomic) IBOutlet UITextField *pwdfield;
@property (weak, nonatomic) IBOutlet UISwitch *rembSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginAction;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //观察者
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(textchanged) name:UITextFieldTextDidChangeNotification object:self.namefield];
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(textchanged) name:UITextFieldTextDidChangeNotification object:self.pwdfield];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.namefield.text  = [defaults valueForKey:UserNameKey];
    self.pwdfield.text  = [defaults valueForKey:PwdKey];
    self.rembSwitch.on  = [defaults boolForKey:RembPwdKey];
    self.loginBtn.enabled =   self.rembSwitch.on;
    
}

- (void) textchanged{
    if(self.namefield.text.length&&self.pwdfield.text.length){
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { 
//    UIViewController *contactVc = segue.destinationViewController;
//    contactVc.title = [NSString stringWithFormat:@"的联系人列表" ];
}

- (IBAction)loginAction {
    //do net request check Userinfo
    
    if (! [self.namefield.text isEqualToString:@"lihang"]) {
        [MBProgressHUD showError:@"账号不存在"];
        return;
    }
    if (! [self.pwdfield.text isEqualToString:@"123"]) {
        [MBProgressHUD showError:@"password error"];
        return;
    }
    [MBProgressHUD showMessage:@"Loading..."];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2*NSEC_PER_SEC)) , dispatch_get_main_queue(),^{
        [MBProgressHUD hideHUD];
        [self performSegueWithIdentifier:@"LoginToHome" sender:nil];
        
    });
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(self.rembSwitch.isOn){
        [defaults setObject:_namefield.text forKey:UserNameKey];
        [defaults setObject:_pwdfield.text forKey:PwdKey];
        [defaults setBool:_rembSwitch.isOn forKey:RembPwdKey];
    }else{
        [defaults setObject:@"" forKey:UserNameKey];
        [defaults setObject:@"" forKey:PwdKey];
        [defaults setBool:NO forKey:RembPwdKey];
    }
    [defaults synchronize];
    
}
@end
