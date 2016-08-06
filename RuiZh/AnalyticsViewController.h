//
//  AnalyticsViewController.h
//  RuiZh
//
//  Created by 行 on 16/8/6.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD+MJ.h"
#import "NetUtil.h"
@interface AnalyticsViewController : UIViewController
@property (retain, nonatomic) IBOutlet UISegmentedControl *tabanalytics;
@property (retain, nonatomic) IBOutlet UIView *viewShourufenxi;
@property (retain, nonatomic) IBOutlet UIView *jianbao;
@property (retain, nonatomic) IBOutlet UITextField *textfieldBeginTime;
@property (retain, nonatomic) IBOutlet UITextField *textfieldEndTime;
@property (retain, nonatomic) IBOutlet UIView *jianbaoContainer;
@property (retain, nonatomic) IBOutlet UIView *shouruContainer;

@property   bool   isjianbao;
- (IBAction)mdfBeginTime;
- (IBAction)mdfyEndTime;
@property (retain,nonatomic)   NSDictionary * yeingyejianbaoData;
@property (retain,nonatomic) NSMutableArray * jianbaoTypes;;
@property (retain,nonatomic) NSMutableArray * jianbaodValues;
@property (retain,nonatomic)   NSDictionary * fenxiData;
@end
