//
//  LayerTreeViewController.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-19.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import "TreeViewController.h"
#import "LayerTreeViewCell.h"
@interface LayerTreeViewController : TreeViewController<ATLayerTreeViewCellDelegate>
@property (weak,nonatomic) id<ATLayerTreeViewCellDelegate> layerDelegate;
@end
