//
//  DisplaysettingViewController.m
//  RuiZh
//
//  Created by 行 on 16/8/11.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "DisplaysettingViewController.h"

@interface DisplaysettingViewController ()

@end

@implementation DisplaysettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *fontcolor  = [defaults valueForKey:@"fontcolor"];
    [self.colorBtn setTitle:(fontcolor ==nil?@"白色":fontcolor) forState:true ] ;
    [self.colorBtn setTitle:(fontcolor ==nil?@"白色":fontcolor) forState:false ] ;
    
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
- (IBAction)colorAction {
    NSString * title= self.colorBtn.currentTitle;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([title isEqualToString:@"白色" ]){
        [self.colorBtn setTitle:@"黑色" forState:true];
        [self.colorBtn setTitle:@"黑色" forState:false];
        [defaults setObject:@"黑色" forKey:@"fontcolor"];
    }else{
        [self.colorBtn setTitle:@"白色" forState:true];
        [self.colorBtn setTitle:@"白色" forState:false];
        [defaults setObject:@"白色" forKey:@"fontcolor"];
    }
    [defaults synchronize];
}
@end
