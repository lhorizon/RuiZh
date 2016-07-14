//
//  TreeNode.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-14.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TreeNode : NSObject
{
    TreeNode *p_node;//父节点
    
    NSMutableArray* children;//子节点
    
    id data;//节点可以包含任意数据
    
    NSString* title;//节点要显示的文字
    
    NSString* key;//主键，在树中唯一
    
    BOOL expanded;//标志：节点是否已展开，保留给TreeViewCell使用的
}
@property (retain) TreeNode* p_node;
@property(assign)float layerAlpha;
@property(assign)BOOL selected;

@property (retain) id data;

@property (retain) NSString *title,*key;

@property (assign) BOOL expanded;

@property (retain) NSMutableArray* children;

@property (assign)BOOL hidden;//标志，节点是否隐藏

@property(weak)UILabel* label;//标签：显示节点title

@property(weak)UIImageView* imgCheck;//选择框
@property(weak)UIView *view;
-(int) deep;//hasChildren的访问方法

-(BOOL)hasChildren;

//子节点的添加方法

-(void)addChild:(TreeNode*)child;

-(int)childrenCount;

+(TreeNode*)findNodeByKey:(NSString*)_key :(TreeNode*)node;

+(void)getNodes:(TreeNode*)root :(NSMutableArray*) array;
+(TreeNode*)treeWithTitle:(NSString*)title key:(NSString*)key;
@end
