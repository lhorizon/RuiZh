//
//  MyCell.h
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//
#define kWidthMargin 1
#define kHeightMargin 3
#import <UIKit/UIKit.h>

@class MyCell,HeadView,MeetModel,HeadView;

@protocol MyCellDelegate <NSObject>

-(void)myHeadView:(HeadView *)headView point:(CGPoint)point;

@end

@interface MyCell : UITableViewCell
@property (nonatomic,assign) id<MyCellDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *currentTime;
@property (nonatomic,assign) int index;
@property unsigned long count;
@end
