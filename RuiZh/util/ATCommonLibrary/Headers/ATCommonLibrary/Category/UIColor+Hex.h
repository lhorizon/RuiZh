//
//  UIColor+Hex.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-10-30.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *) colorWithHexString: (NSString *)color;
/**
 RGB,值直接是rgb值，不需要除以255以后的值
 */
+ (UIColor *) colorWithRGB:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;
@end
