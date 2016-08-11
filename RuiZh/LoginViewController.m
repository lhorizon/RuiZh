//
//  LoginViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/10.
//  Copyright © 2016年 lihang personal. All rights reserved.
//test github
#import "LoginViewController.h"
#import "MBProgressHUD+MJ.h"
#import "NetUtil.h"

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
@property (nonatomic,strong) NSString *hosturl;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //观察者
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(textchanged) name:UITextFieldTextDidChangeNotification object:self.namefield];
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(textchanged) name:UITextFieldTextDidChangeNotification object:self.pwdfield];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.hosturl = [defaults valueForKey:@"host"];
    self.urlfield.text = (self.hosturl ==nil||[self.hosturl isEqualToString:@""])?defaultDomain:self.hosturl;
    if([defaults boolForKey:RembPwdKey]){
    self.namefield.text  = [defaults valueForKey:UserNameKey];
    self.pwdfield.text  = [defaults valueForKey:PwdKey];
    }
    self.rembSwitch.on  = [defaults boolForKey:RembPwdKey];
    self.loginBtn.enabled =   self.rembSwitch.on;
    self.namefield.delegate  = self;
    self.pwdfield.delegate  = self;
    self.urlfield.delegate = self;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0] ];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *versionname = [@"版本号 " stringByAppendingString: [infoDictionary objectForKey:@"CFBundleShortVersionString"] ];
    [self.btnVersion setTitle: versionname forState:UIControlStateNormal] ;
    self.navigationitem.hidesBackButton = YES;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
//当点击键盘上return按钮的时候调用
{
    //代理记录了当前正在工作的UITextField的实例，因此你点击哪个UITextField对象，形参就是哪个UITextField对象
    [textField resignFirstResponder];//键盘回收代码
    return YES;
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
    
    [self checkLogin:self.namefield.text pwd:self.pwdfield.text ];
    [self getData];
  
}
- (void) checkLogin:(NSString *) user  pwd:(NSString *) pwd{
//    NSL
    
    NSLog(@"this  is  userinfo: %@",[user stringByAppendingString:pwd] );
}


//发起http 请求
-(void) getData{
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=[NSString stringWithFormat:@"/CheckUserLogin?user=%@&pwd=%@",_namefield.text,_pwdfield.text];
    NSURL *url=[NSURL URLWithString:urlStr];
    NSDictionary * data= [NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    if([[data valueForKey:@"Result"] isEqualToString:@"True"]) {
         
        [MBProgressHUD showSuccess:@"登录成功"];
        [self performSegueWithIdentifier:@"LoginToHome" sender:nil];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:_namefield.text forKey:UserNameKey];
        [defaults setObject:_pwdfield.text forKey:PwdKey];
        if(self.rembSwitch.isOn){
            [defaults setBool:_rembSwitch.isOn forKey:RembPwdKey];
        }else{
//            [defaults setObject:@"" forKey:UserNameKey];
//            [defaults setObject:@"" forKey:PwdKey];
            [defaults setBool:NO forKey:RembPwdKey];
        }
        [defaults synchronize];

    }else{
           [MBProgressHUD showError:@"登录失败"];
    }
}



- (IBAction)settingUrl {
    [self.btnVersion setHidden: true];
    [self.viewSetting setHidden:false];
}
- (void)dealloc { 
    [_navigationitem release];
    [super dealloc];
}
- (IBAction)actionSetting {
    [self.btnVersion setHidden: false];
    [self.viewSetting setHidden:true];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.urlfield.text forKey:@"host"];
    [defaults synchronize];
//    NetUtil.
}
@end
