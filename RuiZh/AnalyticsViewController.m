//
//  AnalyticsViewController.m
//  RuiZh
//
//  Created by 行 on 16/8/6.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "AnalyticsViewController.h"

@interface AnalyticsViewController ()
#define kWidth 100
#define kHeight 40
@end

@implementation AnalyticsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isjianbao = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tabanalytics addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged ];

    //    self.toaday=[dateFormatter stringFromDate:epochNSDate];
    //    self.textBeganDate.text = self.toaday;
    NSDate *epochNSDate = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today =[dateFormatter stringFromDate:epochNSDate];
    self.textfieldBeginTime.text =[ @"" stringByAppendingFormat:@"%@", [dateFormatter stringFromDate:[SystemUtil computeDate:today days:-10] ]];
//    NSData be
    
    self.textfieldEndTime.text = today;
    
    
    [self loadYingyeJianbao:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
    
}
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            self.isjianbao = YES;
            [self.jianbaoContainer setHidden:NO];
            [self.shouruContainer setHidden:YES];
            [self loadYingyeJianbao:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
            break;
        case 1:
            self.isjianbao = NO;
            [self.jianbaoContainer setHidden:YES];
            [self.shouruContainer setHidden:NO];
            break;
            
    }
}
//加载营业简报
-(void) loadYingyeJianbao:(NSString *) dtstart dtend:(NSString *) dtend {
    [MBProgressHUD showMessage:@"加载"];
    NSString *urlStr=[NSString stringWithFormat:@"/GetBusinessLevelReportData?dtstart=%@&dtend=%@",dtstart,dtend];
    NSDictionary *data =[NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    
    if(data!=nil&&[@"True" isEqualToString:[data valueForKey:@"Result"]]){
        [MBProgressHUD showSuccess:@"获取成功"];
        self.yeingyejianbaoData = [data valueForKey:@"Data"];
        [self dealJianbaoData];

        [self.jianbaoContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        UIView *tableViewHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,  [self.jianbaoTitles count]*kWidth,kHeight)];
        self.myHeadView = tableViewHeadView;
        self.myHeadView.backgroundColor = [UIColor colorWithRed:(float)108.0/255.0f green:(float)147 /255.0f blue:(float)198/255.0f alpha:1.0f];
        
        for(int i=0;i< [self.jianbaoTitles count];i++){
            HeadView *headView=[[HeadView alloc]initWithFrame:CGRectMake(i*kWidth, 10, kWidth, kHeight)];
            headView.num=[self.jianbaoTitles objectAtIndex:i];
            [self.myHeadView addSubview:headView];
        }
        
        UITextField *textMaster = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kWidth+15, kHeight) ];
        textMaster.text =@"    日期";
        textMaster.textColor = [UIColor whiteColor];
        textMaster.backgroundColor = [UIColor colorWithRed:(float)108.0/255.0f green:(float)147 /255.0f blue:(float)198/255.0f alpha:1.0f];
        textMaster.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textMaster.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [self.jianbaoContainer addSubview:textMaster];
//
        UIScrollView *myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(kWidth +15,0, self.view.frame.size.width-kWidth,  self.jianbaoContainer.frame.size.height - self.myHeadView.frame.size.height)];
        
        UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.myHeadView.frame.size.width,myScrollView.frame.size.height ) style:UITableViewStylePlain];
        tableView.delegate=self;
        tableView.dataSource=self;
        tableView.bounces=NO;
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.contentTableView=tableView;
        self.contentTableView.backgroundColor=[UIColor redColor];
//
        [myScrollView addSubview:self.contentTableView];
        myScrollView.bounces=YES;
        myScrollView.contentSize=CGSizeMake(self.myHeadView.frame.size.width,0);
        [self.jianbaoContainer addSubview:myScrollView];
        
        self.jianbaotimeView=[[TitleView alloc] initWithFrame:CGRectMake(0, kHeight+10, kWidth+15, [self.jianbaoDatelist count
                                                                                                   ]*(kHeight+kHeightMargin)) cellDecs:self.jianbaoDatelist];
