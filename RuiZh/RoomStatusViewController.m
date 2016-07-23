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

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
//    cell.backgroundView pressesBegan:<#(nonnull NSSet<UIPress *> *)#> withEvent:<#(nullable UIPressesEvent *)#>
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    MyCollectionViewCell *cell = (MyCollectionViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
//    
//    [selfupdateCollectionViewCellStatus:cell selected:YES];
    
    NSDictionary * item = [[[self.floors objectAtIndex:indexPath.section] valueForKey:@"units"] objectAtIndex:indexPath.row];
    
    NSLog(@" cell item is section: %ld  row:%ld",(long)indexPath.section , (long)indexPath.row);
}

- (IBAction)backAction:(id)sender {
         [self.navigationController popViewControllerAnimated:NO];
}
@end
