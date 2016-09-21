//
//  RoomStatusViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "RoomStatusViewController.h"

@interface RoomStatusViewController () 
#define kWidth 100
#define kHeight 40
@property (retain,nonatomic)   NSString * toaday;
@end

@implementation RoomStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationItem.backBarButtonItem  setTintColor: [UIColor whiteColor]];
    [self.refreshBtn setTintColor: [UIColor whiteColor]];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.allowsSelection = true;
    self.typeNameMap = [NSDictionary dictionaryWithObjectsAndKeys:@"空净",@"VR",@"住净",@"OR",@"住脏",@"OD",@"维修",@"VM",@"清扫",@"VC",@"空脏",@"VD",nil];

    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
  
    [self loadStatusNow];
    //    [MBProgressHUD showMessage:@"Loading..."];
    self.userinfo = [NSUserDefaults standardUserDefaults];
    [self.segmentedStatus addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged ];
    
    NSDate *epochNSDate = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    self.toaday=[dateFormatter stringFromDate:epochNSDate];
    self.textBeganDate.text = self.toaday;
    
}
//切换标签动作
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            [self showView:self.viewStatusNow subType:kCATransitionFromLeft];
            [self hiddenView:self.tableViewContain];
            [self loadStatusNow];
            [self.refreshBtn setEnabled:true];
            [self.refreshBtn setTintColor: [UIColor whiteColor]];
            
               break;
        case 1:
            [self showView:self.tableViewContain subType:kCATransitionFromRight];
            [self hiddenView:self.viewStatusNow];
            [self.refreshBtn setEnabled:false];
            [self.refreshBtn setTintColor: [UIColor clearColor]];
            [self loadForecast:self.toaday];
            break;
       
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//加载实时房态
- (void) loadStatusNow{
    [MBProgressHUD showMessage:@"加载"];
    NSString *urlStr=@"/GetFormx";
    self.data= [NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    if([[self.data valueForKey:@"Result"] isEqualToString:@"True"]) {
       
      
        [self initTypeList];

    }else{
        [MBProgressHUD showError:[self.data valueForKey:@"ErrMsg"] ];
    }
}

//加载预测房态
-(void) loadForecast:(NSString *) dateString{
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=[NSString stringWithFormat:@"/GetFormxForecat?dtfrom=%@&days=20",dateString];
    self.dataForecast= [NetUtil doGetSync:urlStr];
    self.roomAlltype = [self.dataForecast valueForKey:@"Data"];
    [self dealforecastData];
    
    [MBProgressHUD hideHUD];
    if(!self.tableViewContain.subviews )
    for(int i = 0;i<=[self.tableViewContain.subviews count];i++){
        [ [ self.tableViewContain.subviews objectAtindex:i] removeFromsuperview];
    }
    
        UIView *tableViewHeadView=[[UIView alloc]initWithFrame:CGRectMake(0, 60,  [self.dateArray count]*kWidth,kHeight)];
        self.myHeadView=tableViewHeadView;
        self.myHeadView.backgroundColor = [UIColor colorWithRed:(float)108.0/255.0f green:(float)147 /255.0f blue:(float)198/255.0f alpha:1.0f];
 
    for(int i=0;i< [self.dateArray count];i++){
        
        TitlesView *headView=[[TitlesView alloc]initWithFrame:CGRectMake(i*kWidth, 10, kWidth, kHeight)];
        headView.num=[self.dateArray objectAtIndex:i];
        [self.myHeadView addSubview:headView];
    }
    UITextField *textMaster = [[UITextField alloc]initWithFrame:CGRectMake(0, 60, kWidth, kHeight) ];
    textMaster.text =@"    房型";
    textMaster.textColor = [UIColor whiteColor];
    textMaster.backgroundColor = [UIColor colorWithRed:(float)108.0/255.0f green:(float)147 /255.0f blue:(float)198/255.0f alpha:1.0f];
    textMaster.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textMaster.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    [self.tableViewContain addSubview:textMaster];
    
    UIScrollView *myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(kWidth , 60, self.view.frame.size.width-kWidth, self.tableViewContain.frame.size.height -kHeight-30)];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.myHeadView.frame.size.width,myScrollView.frame.size.height ) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    tableView.bounces=NO;
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.myTableView=tableView;
    tableView.backgroundColor=[UIColor redColor];
    
    [myScrollView addSubview:tableView];
    myScrollView.bounces=YES;
    myScrollView.contentSize=CGSizeMake(self.myHeadView.frame.size.width,0);
    [self.tableViewContain addSubview:myScrollView];
    
    self.timeView=[[TitleView alloc] initWithFrame:CGRectMake(0, kHeight+75.0, kWidth, [self.typeArray count
                                                              ]*(kHeight+kHeightMargin)) cellDecs:self.typeArray];
    [self.tableViewContain addSubview:self.timeView];
}

