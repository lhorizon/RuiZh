//
//  UncaughtExceptionHandler.h
//  TreeViewDemo
//  应用崩溃处理类
//  Created by AntuBwm on 14-8-12.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UncaughtExceptionHandler : NSObject
{
    BOOL dismissed;
}
@end
void InstallUncaughtExceptionHandler();