//
//  ATCommon.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-3-27.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATLocalCache.h"
@interface ATCommon : NSObject
/**
 保存用户id
 */
+(void)setUserId:(NSString*)userid;
/**
 获取用户id
 */
+(NSString*)getUserId;

/**
 保存用户登录名
 */
+(void)setUserLoginName:(NSString*)loginName;
/**
 获取用户登录名
 */
+(NSString*)getUserLoginName;

/**
 保存用户名称
 */
+(void)setUserName:(NSString*)name;
/**
 获取用户名称
 */
+(NSString*)getUserName;

/**
 保存用户密码
 */
+(void)setUserPassword:(NSString*)pwd;
/**
 获取用户密码
 */
+(NSString*)getUserPassword;

/**
 获取guid
 */
+ (NSString*) stringWithUUID;

/**
 md5 16位 加密 （小写）
 */
+(NSString *)md5:(NSString *)str;
@end
