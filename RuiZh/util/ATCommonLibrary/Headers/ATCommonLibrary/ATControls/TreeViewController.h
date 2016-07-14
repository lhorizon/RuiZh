//
//  TreeViewController.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-14.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATTreeView.h"
@interface TreeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ATTreeViewCellDelegate>

{
    TreeNode* _tree;
    NSMutableArray* nodes;
    
}
@property (weak,nonatomic) id<ATTreeViewDelegate> treeDelegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
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
 如果你想呈现自己的树，在子类中覆盖此方法
 */
//-(void)initTree;

/**
 如果你想定义自己的单元格视图（比如更换默认的文件夹图标），在子类中覆盖此方法
*/
-(void)configCell:(TreeViewCell *)cell treeNode:(TreeNode *)node;

@end
