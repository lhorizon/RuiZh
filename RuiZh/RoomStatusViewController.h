//
//  RoomStatusViewController.h
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemUtil.h"
#import "CollectionCell.h"

@interface RoomStatusViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (retain, nonatomic) IBOutlet UITextField *vrNum;
@property (retain, nonatomic) IBOutlet UITextField *orNum;
@property (retain, nonatomic) IBOutlet UITextField *odNum;
@property (retain, nonatomic) IBOutlet UITextField *vdNum;
@property (retain, nonatomic) IBOutlet UITextField *vmNum;
@property (retain, nonatomic) IBOutlet UITextField *vcNum;
@property (retain, nonatomic) IBOutlet UITextField *roomCount;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *btnBack;
@property (retain, nonatomic) IBOutlet UICollectionView *collectionView;
@property (retain,nonatomic)   NSDictionary * data;
@property (retain,nonatomic)   NSDictionary * stat;
@property (retain,nonatomic)   NSDictionary * statColor;
- (IBAction)backAction:(id)sender;

@property (retain,nonatomic)   NSDictionary * typeNameMap;
@property (retain,nonatomic)   NSMutableDictionary * typeColorMap;
@property (retain,nonatomic)   NSArray * floors;
@end
