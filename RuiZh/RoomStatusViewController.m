//
//  RoomStatusViewController.m
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "RoomStatusViewController.h"

@interface RoomStatusViewController ()
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;
@property (retain,nonatomic)   NSDictionary * data;
@property (retain,nonatomic)   NSDictionary * stat;
@property (retain,nonatomic)   NSDictionary * statColor;

@end

@implementation RoomStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self loadStatusNow];
    [self.collectionView setBackgroundColor:[UIColor lightGrayColor]];
//    [self.collectionView ];
    
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];//    [MBProgressHUD showMessage:@"Loading..."];

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
         NSDictionary * floors= [_data valueForKey:@"Data"];
        for (id floor in floors){
            NSDictionary * floorData= floor;
            NSDictionary *units = [floorData valueForKey:@"units"];
            NSUInteger * count=units.count;
        }
        
        [self initTypeList];

    }else{
        [MBProgressHUD showError:[_data valueForKey:@"ErrMsg"] ];
    }
}

//初始化种类列表
-(void) initTypeList{
    NSArray * stats = [_data valueForKey:@"RoomStat"];
    NSArray * statsColor = [_data valueForKey:@"RoomLegend"];
    _stat = [stats objectAtIndex:0];
    _statColor = [statsColor objectAtIndex:0];
    
    [_odNum setText:[[_stat valueForKey:@"OD"] stringValue]];
    [_orNum setText:[[_stat valueForKey:@"OR"] stringValue]];
    [_vcNum setText:[[_stat valueForKey:@"VC"] stringValue]];
    [_vdNum setText:[[_stat valueForKey:@"VD"] stringValue]];
    [_vmNum setText:[[_stat valueForKey:@"VM"] stringValue]];
    [_vrNum setText:[[_stat valueForKey:@"VR"] stringValue]];
    
//    NSString * decimalStr =  [_statColor valueForKey:@"LOD"] ;
//    UIColor * lableColor = [SystemUtil getColorFromDecimal:decimalStr];
//    [_odNum setBackgroundColor:lableColor];
    
//    
//    [_odNum setBackgroundColor:[SystemUtil getColorFromDecimal:[[_statColor valueForKey:@"LOD"] stringValue]]];
    [_odNum setBackgroundColor:[SystemUtil getColorFromDecimal:[_statColor valueForKey:@"LOD"]]];
    [_orNum setBackgroundColor:[SystemUtil getColorFromDecimal:[_statColor valueForKey:@"LOR"]]];
    [_vcNum setBackgroundColor:[SystemUtil getColorFromDecimal:[_statColor valueForKey:@"LVC"]]];
    [_vdNum setBackgroundColor:[SystemUtil getColorFromDecimal:[_statColor valueForKey:@"LVD"]]];
    [_vmNum setBackgroundColor:[SystemUtil getColorFromDecimal:[_statColor valueForKey:@"LVM"]]];
    [_vrNum setBackgroundColor:[SystemUtil getColorFromDecimal:[_statColor valueForKey:@"LVR"]]];
//
    
    NSString* typeCount = [_stat valueForKey:@"种类"];
    [_roomCount setText:[[_stat valueForKey:@"合计"] stringValue]];
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

    
//    [SystemUtil decimalToHex:]
    return 6;
}

////定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}


#pragma mark --UICollectionViewDelegateFlowLayout
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)dealloc {
    [_collectionView release];
    [_vrNum release];
    [_orNum release];
    [_odNum release];
    [_vdNum release];
    [_vmNum release];
    [_vcNum release];
    [_roomCount release];
    [super dealloc];
}
@end
