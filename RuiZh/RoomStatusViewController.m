//
//  RoomStatusViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "RoomStatusViewController.h"

@interface RoomStatusViewController () 


@end

@implementation RoomStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.allowsSelection = true;
    self.typeNameMap = [NSDictionary dictionaryWithObjectsAndKeys:@"空净",@"VR",@"住净",@"OR",@"住脏",@"OD",@"维修",@"VM",@"清扫",@"VC",@"空脏",@"VD",nil];

    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self loadStatusNow];
    //    [MBProgressHUD showMessage:@"Loading..."];
    
    [self.segmentedStatus addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged ];
    
}
//切换标签动作
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            [self showView:self.viewStatusNow];
               break;
        case 1:
            [self loadForecast:@"2016-07-01"];
            [MBProgressHUD hideHUD];
            break;
       
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//加载实时房态
- (void) loadStatusNow{
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=@"/GetFormx";
    self.data= [NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    if([[self.data valueForKey:@"Result"] isEqualToString:@"True"]) {
        
        [MBProgressHUD showSuccess:@"获取成功"];
      
        
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
//    dateTouchArea add
//    self.textBeganDate action

}

-(void)hiddenView:(UIView *) view {
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionFade;
    animation.duration = 0.4;
    [view.layer addAnimation:animation forKey:nil];
    
    view.hidden = YES;
}
-(void)showView:(UIView *) view {
    CATransition *animation = [CATransition animation];
    animation.type = kCATransitionPush;
    animation.duration = 0.4;
    [view.layer addAnimation:animation forKey:nil];
    
    view.hidden = YES;
}


//初始化种类列表
-(void) initTypeList{
    NSArray * stats = [self.data valueForKey:@"RoomStat"];
    NSArray * statsColor = [self.data valueForKey:@"RoomLegend"];
    self.floors = [self.data valueForKey:@"Data"];
    self.stat = [stats objectAtIndex:0];
    self.statColor = [statsColor objectAtIndex:0];
    [self dealColorMap];
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
    NSDictionary * item = [[[self.floors objectAtIndex:indexPath.section] valueForKey:@"units"] objectAtIndex:indexPath.row];
    NSString* romNum= [item valueForKey:@"rom"];
    NSString * status = [self.typeNameMap valueForKey:[item valueForKey:@"sta"]];
    UIColor * bgColor = [self.typeColorMap valueForKey: [@"L" stringByAppendingString:[item valueForKey:@"sta"]]];
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.textContent.text = romNum; ;
    cell.typeDesc.text =status;
    cell.textContent.backgroundColor  = bgColor;
    cell.typeDesc.backgroundColor = bgColor;
    cell.typeDesc.textColor = [UIColor whiteColor];
    cell.textContent.textColor = [UIColor whiteColor];
    cell.textContent.selectable = true;
    cell.typeDesc.selectable = true;
    
 
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    NSDictionary * item = [[[self.floors objectAtIndex:indexPath.section] valueForKey:@"units"] objectAtIndex:indexPath.row];
    NSString* currentStatusDesc = [NSString stringWithFormat:@"房间号:%@－%@\n当前状态:%@\n",[item valueForKey:@"rom"],[item valueForKey:@"typ"],[self.typeNameMap valueForKey:[item valueForKey:@"sta"]]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:currentStatusDesc message:@"请选择要修改的房态类型" preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:NO];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:NO];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:NO];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil]];
   
    [self presentViewController:alert animated:YES completion:NULL];
    NSLog(@" cell item is section: %ld  row:%ld",(long)indexPath.section , (long)indexPath.row);
}

- (IBAction)backAction:(id)sender {
         [self.navigationController popViewControllerAnimated:NO];
}
- (void)dealloc {
 
    [_dateTouchArea release];
    [super dealloc];
}
- (IBAction)chooseBeganAction {
    //设置日期选择框
    UIDatePicker *datePicker = [[UIDatePicker alloc] init]; datePicker.datePickerMode = UIDatePickerModeDate;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n" message:nil 　　preferredStyle:UIAlertControllerStyleActionSheet];
    [alert.view addSubview:datePicker];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        //实例化一个NSDateFormatter对象
        [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式
        NSString *dateString = [dateFormat stringFromDate:datePicker.date];
        //求出当天的时间字符串
        self.textBeganDate.text =dateString;
        NSLog(@"%@",dateString);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        　 }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    
    [self presentViewController:alert animated:YES completion:^{ }];
}

@end
