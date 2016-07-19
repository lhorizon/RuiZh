//
//  RoomStatusViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "RoomStatusViewController.h"

@interface RoomStatusViewController ()

@end

@implementation RoomStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadStatusNow];
//    [MBProgressHUD showMessage:@"Loading..."];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadStatusNow{
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=@"/GetFormx";
    NSURL *url=[NSURL URLWithString:urlStr];
    NSDictionary * data= [NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    if([[data valueForKey:@"Result"] isEqualToString:@"True"]) {
        
        [MBProgressHUD showSuccess:@"获取成功"];
         NSDictionary * floors= [data valueForKey:@"Data"];
        for (id floor in floors){
            NSDictionary * floorData= floor;
            NSString *floorId= [floorData valueForKey:@"floorid"];
            NSDictionary *units = [floorData valueForKey:@"units"];
        }
    }else{
        [MBProgressHUD showError:[data valueForKey:@"ErrMsg"] ];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
