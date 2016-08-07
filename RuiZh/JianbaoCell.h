//
//  JianbaoCell.h
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//
#define kWidthMargin 1
#define kHeightMargin 3
#import <UIKit/UIKit.h>

@class JianbaoCell,HeadView,MeetModel,HeadView;

@protocol JianbaoCellDelegate <NSObject>

-(void)myHeadView:(HeadView *)headView point:(CGPoint)point;

@end

@interface JianbaoCell : UITableViewCell
@property (nonatomic,assign) id<JianbaoCellDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *currentTime;
@property (nonatomic,assign) int index;
@property unsigned long count;
@end
