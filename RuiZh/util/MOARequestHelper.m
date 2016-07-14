//
//  MOARequestUtil.m
//  MOA_IOS
//
//  Created by wm bai on 13-9-3.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "MOARequestHelper.h"

@implementation MOARequestHelper
+(NSDictionary*) SyncGetRequest:(NSString*)urlstr
{
    urlstr=[NSString stringWithFormat:@"%@/%@",[SystemHelper getServerUrl],urlstr];
    return [super SyncGetRequest:urlstr];
}

+(NSDictionary*) SyncPostRequest:(NSString*)urlstr data:(NSString*) datastr
{
    urlstr=[NSString stringWithFormat:@"%@/%@",[SystemHelper getServerUrl],urlstr];
    return [super SyncPostRequest:urlstr data:datastr];
}
+(NSDictionary*) SyncGetRequest:(NSString*)urlstr errorAlertView:(UIAlertView**)alertView
{
    urlstr=[NSString stringWithFormat:@"%@/%@",[SystemHelper getServerUrl],urlstr];
    return [super SyncGetRequest:urlstr errorAlertView:alertView];
}
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr data:(NSString*) datastr errorAlertView:(UIAlertView**)alertView
{
    urlstr=[NSString stringWithFormat:@"%@/%@",[SystemHelper getServerUrl],urlstr];
    return [super SyncPostRequest:urlstr data:datastr errorAlertView:alertView];
}
+(void) AsynGetRequest:(NSString*)urlstr
{
    urlstr=[NSString stringWithFormat:@"%@/%@",[SystemHelper getServerUrl],urlstr];
    [super AsynGetRequest:urlstr];
}
+(void) AsynPostRequest:(NSString*)urlstr data:(NSString*) datastr
{
    urlstr=[NSString stringWithFormat:@"%@/%@",[SystemHelper getServerUrl],urlstr];
    [super AsynPostRequest:urlstr data:datastr];
}

+(void)wrideLogWithType:(int)type location:(NSString*)loc remark:(NSString*)remark intent:(NSString*)intent intentParm:(NSString*)parm category:(NSString*)category
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *logTime=[[dateformatter stringFromDate:senddate]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *deviceId=[ATDevice getDeviceID];
    NSString *userId=[ATCommon getUserId];
    NSString *appName=@"";
    NSString *versionName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];

    if (![parm isEqualToString:@""]) {
        parm=[parm stringByRemovingPercentEncoding];
        NSMutableString *json=[NSMutableString stringWithString:@"{op:"];
        NSArray *ar=[parm componentsSeparatedByString:@"?"];
        [json appendFormat:@"%@",[ar objectAtIndex:0]];
        if ([ar count]==2) {
            NSArray *par=[[ar objectAtIndex:1] componentsSeparatedByString:@"&"];
            for (NSString *p in par) {
                NSArray *pv=[p componentsSeparatedByString:@"="];
                [json appendString:@","];
                [json appendFormat:@"%@:%@",[pv objectAtIndex:0],[pv objectAtIndex:1]];
            }
        }
        [json appendString:@"}"];
        parm=[json stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
   // parm=@"{op:WorkFlowSubmit2,iid:283392,wiid:2516676,users:[{ename:e2f741be-4263-4ec2-85da-1e901a396703,users:{机要室传送:[12dd8484-4312-419c-92b7-f5455fe048be]},fname:局领导意见_机要室整理}]}";
    
    
    [self SyncGetRequest:[NSString stringWithFormat:@"Log?log_type=%d&log_userid=%@&log_device_id=%@&log_apk_name=%@&log_apk_version=%@&log_time=%@&log_location=%@&log_remark=%@&log_remark2=&log_remark3=&log_remark4=&log_intent=%@&log_intent_parm=%@&log_category=%@",type,userId,deviceId,appName,versionName,logTime,loc,[remark stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],intent,parm,[category stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] errorAlertView:nil];
}
@end