-(void) dealforecastData{
        self.typeArray = [[NSMutableArray alloc]init];
        self.dateArray =  [[NSMutableArray alloc]init];
    self.mainContentArray = [[NSMutableArray alloc]init];
    
    for (id roomType in self.roomAlltype) {
        NSString *fx =[@"" stringByAppendingString:  [roomType valueForKey:@"房型"]];
        [self.typeArray addObject:fx];
        
        NSArray *keys =[roomType allKeys];
        NSMutableArray *rowcontent = [[NSMutableArray alloc] init];
        [rowcontent addObject:[roomType valueForKey:@"间数"]];
        if([self.dateArray count]==0){
            [self.dateArray addObject:@"间数"];
            for(int i = 0;i< [keys count];i++){
                NSString* date =[keys objectAtIndex:i];
            if(![date isEqualToString:@"间数"]&&![date isEqualToString:@"房型"])
                [rowcontent addObject:[roomType valueForKey:date]];
                if([date length]==10)
                    [self.dateArray addObject: [date substringFromIndex:5] ] ;
            }
        }else{
            for(int i = 0;i< [keys count];i++){
                NSString* date =[keys objectAtIndex:i];
                if(![date isEqualToString:@"间数"]&&![date isEqualToString:@"房型"]){
                    NSString *text = [roomType valueForKey:date];
                    if([fx isEqualToString:@"百分比"]){
                        text = [NSString stringWithFormat:@"%@",[roomType valueForKey:date]];
                        [text stringByAppendingString:@"%%"];
                    }
                    [rowcontent addObject:text];
                    
                }
            }
        }
        [self.mainContentArray addObject:rowcontent];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     unsigned long count =  [self.typeArray count] ;
    return  count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
//    Roomforecast *cell = [tableView dequeueReusableCellWithIdentifier:@"Roomforecast" forIndexPath:indexPath];
//    
//    cell.lefttext.text =@"tttt";
//    if(indexPath.row%2==0){
//        cell.backgroundColor = [UIColor yellowColor]; 
//    }else{
//        cell.backgroundColor = [UIColor orangeColor];
//    }
//
//    
    
    static NSString *cellIdentifier=@"cell";
//
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier ] ;
        cell.delegate=self;
            cell.backgroundColor=[UIColor grayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    [self.currentTime removeAllObjects];

    cell.index=indexPath.row;
    cell.currentTime=[self.mainContentArray objectAtIndex:indexPath.row];
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
    CGPoint myPoint= [self.myTableView convertPoint:point fromView:headView];
    
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
    CGFloat offsetY= self.myTableView.contentOffset.y;
    CGPoint timeOffsetY=self.timeView.timeTableView.contentOffset;
    timeOffsetY.y=offsetY;
    self.timeView.timeTableView.contentOffset=timeOffsetY;
    
    if(offsetY==0){
        self.timeView.timeTableView.contentOffset=CGPointZero;
    }
}


-(void)hiddenView:(UIView *) view {
    CATransition *animation = [CATransition animation];
    [view.layer addAnimation:animation forKey:nil];
    
    view.hidden = YES;
}
-(void)showView:(UIView *) view subType:(NSString *) subtype{
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionPush;
    animation.subtype = subtype;
    animation.duration = 0.4;
    [view.layer addAnimation:animation forKey:nil];
    
    view.hidden = NO;
}


//初始化种类列表
-(void) initTypeList{
    NSArray * stats = [self.data valueForKey:@"RoomStat"];
    NSArray * statsColor = [self.data valueForKey:@"RoomLegend"];
    self.floors = [self.data valueForKey:@"Data"];
    self.stat = [stats objectAtIndex:0];
    self.statColor = [statsColor objectAtIndex:0];
    [self dealColorMap];
//    @"空净",@"VR",@"住净",@"OR",@"住脏",@"OD",@"维修",@"VM",@"清扫",@"VC",@"空脏",@"VD"
    [self.odNum setText:[[self.stat valueForKey:@"OD"] stringValue]];
    [self.orNum setText:[[self.stat valueForKey:@"OR"] stringValue]];
    [self.vcNum setText:[[self.stat valueForKey:@"VC"] stringValue]];
    [self.vdNum setText:[[self.stat valueForKey:@"VD"] stringValue]];
    [self.vmNum setText:[[self.stat valueForKey:@"VM"] stringValue]];
    [self.vrNum setText:[[self.stat valueForKey:@"VR"] stringValue]];
    
    
    [self.odNum setBackgroundColor:[self.typeColorMap valueForKey:@"LOD"]];
    [self.orNum setBackgroundColor:[self.typeColorMap valueForKey:@"LOR"]];
    [self.vcNum setBackgroundColor:[self.typeColorMap valueForKey:@"LVC"]];
    [self.vdNum setBackgroundColor:[self.typeColorMap valueForKey:@"LVD"]];
    [self.vmNum setBackgroundColor:[self.typeColorMap valueForKey:@"LVM"]];
    [self.vrNum setBackgroundColor:[self.typeColorMap valueForKey:@"LVR"]];

     
    [self.roomCount setText:[[self.stat valueForKey:@"合计"] stringValue]];
}

- (void) dealColorMap{
    self.typeColorMap  = [NSMutableDictionary dictionary];
    NSArray* allKeys= [self.statColor allKeys];
    for (id key in allKeys) {
        [self.typeColorMap  setObject:[SystemUtil getColorFromDecimal:[self.statColor valueForKey:key]] forKey:key];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -- UICollectionViewDataSource
//每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray* units = [[self.floors objectAtIndex:section ] valueForKey:@"units"];
    
    return [units count];
}

////定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{   NSArray * data =[self.data valueForKey:@"Data"];
    return    [data count];
}


#pragma mark --UICollectionViewDelegateFlowLayout
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     NSString *fontcolor  = [defaults valueForKey:@"fontcolor"];
    UIColor *thecolor;
    if(fontcolor==nil||[fontcolor isEqualToString:@"白色"]){
        thecolor =[UIColor whiteColor];
    }else{
        thecolor =[UIColor blackColor];
    }
    NSDictionary * item = [[[self.floors objectAtIndex:indexPath.section] valueForKey:@"units"] objectAtIndex:indexPath.row];
    NSString* romNum= [item valueForKey:@"rom"];
    NSString * status = [self.typeNameMap valueForKey:[item valueForKey:@"sta"]];
    UIColor * bgColor = [self.typeColorMap valueForKey: [@"L" stringByAppendingString:[item valueForKey:@"sta"]]];
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.textContent.text = romNum; ;
    cell.typeDesc.text =status;
    cell.textContent.backgroundColor  = bgColor;
    cell.typeDesc.backgroundColor = bgColor;
    cell.typeDesc.textColor = thecolor;
    cell.textContent.textColor = thecolor;
    cell.textContent.selectable = true;
    cell.typeDesc.selectable = true;
    
 
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    NSDictionary * item = [[[self.floors objectAtIndex:indexPath.section] valueForKey:@"units"] objectAtIndex:indexPath.row];
    NSString* currentStatusDesc = [NSString stringWithFormat:@"房间号:%@－%@\n当前状态:%@\n",[item valueForKey:@"rom"],[item valueForKey:@"typ"],[self.typeNameMap valueForKey:[item valueForKey:@"sta"]]];
    
    NSString *sta = [item valueForKey:@"sta"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:currentStatusDesc message:@"请选择要修改的房态类型" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //设置添加操作选项
//vr:vd,vc,vm else
//or:od  else
//od:vm,or  else
//vm:vr,vd,vc else
//vc:vr,vd,vm  else
//vd:vr,vc,vm  else
    if([sta isEqualToString:@"VC"] ||[sta isEqualToString:@"VM"]||[sta isEqualToString:@"VD"]){
        
        [self ModifyFormxSta:item toSta:@"VR" alert:alert];
    }
    if([sta isEqualToString:@"OD"] ){
       [self ModifyFormxSta:item toSta:@"OR" alert:alert];
    }
    if([sta isEqualToString:@"OR"]||[sta isEqualToString:@"VM"]){
     [self ModifyFormxSta:item toSta:@"OD" alert:alert];
    }
    if([sta isEqualToString:@"VC"] ||[sta isEqualToString:@"VR"]||[sta isEqualToString:@"VD"]){
     [self ModifyFormxSta:item toSta:@"VM" alert:alert];
    }
    if([sta isEqualToString:@"VR"]||[sta isEqualToString:@"VM"]||[sta isEqualToString:@"VD"]){
       [self ModifyFormxSta:item toSta:@"VC" alert:alert];
    }
    if([sta isEqualToString:@"VC"] ||[sta isEqualToString:@"VR"]||[sta isEqualToString:@"VM"]){
       [self ModifyFormxSta:item toSta:@"VD" alert:alert];
    }
 
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil]];
    
    NSUserDefaults *info = [NSUserDefaults standardUserDefaults];
     NSString * updateable= [info valueForKey:@"updateable"];
    if([updateable  isEqualToString:@"yes"])
    [self presentViewController:alert animated:YES completion:NULL];
    NSLog(@" cell item is section: %ld  row:%ld",(long)indexPath.section , (long)indexPath.row);
}
- (void)ModifyFormxSta:(NSDictionary *) item toSta:(NSString *) tosta alert:(UIAlertController *) alert{
//user:
//room:[item valueForKey:@"rom"]
//oldsta:[item valueForKey:@"sta"]
//newsta:
    [alert addAction:[UIAlertAction actionWithTitle:[ self.typeNameMap valueForKey:tosta] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *name = [self.userinfo valueForKey:@"name"];
        NSString *room = [item valueForKey:@"rom"];
        NSString *oldSta = [item valueForKey:@"sta"];
        NSString *urlStr=[NSString stringWithFormat:@"/ModifyFormxSta?user=%@&room=%@&oldsta=%@&newsta=%@",name,room,oldSta,tosta];
//{"Result":"True","ErrMsg":"","Data":{"typ":"标准大床","rom":"202","floorid":"2","sta":"OD","dpt":"03","ftpx":1}}
        NSDictionary* operResult=  [NetUtil doGetSync:urlStr];
        if([[operResult valueForKey:@"Result"] isEqualToString:@"True"]){
            [MBProgressHUD showSuccess:@"操作成功"];
            [self loadStatusNow];
            [self.collectionView reloadData];
        }else{
            [MBProgressHUD showSuccess:@"操作失败"];
        };
    }]];
}
- (IBAction)backAction:(id)sender {
         [self.navigationController popViewControllerAnimated:NO];
}
- (void)dealloc {
    [super dealloc];
}
- (IBAction)chooseBeganAction {
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
        self.textBeganDate.text =dateString;
        self.toaday =dateString;
        [self loadForecast:dateString];
        NSLog(@"%@",dateString);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
         }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    
    [self presentViewController:alert animated:YES completion:^{ }];
}

- (IBAction)refresh:(id)sender {
    [self loadStatusNow];
    [self.collectionView reloadData];
}
@end
