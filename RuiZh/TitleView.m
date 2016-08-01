//
//  TimeView.m
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "TitleView.h"
#import "MyLabel.h"
#import "TimeCell.h"
@interface TitleView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *times;
@end

@implementation TitleView

- (id)initWithFrame:(CGRect)frame cellDecs: (NSMutableArray * ) cellDecs
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.times=[NSMutableArray array];
//        for (int i=0; i<=kCount; i++) {
//            int currentTime=i*30+510;
//            NSString *time=[NSString stringWithFormat:@"%d:%02d",currentTime/60,currentTime%60];
//            [self.times addObject:time];
//        }
        
         self.timeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
         self.timeTableView.delegate=self;
         self.timeTableView.dataSource=self;
         self.timeTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
         self.timeTableView.userInteractionEnabled=NO;
        [self addSubview: self.timeTableView];
    }
    
    self.cellDecs = cellDecs;
    return self;
}
+ (id)initWithFrame:(CGRect)frame cellDecs: (NSMutableArray * ) cellDecs
{
    TitleView * timeview = [[TitleView alloc] initWithFrame:frame cellDecs:cellDecs];
    return timeview;
}
-(id) init {
    
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellDecs count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    TimeCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[TimeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.timeLabel.text=self.cellDecs[indexPath.row];
    
    return cell;
}
@end
