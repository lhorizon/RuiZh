//
//  AnalyticsViewController.m
//  RuiZh
//
//  Created by 行 on 16/8/6.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "AnalyticsViewController.h"

@interface AnalyticsViewController ()

@end

@implementation AnalyticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tabanalytics addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged ];
}
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            
            [self.jianbao setHidden:NO];
            [self.viewShourufenxi setHidden:YES];
            break;
        case 1:
            [self.jianbao setHidden:YES];
            [self.viewShourufenxi setHidden:NO];
            break;
            
    }
}
//加载营业简报
-(void) loadYingyeJianbao:(NSString *) dtstart dtend:(NSString *) dtend {
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=[NSString stringWithFormat:@"/GetBusinessLevelReportData?dtstart=%@&dtend=％@",dtstart,dtend];
    self.yeingyejianbaoData= [NetUtil doGetSync:urlStr];
    
    
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
@end
