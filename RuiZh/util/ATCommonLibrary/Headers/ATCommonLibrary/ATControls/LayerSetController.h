//
//  LayerSetController.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-7-16.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LayerSetController : UIViewController<UITextFieldDelegate>
@property(retain,nonatomic)id owner;
@property(assign,nonatomic)SEL alphaSliderChanged;
@property (weak, nonatomic) IBOutlet UISlider *sliderAlpha;
@property (weak, nonatomic) IBOutlet UITextField *txtAlpha;
@property(assign,nonatomic)float layerAlpha;
- (IBAction)alphaChanged:(UISlider *)sender;
@end
