//
//  TitlesView.h
//  表格
//
//  Created by zzy on 14-5-5.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TitlesView;

@protocol TitlesViewDelegate <NSObject>

-(void)TitlesView:(TitlesView *)TitlesView point:(CGPoint)point;

@end

@interface TitlesView : UIView
@property (nonatomic,strong) NSString *num;
@property (nonatomic,strong) NSString *detail;
@property (nonatomic,assign) id <TitlesViewDelegate> delegate;
@end
