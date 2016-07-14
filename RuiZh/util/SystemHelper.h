//
//  SystemHelper.h
//  Moa_Iphone
//
//  Created by AntuBwm on 14-2-17.
//  Copyright (c) 2014年 AntuBwm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "ATLocalCache.h"
@interface SystemHelper : NSObject
/**
 获取服务地址（如：http://192.168.0.18/MOAWebService/MOAService.asmx）
 */
+(NSString*)getServerUrl;
/**
 是否保存用户
 */
+(BOOL)checkSaveUser;


@end
