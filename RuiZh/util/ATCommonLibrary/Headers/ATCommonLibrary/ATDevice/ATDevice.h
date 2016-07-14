//
//  ATDevice.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-27.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ATCommon.h"
#import "ATKeyChain.h"
@interface ATDevice : NSObject
/**
 获取SIM卡ICCID
 */
+(NSString*) getSIMCode;

/**
 获取设备uuid
 */
+(NSString*) getDeviceID;

/**
 获取电话卡编码
 */
+(NSString*) getTelNumber;

///**
// 获取离线地图目录
// */
//+(NSString*) getOfflineMapDir;
@end
