//
//  MOARequestUtil.h
//  MOA_IOS
//
//  Created by wm bai on 13-9-3.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATRequestUtil.h"
#import "SystemHelper.h"
#import "ATCommon.h"
#import "ATDevice.h"
@interface MOARequestHelper : ATRequestUtil
+(NSDictionary*) SyncGetRequest:(NSString*)urlstr;
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr data:(NSString*) datastr;
+(NSDictionary*) SyncGetRequest:(NSString*)urlstr errorAlertView:(UIAlertView**)alertView;
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr data:(NSString*) datastr errorAlertView:(UIAlertView**)alertView;
+(void) AsynGetRequest:(NSString*)urlstr;

+(void) AsynPostRequest:(NSString*)urlstr data:(NSString*) datastr;

+(void)wrideLogWithType:(int)type location:(NSString*)loc remark:(NSString*)remark intent:(NSString*)intent intentParm:(NSString*)parm category:(NSString*)category;
@end
