//
//  ATTreeView.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-20.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeViewCell.h"
@protocol ATTreeViewDelegate <NSObject>
@optional

-(void)onSelectedRow:(NSIndexPath *)indexPath Cell:(id)cell TreeView:(id)treeView;
@end
@interface ATTreeView : UITableView<UITableViewDataSource,UITableViewDelegate,ATTreeViewCellDelegate>
{
    TreeNode* _tree;
    NSMutableArray* nodes;
}
@property (weak,nonatomic) id<ATTreeViewDelegate> treeDelegate;
@property(weak,nonatomic)UIColor *hightLightColor;
//@property(retain,nonatomic)TreeNode *tree;
/**
 是否显示ckeckbox
 */
@property(assign)bool showCheckBox;
/**
 目录节点是否显示checkbox
 */
@property(assign)bool checkAll;
/**
 是否支持多选
 */
@property(assign)BOOL MultiSelect;

/**
 单选时，再点击取消选中
 */
@property(assign)BOOL ClickToNotSelected;

/**
 如果你想呈现自己的树，在子类中覆盖此方法
 */
//-(void)initTree;
-(void)setTree:(TreeNode *)tree;
/**
 如果你想定义自己的单元格视图（比如更换默认的文件夹图标），在子类中覆盖此方法
 */
-(void)configCell:(TreeViewCell *)cell treeNode:(TreeNode *)node;

@end