//        0, kHeight+75.0, kWidth, [self.typeArray count
//                                  ]*(kHeight+kHeightMargin)) cellDecs:self.typeArray
        [self.jianbaoContainer addSubview:self.jianbaotimeView];
        
    }else{
        [MBProgressHUD showError:@"获取失败"];
    }
    
    
}
-(void) dealJianbaoData{
        self.jianbaodValues = [[NSMutableArray alloc] init];
        self.jianbaoDatelist =[[NSMutableArray alloc] init];
        self.jianbaoTitles=[[NSMutableArray alloc] init];
 
    
    if(self.yeingyejianbaoData!=nil&&[self.yeingyejianbaoData count]>0){
//        NSDictionary* item= [self.yeingyejianbaoData objectAtIndex:0];
//        self.jianbaoTitles= [item allKeys];
//        "总营业额": 8869,
//        "房租": 8740,
//        "其它": 129,
//        "总房数": 86,
//        "出租间数": 72,
//        "出租率": 83.72,
//        "平均房价": 121.39,
//        "revpar": 101.63,
//        "总收入": 11603,
//        "本日余额": -5528
        [self.jianbaoTitles addObject:@"总营业额"];
                [self.jianbaoTitles addObject:@"房租"];        [self.jianbaoTitles addObject:@"其它"];        [self.jianbaoTitles addObject:@"总房数"];        [self.jianbaoTitles addObject:@"出租间数"];        [self.jianbaoTitles addObject:@"出租率"];        [self.jianbaoTitles addObject:@"平均房价"];        [self.jianbaoTitles addObject:@"revpar"];        [self.jianbaoTitles addObject:@"总收入"];        [self.jianbaoTitles addObject:@"本日余额"];
        
        for (NSDictionary * colitem  in self.yeingyejianbaoData) {
            [self.jianbaoDatelist addObject:[colitem valueForKey:@"日期"]];
            
            NSMutableArray * col = [[NSMutableArray alloc]init];
            for (NSString * key in self.jianbaoTitles) {
                if(![@"日期" isEqualToString:key])
                [col addObject:[colitem objectForKey:key]];
            }
            [self.jianbaodValues addObject:col];
        }
    }
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    unsigned long count =  [self.jianbaoDatelist count] ;
    return  count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    //
    JianbaoCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[JianbaoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier ] ;
        cell.delegate=self;
        cell.backgroundColor=[UIColor grayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    cell.index=indexPath.row;
    cell.currentTime=[self.jianbaodValues objectAtIndex:indexPath.row];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return self.myHeadView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return kHeight;
}
-(void)myHeadView:(HeadView *)headView point:(CGPoint)point
{
    CGPoint myPoint= [self.contentTableView convertPoint:point fromView:headView];
    
    [self convertRoomFromPoint:myPoint];
}
-(void)convertRoomFromPoint:(CGPoint)ponit
{
    //    NSString *roomNum=[NSString stringWithFormat:@"%03d",(int)(ponit.x)/kWidth];
    //    int currentTime=(ponit.y-kHeight-kHeightMargin)*30.0/(kHeight+kHeightMargin)+510;
    //    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"clicked room" message:[NSString stringWithFormat:@"time :%@ room :%@",[NSString stringWithFormat:@"%d:%02d",currentTime/60,currentTime%60],roomNum] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    //    [alert show];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY= self.contentTableView.contentOffset.y;
    CGPoint timeOffsetY=self.jianbaotimeView.timeTableView.contentOffset;
    timeOffsetY.y=offsetY;
    self.jianbaotimeView.timeTableView.contentOffset=timeOffsetY;
    
    if(offsetY==0){
        self.jianbaotimeView.timeTableView.contentOffset=CGPointZero;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [super dealloc];
}
- (IBAction)mdfBeginTime {
    [self dateAction: self.textfieldBeginTime];
    
}
- (IBAction)dateAction:(UITextField *) text {
    //设置日期选择框
    UIDatePicker *datePicker = [[UIDatePicker alloc] init]; datePicker.datePickerMode = UIDatePickerModeDate;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    [alert.view addSubview:datePicker];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        //实例化一个NSDateFormatter对象
        [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式
        NSString *dateString = [dateFormat stringFromDate:datePicker.date];
        //求出当天的时间字符串
        text.text =dateString;
        if(self.isjianbao)
        [self loadYingyeJianbao:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
        NSLog(@"%@",dateString);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    [self presentViewController:alert animated:YES completion:^{ }];
}
- (IBAction)mdfyEndTime {
    
    [self dateAction: self.textfieldEndTime];
}
@end
