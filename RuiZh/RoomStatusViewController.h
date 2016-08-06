//
//  RoomStatusViewController.h
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemUtil.h"
#import "CollectionCell.h"
#import "HeadView.h"
#import "MyCell.h"
#import "Roomforecast.h"
#import "TitleView.h"
@interface RoomStatusViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,MyCellDelegate>
@property (retain, nonatomic) IBOutlet UITextField *vrNum;
@property (retain, nonatomic) IBOutlet UITextField *orNum;
@property (retain, nonatomic) IBOutlet UITextField *odNum;
@property (retain, nonatomic) IBOutlet UITextField *vdNum;
@property (retain, nonatomic) IBOutlet UITextField *vmNum;
@property (retain, nonatomic) IBOutlet UITextField *vcNum;
@property (retain, nonatomic) IBOutlet UITextField *roomCount; 
@property (retain, nonatomic) IBOutlet UIView *viewStatusNow;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedStatus;
@property (retain, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;
@property (retain,nonatomic)   NSDictionary * data;
@property (retain,nonatomic)   NSDictionary * stat;
@property (retain,nonatomic)   NSDictionary * statColor;
- (IBAction)backAction:(id)sender;

@property (retain,nonatomic)   NSDictionary * typeNameMap;
@property (retain,nonatomic)   NSMutableDictionary * typeColorMap;
@property (nonatomic,strong)   NSMutableArray * floors;

//房态预测数据
@property (retain,nonatomic)   NSDictionary * dataForecast;
@property (nonatomic,strong)   NSMutableArray * roomAlltype;
@property (nonatomic,strong)   NSMutableArray * typeArray;
@property (nonatomic,strong)   NSMutableArray * dateArray;
@property (nonatomic,strong) UIView *myHeadView;
@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray *meets;
@property (nonatomic,strong) NSMutableArray *currentTime; 
@property (nonatomic,strong) TitleView *timeView;
@property (retain, nonatomic) IBOutlet UIView *tableViewContain;
@property (nonatomic,strong) NSUserDefaults *userinfo;

- (IBAction)chooseBeganAction;
@property (retain, nonatomic) IBOutlet UITextField *textBeganDate;
- (IBAction)refresh:(id)sender;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *refreshBtn;

@end
