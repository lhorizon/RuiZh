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

//soap resuest
@synthesize webData;
@synthesize soapResults;
@synthesize xmlParser;
@synthesize elementFound;
@synthesize matchingElement;
@synthesize conn;
//soap  request

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
    
    [self checkLogin:self.namefield.text pwd:self.pwdfield.text ];
    [self doQuery];
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
- (void) checkLogin:(NSString *) user  pwd:(NSString *) pwd{
//    NSL
    
    NSLog(@"this  is  userinfo: %@",[user stringByAppendingString:pwd] );
}

// 开始查询
- (void)doQuery  {
    NSString *name = _namefield.text;
    NSString *pwd = _pwdfield.text;
    // 设置我们之后解析XML时用的关键字，与响应报文中Body标签之间的getMobileCodeInfoResult标签对应
    matchingElement = @"getMobileCodeInfoResult";
    // 创建SOAP消息，内容格式就是网站上提示的请求报文的实体主体部分
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                         "<soap12:Envelope "
                         "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" "
                         "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" "
                         "xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">"
                         "<soap12:Body>"
                         "<CheckUserLogin xmlns=\"http://WebXml.com.cn/\">"
                         "<user>%@</user>"
                         "<pwd>%@</pwd>"
                         "</CheckUserLogin>"
                         "</soap12:Body>"
                         "</soap12:Envelope>", name, pwd];
    
    // 将这个XML字符串打印出来
    NSLog(@"%@", soapMsg);
    // 创建URL，内容是前面的请求报文报文中第二行主机地址加上第一行URL字段
    NSURL *url = [NSURL URLWithString: @"http://61.4.83.137/rzservice/RZHotelService.asmx"];
    // 根据上面的URL创建一个请求
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%lu", (unsigned long)[soapMsg length]];
    // 添加请求的详细信息，与请求报文前半部分的各字段对应
    [req addValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    // 设置请求行方法为POST，与请求报文第一行对应
    [req setHTTPMethod:@"POST"];
    // 将SOAP消息加到请求中
    [req setHTTPBody: [soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    // 创建连接
    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (conn) {
        webData = [NSMutableData data];
        
    }
}

#pragma mark -
#pragma mark URL Connection Data Delegate Methods

// 刚开始接受响应时调用
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [webData setLength: 0];
}

// 每接收到一部分数据就追加到webData中
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *) data {
    [webData appendData:data];
}

// 出现错误时
-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *) error {
    conn = nil;
    webData = nil;
}

// 完成接收数据时调用
-(void) connectionDidFinishLoading:(NSURLConnection *) connection {
    NSString *theXML = [[NSString alloc] initWithBytes:[webData mutableBytes]
                                                length:[webData length]
                                              encoding:NSUTF8StringEncoding];
    
    // 打印出得到的XML
    NSLog(@"%@", theXML);
    // 使用NSXMLParser解析出我们想要的结果
    xmlParser = [[NSXMLParser alloc] initWithData: webData];
    [xmlParser setDelegate: self];
    [xmlParser setShouldResolveExternalEntities: YES];
    [xmlParser parse];
}


@end
