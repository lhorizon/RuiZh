//
//  UIViewController+PickerBack.h
//  ThatPDF
//
//  Created by AntuBwm on 14-6-27.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (PickerBack)
@property(retain,nonatomic)UIView *PickerBackView;

-(void)showPickerBackView:(BOOL)show;
/**
 显示某个subview，隐藏其他所有subview
 隐藏某个subview，不管其他所有的subview
 */
-(void)showPickerBackView:(BOOL)show subView:(UIView*)view;
@end
