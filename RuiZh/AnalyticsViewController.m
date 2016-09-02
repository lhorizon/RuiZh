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
@property (retain,nonatomic) NSMutableArray * subviews;
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
    
    self.subviews = [[NSMutableArray alloc]init];
    [self getSonViews:self.shouruContainer];
    
    self.isjianbao = YES;
    [self.jianbaoContainer setHidden:NO];
    [self.shouruContainer setHidden:YES];
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
            [self loadfenxi:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
            break;
            
    }
}
-(void) loadfenxi:(NSString *) dtstart dtend:(NSString *) dtend {
//    dtstart = @"2016-05-01";
//    dtend = @"2016-06-01";
    [MBProgressHUD showMessage:@"加载"];
    NSString *urlStr=[NSString stringWithFormat:@"/GetBusinessAnalysisReportData?dtstart=%@&dtend=%@",dtstart,dtend];
    NSDictionary *data =[NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    
    if(data!=nil&&[@"True" isEqualToString:[data valueForKey:@"Result"]]){
        NSMutableDictionary * finalData = [[NSMutableDictionary alloc]init];
        NSArray* dataArray = [data valueForKey:@"Data"];
        for(NSDictionary *  itemObject in dataArray ){
            NSArray *itemArray = [itemObject valueForKey:@"Data"];
            for(NSDictionary *  item in itemArray ){
                [ finalData setObject:[item  valueForKey:@"金额"]  forKey:[item  valueForKey:@"项目类别"] ];
            }
        }
        
        for(UITextField * view in self.subviews){
            int tag= view.tag;
            if(tag==1011){
                view.text = [NSString  stringWithFormat:@"%@",[finalData valueForKey:@"房吧"]];
            }else if(tag==1012){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"储值"]];
            }else  if(tag==1021){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"房租"]];
            }else if(tag==1022){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"微信"]];
            }else  if(tag==1031){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"会员卡"]];
            }else if(tag==10132){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"现金"]];

            }else  if(tag==1041){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"杂项"]];
            }else if(tag==1042){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"银联"]];
            }else  if(tag==1051){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"应收"]];
            }else if(tag==1061){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"支付宝"]];
            }else  if(tag==1071){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"借方合计"]];
            }else if(tag==1072){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"贷方合计"]];
            }else  if(tag==1081){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"借贷差额"]];
            }else if(tag==1082){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"期末余额"]];
            }else  if(tag==1101){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"现金充值"]];
            }else if(tag==1102){
//                
//                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"上期末应收欠款"]];
                
                view.text = @"";
            }else  if(tag==1111){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"银联充值"]];
            }else if(tag==1112){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"应收挂帐"]];
            }else  if(tag==1121){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"赠送充值"]];
            }else if(tag==1122){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"应收回款"]];
            }else  if(tag==1131){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"本期充值合计"]];

            }else if(tag==1132){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"期末应收"]];
            }else  if(tag==1151){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"期末储值"]];
            }else if(tag==1152){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"期末积分"]];
            }else  if(tag==1161){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"储值充值"]];
            }else if(tag==1162){
                
                view.text = [NSString stringWithFormat:@"%@",[finalData valueForKey:@"积分发生"]];
            }
        }
        
//        [self.shouruContainer subviews]
             
        
        
        for (UIView *find_label in self.self.shouruContainer.subviews) {
            
            if (find_label.tag == 1011)
            {
                find_label.backgroundColor = [UIColor redColor];
                
            }
            
        }
    }
}
-(void) getSonViews:(UIView *)pview{
    if ([[pview subviews] count]>0) {
        for(UIView *son in [pview subviews]){
            [self getSonViews:son];
        }
    }else{
        [self.subviews addObject:pview];
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
        if([self.jianbaoTitles count]==0){
            [MBProgressHUD showError:@"未获取到数据"];
            return;
        }
        
        for(int i=0;i< [self.jianbaoTitles count];i++){
            TitlesView *headView=[[TitlesView alloc]initWithFrame:CGRectMake(i*kWidth, 10, kWidth, kHeight)];
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
        UIScrollView *myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(kWidth +15,0, self.view.frame.size.width-kWidth,  self.jianbaoContainer.frame.size.height  -3)];
        
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

        NSString * dateS =  [self.jianbaoDatelist objectAtIndex:(int)(ponit.y)/(40+kHeightMargin)-1] ;
        NSLog(@"%@",dateS);
        [MBProgressHUD showMessage:@"获取中..."];
        NSString *urlStr=[NSString stringWithFormat:@"/GetBusinessLevelReportDataByTyp?dtdate=%@&typ=%@",dateS,@"01"];
        NSArray *data =[[NetUtil doGetSync:urlStr] valueForKey:@"Data"];
        NSString *msg =[[NSString alloc]init];
    
        for(NSDictionary *item in data){
            NSLog(@"%@",dateS);
            NSString* msgItem =[NSString stringWithFormat:@"%@  →  %@   \n",[item valueForKey:@"类型"],[item valueForKey:@"金额"]];
            NSLog(@"%@",[@"msgitem:" stringByAppendingString:msgItem]);
            msg=[msg stringByAppendingString:msgItem];
            
        }
    NSLog(@"%@",[@"内容:" stringByAppendingString:msg]);
    
    [MBProgressHUD hideHUD];

        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:[dateS stringByAppendingString: @"房租明细"] message: msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alert show];
//    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    //
    //        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"clicked room" message:[NSString stringWithFormat:@"time :%@ room :%@",[NSString stringWithFormat:@"%d:%02d",currentTime/60,currentTime%60],roomNum] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
    //        [alert show];
    //    }
    
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
        if(self.isjianbao){
            [self loadYingyeJianbao:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
        }else{
            [self loadfenxi:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
            
        }
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
