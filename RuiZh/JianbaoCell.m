//
//  JianbaoCell.m
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//


#import "JianbaoCell.h"
#import "HeadView.h"
#import "MeetModel.h"
@interface JianbaoCell()<HeadViewDelegate>

@end

@implementation JianbaoCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        for(int i=0;i<200;i++){
            
            HeadView *headView=[[HeadView alloc]initWithFrame:CGRectMake(i*100, 0, 100-kWidthMargin, 40+kHeightMargin)];
            headView.delegate=self;
            headView.backgroundColor=[UIColor whiteColor];
            [self.contentView addSubview:headView];
        }
        
    }
    return self;
}
-(void)headView:(HeadView *)headView point:(CGPoint)point
{
    if([self.delegate respondsToSelector:@selector(myHeadView:point:)]){
        
        [self.delegate myHeadView:headView point:point];
    }
    
}
-(void)setCurrentTime:(NSMutableArray *) roomAllType
{
    _currentTime = roomAllType;
    self.count=[self.currentTime count];
    if(self.count>0){
        NSLog(@"contentView.subviews 个数：%lu",(unsigned long)[self.contentView.subviews count]);
        for(int i=0;i<self.count;i++){
            
            //            MeetModel *model=currentTime[i];
            
            HeadView *headView=(HeadView *)self.contentView.subviews[0];
            if(i==0){
                headView.backgroundColor=[UIColor grayColor];
                
                [headView setNum:[NSString stringWithFormat:@"%@",[self.currentTime objectAtIndex:0]]];
            }else{
                headView.backgroundColor=[UIColor whiteColor];
                HeadView *leftHeadView =self.contentView.subviews[i];
                if(headView!=leftHeadView) leftHeadView.backgroundColor=[UIColor whiteColor];
                [leftHeadView setNum:[NSString stringWithFormat:@"%@",[self.currentTime objectAtIndex:i]]];                 
            }
            
        }
    }else{
        
        for(HeadView *headView in self.contentView.subviews){
            
            headView.backgroundColor=[UIColor whiteColor];
        }
    }
    
    //    int count=roomAllType.count;
    //    if(count>0){
    //        for(int i=0;i<count;i++){
    //
    //            NSDictionary *model=roomAllType[i];
    //
    //            HeadView *headView;
    ////            if([model.meetRoom isEqualToString:@"000"]){
    ////
    ////                headView=(HeadView *)self.contentView.subviews[0];
    ////            }else{
    ////
    ////                NSArray *room=[model.meetRoom componentsSeparatedByString:@"0"];
    //                headView=(HeadView *)self.contentView.subviews[1];
    ////            }
    ////            self.
    //            headView.backgroundColor=[UIColor redColor];
    //            [headView setNum:@"1"];
    //            for(HeadView *leftHeadView in self.contentView.subviews){
    //
    //                if(headView!=leftHeadView) leftHeadView.backgroundColor=[UIColor whiteColor];
    //            }
    //        }
    //    }else{
    //
    //        for(HeadView *headView in self.contentView.subviews){
    //
    //            headView.backgroundColor=[UIColor whiteColor];
    //        }
    //    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
