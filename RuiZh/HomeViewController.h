//
//  HomeViewController.h
//  RuiZh
//
//  Created by 行 on 16/7/10.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "SettingViewController.h"
#import "SystemUtil.h"
@interface HomeViewController : UIViewController
@property (retain, nonatomic) IBOutlet UINavigationItem *titlebar;
- (IBAction)goSetting;

@property (nonatomic,strong) NSUserDefaults *userinfo;
@property (nonatomic,strong) NSMutableArray *funts;
@property (retain, nonatomic) IBOutlet UIView *viewFT;
@property (retain, nonatomic) IBOutlet UIView *viewBB;

@property (retain, nonatomic) IBOutlet UIView *viewRoomStatus;
@end
