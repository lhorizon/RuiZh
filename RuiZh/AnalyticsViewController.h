//
//  AnalyticsViewController.h
//  RuiZh
//
//  Created by 行 on 16/8/6.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD+MJ.h"
#import "SystemUtil.h"
#import "CollectionCell.h"
#import "HeadView.h"
#import "JianbaoCell.h"
#import "Roomforecast.h"
#import "TitleView.h"
#import "TitlesView.h"
@interface AnalyticsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,JianbaoCellDelegate>
@property (retain, nonatomic) IBOutlet UISegmentedControl *tabanalytics;

@property (retain, nonatomic) IBOutlet UITextField *textfieldBeginTime;
@property (retain, nonatomic) IBOutlet UITextField *textfieldEndTime;

@property (retain, nonatomic) IBOutlet UIView *jianbaoContainer;
@property (retain, nonatomic) IBOutlet UIView *shouruContainer;

@property   bool   isjianbao;
- (IBAction)mdfBeginTime;
- (IBAction)mdfyEndTime;
//简报
//用于存储简报信息
@property (retain,nonatomic)   NSMutableArray * yeingyejianbaoData;
//用于存储简报标题
@property (retain,nonatomic) NSMutableArray * jianbaoTitles;
//用于存储简报每行内容
@property (retain,nonatomic) NSMutableArray * jianbaodValues;
//日期列表
@property (retain,nonatomic) NSMutableArray * jianbaoDatelist;

//title view 
@property (nonatomic,strong) UIView *myHeadView;
//内容表格
@property (nonatomic,strong) UITableView *contentTableView;
//时间栏目 第一列
@property (nonatomic,strong) TitleView *jianbaotimeView;


//分析统计
//用于存储分析信息
@property (retain,nonatomic)   NSDictionary * fenxiData;
@end
