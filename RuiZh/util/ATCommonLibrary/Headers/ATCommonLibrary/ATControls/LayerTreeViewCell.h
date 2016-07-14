//
//  LayerTreeViewCell.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-19.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import "TreeViewCell.h"
#import "LayerTreeViewCell.h"
#import "LayerSetController.h"
@protocol ATLayerTreeViewCellDelegate <NSObject>
@optional

-(void)onAlphaSliderChanged:(float)value Cell:(id)cell;
@end
@interface LayerTreeViewCell : TreeViewCell
{
//    UISlider *alphaSlider;
    UIButton *setbutton;
    UIPopoverController *popoverController;
    LayerSetController *setController;
    
}
@property (weak,nonatomic) id<ATTreeViewCellDelegate> delegate;
@property (weak,nonatomic) id<ATLayerTreeViewCellDelegate> layerDelegate;
-(void)onExpand:(id)sender;
@end
