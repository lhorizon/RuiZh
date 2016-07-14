//
//  ATLayerTreeView.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-20.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import "ATTreeView.h"
#import "LayerTreeViewCell.h"
@interface ATLayerTreeView : ATTreeView<ATLayerTreeViewCellDelegate>
@property (weak,nonatomic) id<ATLayerTreeViewCellDelegate> layerDelegate;
@end
