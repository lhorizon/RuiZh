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
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self loadStatusNow];  
    
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    //    [MBProgressHUD showMessage:@"Loading..."];

    _typeNameMap = [NSDictionary dictionaryWithObjectsAndKeys:@"空净",@"VR",@"住净",@"OR",@"住脏",@"OD",@"维修",@"VM",@"清扫",@"VC",@"空脏",@"VD",nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadStatusNow{
    [MBProgressHUD showMessage:@"加载..."];
    NSString *urlStr=@"/GetFormx";
    _data= [NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    if([[_data valueForKey:@"Result"] isEqualToString:@"True"]) {
        
        [MBProgressHUD showSuccess:@"获取成功"];
      
        
        [self initTypeList];

    }else{
        [MBProgressHUD showError:[_data valueForKey:@"ErrMsg"] ];
    }
}

//初始化种类列表
-(void) initTypeList{
    NSArray * stats = [_data valueForKey:@"RoomStat"];
    NSArray * statsColor = [_data valueForKey:@"RoomLegend"];
    _floors = [_data valueForKey:@"Data"];
    _stat = [stats objectAtIndex:0];
    _statColor = [statsColor objectAtIndex:0];
    [self dealColorMap];
    [_odNum setText:[[_stat valueForKey:@"OD"] stringValue]];
    [_orNum setText:[[_stat valueForKey:@"OR"] stringValue]];
    [_vcNum setText:[[_stat valueForKey:@"VC"] stringValue]];
    [_vdNum setText:[[_stat valueForKey:@"VD"] stringValue]];
    [_vmNum setText:[[_stat valueForKey:@"VM"] stringValue]];
    [_vrNum setText:[[_stat valueForKey:@"VR"] stringValue]];
    
    
    [_odNum setBackgroundColor:[_typeColorMap valueForKey:@"LOD"]];
    [_orNum setBackgroundColor:[_typeColorMap valueForKey:@"LOR"]];
    [_vcNum setBackgroundColor:[_typeColorMap valueForKey:@"LVC"]];
    [_vdNum setBackgroundColor:[_typeColorMap valueForKey:@"LVD"]];
    [_vmNum setBackgroundColor:[_typeColorMap valueForKey:@"LVM"]];
    [_vrNum setBackgroundColor:[_typeColorMap valueForKey:@"LVR"]];

     
    [_roomCount setText:[[_stat valueForKey:@"合计"] stringValue]];
}

- (void) dealColorMap{
    _typeColorMap  = [NSMutableDictionary dictionary];
    NSArray* allKeys= [_statColor allKeys];
    for (id key in allKeys) {
        [_typeColorMap  setObject:[SystemUtil getColorFromDecimal:[_statColor valueForKey:key]] forKey:key];
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
    NSArray* units = [[_floors objectAtIndex:section ] valueForKey:@"units"];
    
    return [units count];
}

////定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{   NSArray * data =[_data valueForKey:@"Data"];
    return    [data count];
}


#pragma mark --UICollectionViewDelegateFlowLayout
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * item = [[[_floors objectAtIndex:indexPath.section] valueForKey:@"units"] objectAtIndex:indexPath.row];
    NSString* romNum= [item valueForKey:@"rom"];
    NSString * status = [_typeNameMap valueForKey:[item valueForKey:@"sta"]];
    UIColor * bgColor = [_typeColorMap valueForKey: [@"L" stringByAppendingString:[item valueForKey:@"sta"]]];
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.textContent.text = romNum; ;
    cell.typeDesc.text =status;
    cell.textContent.backgroundColor  = bgColor;
    cell.typeDesc.backgroundColor = bgColor;
    return cell;
}
 
- (IBAction)backAction:(id)sender {
         [self.navigationController popViewControllerAnimated:NO];
}
@end
