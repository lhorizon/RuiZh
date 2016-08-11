//
//  HomeViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/10.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回"; 
    self.titlebar.backBarButtonItem = backItem;
    [self.titlebar.backBarButtonItem  setTintColor: [UIColor whiteColor]];
    self.navigationItem.hidesBackButton = YES;
    self.userinfo = [NSUserDefaults standardUserDefaults];
    [self checkPermission];
    
}

-(void) checkPermission{
    
 
    
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
    [info setObject:@"no" forKey:@"updateable"];
    
    self.funts = [[NSMutableArray alloc] init];
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=[NSString stringWithFormat:@"/GetUserRoles?emp=%@",[self.userinfo valueForKey:@"name"]];
    NSDictionary * data= [NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    if([[data valueForKey:@"Result"] isEqualToString:@"True"]){
        NSArray* funtData= [data valueForKey:@"Data"];
        for (NSDictionary* item in funtData) {
            NSString * funt = [item valueForKey:@"funt"];
            [self.funts addObject:funt];
            if([funt isEqualToString:@"0902"]){
                [self.viewFT setHidden:false];
            }
            if([funt isEqualToString:@"0903"]){
                
                [info setObject:@"yes" forKey:@"updateable"];
            }
            if([funt isEqualToString:@"0904"]){
                
                [self.viewBB setHidden:false];
            }
        }
        
        
    }
    [info synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
- (IBAction)queryRoomStatus {
}


- (IBAction)actionRoomstatus {
//self.navigationController pushViewController:
// animated:YES];
    
    
}

@end
