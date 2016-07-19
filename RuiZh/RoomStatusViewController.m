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
@end

@implementation RoomStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadStatusNow];
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];

//    [MBProgressHUD showMessage:@"Loading..."];

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
    }else{
        [MBProgressHUD showError:[_data valueForKey:@"ErrMsg"] ];
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


//每个section的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSUInteger * stats= [[[_data valueForKey:@"RoomStat"] indexPath:0] valueForKey:@"种类"];
    return stats ;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionCell *cell = (CollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
//    //图片名称
//    NSString *imageToLoad = [NSString stringWithFormat:@"%d.png", indexPath.row];
//    //加载图片
//    cell.imageView.image = [UIImage imageNamed:imageToLoad];
//    //设置label文字
//    cell.label.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.row,(long)indexPath.section];
//    
    return cell;
}

- (void)dealloc {
    [_collectionView release];
    [super dealloc];
}
@end
