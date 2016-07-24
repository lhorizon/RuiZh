//
//  TimeView.m
//  表格
//
//  Created by zzy on 14-5-6.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "TimeView.h"
#import "MyLabel.h"
#import "TimeCell.h"
@interface TimeView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *times;
@end

@implementation TimeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
   
        
         self.timeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
         self.timeTableView.delegate=self;
         self.timeTableView.dataSource=self;
         self.timeTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
         self.timeTableView.userInteractionEnabled=NO;
        [self addSubview: self.timeTableView];
        
    }
    return self;
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
