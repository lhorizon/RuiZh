//
//  TimeView.h
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//
#define kHeightMargin 3
#import <UIKit/UIKit.h>

@interface TitleView : UIView
@property (nonatomic,strong) UITableView *timeTableView;
@property (nonatomic,strong) NSMutableArray  *cellDecs;
@end
