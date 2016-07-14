//
//  RequestUtil.h
//  MobileOfficeIPad
//
//  Created by antumac on 13-8-13.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATWebServiceUtil.h"
#import <UIKit/UIKit.h>
#import "ATLogHelper.h"
#import "Reachability.h"
@interface ATRequestUtil : NSObject
{
}
@property(nonatomic,retain) NSMutableData* receiveData;
/**
 wifi是否可用
 */
+ (BOOL) IsEnableWIFI;
/**
 3G是否可用
 */
+ (BOOL) IsEnable3G;
/**
 网络是否可用
 */
+ (BOOL) IsEnable;
+(NSString*) stringSyncGetRequest:(NSString*)urlstr;

+(NSString*) stringSyncPostRequest:(NSString*)urlstr data:(NSString*) datastr;
+(NSString*) stringSyncPostRequest:(NSString*)urlstr JsonData:(NSString*) json;
+(NSString*) stringSyncPostRequest:(NSString*)urlstr JsonData:(NSString*) json errorAlertView:(UIAlertView**)alertView;

+(NSString*) stringSyncGetRequest:(NSString*)urlstr errorAlertView:(UIAlertView**)alertView;

+(NSString*) stringSyncPostRequest:(NSString*)urlstr data:(NSString*) datastr errorAlertView:(UIAlertView**)alertView;


+(NSDictionary*) SyncGetRequest:(NSString*)urlstr;
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr data:(NSString*) datastr;
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr JsonData:(NSString*) json;

+(NSDictionary*) SyncGetRequest:(NSString*)urlstr errorAlertView:(UIAlertView**)alertView;
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr data:(NSString*) datastr errorAlertView:(UIAlertView**)alertView;
+(NSDictionary*) SyncPostRequest:(NSString*)urlstr JsonData:(NSString*) json errorAlertView:(UIAlertView**)alertView;



+(void) stringGetSession:(NSString*)urlstr completionHandler:(void (^)(NSString *data,  UIAlertView *alertView))completionHandler;
+(void) stringPostSession:(NSString*)urlstr data:(NSString*) datastr completionHandler:(void (^)(NSString *data,  UIAlertView *alertView))completionHandler;
+(void) stringPostSession:(NSString*)urlstr JsonData:(NSString*) json completionHandler:(void (^)(NSString *data,  UIAlertView *alertView))completionHandler;


+(void) dictionaryGetSession:(NSString*)urlstr completionHandler:(void (^)(NSDictionary *data,  UIAlertView *alertView))completionHandler;
+(void) dictionaryPostSession:(NSString*)urlstr data:(NSString*) datastr completionHandler:(void (^)(NSDictionary *data,  UIAlertView *alertView))completionHandler;
+(void) dictionaryPostSession:(NSString*)urlstr JsonData:(NSString*) json completionHandler:(void (^)(NSDictionary *data,  UIAlertView *alertView))completionHandler;



+(void) AsynGetRequest:(NSString*)urlstr;
+(void) AsynPostRequest:(NSString*)urlstr data:(NSString*) datastr;
@end
