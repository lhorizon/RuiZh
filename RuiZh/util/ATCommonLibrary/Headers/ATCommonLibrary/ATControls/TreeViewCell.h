//
//  TreeViewCell.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-14.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeNode.h"
#import "UIImage+Bundle.h"
@protocol ATTreeViewCellDelegate <NSObject>
@optional

-(void)onExpand:(TreeNode*)node;
@end

@interface TreeViewCell : UITableViewCell
{
    
    UIButton* btnExpand;//按钮：用于展开子节点
    
    TreeNode* treeNode;//每个单元格表示一个节点
    
    UILabel* label;//标签：显示节点title
    
    id owner;//表示 onExpand方法委托给哪个对象
    
    UIImageView* imgIcon;//图标
    
    UIImageView* imgCheck;//选择框
    
    BOOL _showCheckBox,_checkAll,_MultiSelect,_hideRoot;
    
    UILabel *line;
    UIView *view;
}

//@property (assign) SEL onExpand;

//@property (retain) id owner;
@property (weak,nonatomic) id<ATTreeViewCellDelegate> delegate;
@property (retain) UIImageView* imgIcon;
@property(weak,nonatomic)UIColor *hightLightColor;
/**
 使用该方式设置节点，默认不显示checkbox
 */
-(void)setTreeNode:(TreeNode *)node width:(CGFloat)width;
-(TreeNode*)getTreeNode;
/**
 使用该方式设置节点，可设置是否显示checkbox，默认目录节点不显示checkbox
 */
-(void)setTreeNode:(TreeNode *)node width:(CGFloat)width showCheckBox:(BOOL)showCheck;
/**
 使用该方式设置节点，可设置是否显示checkbox，可设置目录节点是否显示checkbox
 */
-(void)setTreeNode:(TreeNode *)node width:(CGFloat)width showCheckBox:(BOOL)showCheck ShowCheckAll:(BOOL)checkAll;
/**
 使用该方式设置节点，可设置是否显示checkbox，可设置目录节点是否显示checkbox,也可以设置多选
 */
-(void)setTreeNode:(TreeNode *)node width:(CGFloat)width showCheckBox:(BOOL)showCheck ShowCheckAll:(BOOL)checkAll multiSelect:(BOOL)multiSelect;

-(void)setTreeNode:(TreeNode *)node width:(CGFloat)width showCheckBox:(BOOL)showCheck ShowCheckAll:(BOOL)checkAll multiSelect:(BOOL)multiSelect HideRoot:(BOOL)hideRoot;
-(void)setActivating;
-(void)setActivating:(BOOL)act;
-(void)setCellHighlighted:(TreeNode*)node;
+(int)indent;
+(void)setIndent:(int)value;
@end
