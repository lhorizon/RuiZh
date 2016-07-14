 //
//  SystemHelper.m
//  Moa_Iphone
//
//  Created by AntuBwm on 14-2-17.
//  Copyright (c) 2014年 AntuBwm. All rights reserved.
//

#import "SystemHelper.h"


#define SYSTEMVERSION @"systemVersion"
#define SYSTEMVERSIONCODE @"systemVersionCode"
#define SAVEUSER @"saveUser_preference"
#define HOSTURL @"hosturl_preference"

@implementation SystemHelper
#pragma - mark 系统设置
+(NSString*)getServerUrl
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *serverUrl= [defaults objectForKey:HOSTURL];
    if (!serverUrl) {
        NSLog(@"服务地址为空。");
    }
    return [NSString stringWithFormat:@"http://%@/MOAService.asmx",serverUrl];
}
+(BOOL)checkSaveUser
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL saveUser= [[defaults objectForKey:SAVEUSER] boolValue];
    return saveUser;
}


@end
