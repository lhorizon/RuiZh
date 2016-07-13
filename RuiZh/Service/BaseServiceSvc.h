#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class BaseServiceSvc_HelloWorld;
@class BaseServiceSvc_HelloWorldResponse;
@class BaseServiceSvc_WriteSystemLog;
@class BaseServiceSvc_WriteSystemLogResponse;
@class BaseServiceSvc_CheckUserLogin;
@class BaseServiceSvc_CheckUserLoginResponse;
@class BaseServiceSvc_GetFormxLegend;
@class BaseServiceSvc_GetFormxLegendResponse;
@class BaseServiceSvc_GetFormx;
@class BaseServiceSvc_GetFormxResponse;
@class BaseServiceSvc_GetFormxForecat;
@class BaseServiceSvc_GetFormxForecatResponse;
@class BaseServiceSvc_GetBusinessAnalysisReportData;
@class BaseServiceSvc_GetBusinessAnalysisReportDataResponse;
@class BaseServiceSvc_GetBusinessLevelReportData;
@class BaseServiceSvc_GetBusinessLevelReportDataResponse;
@class BaseServiceSvc_GetBusinessLevelReportDataByTyp;
@class BaseServiceSvc_GetBusinessLevelReportDataByTypResponse;
@class BaseServiceSvc_ModifyFormxSta;
@class BaseServiceSvc_ModifyFormxStaResponse;
@class BaseServiceSvc_ExistRole;
@class BaseServiceSvc_ExistRoleResponse;
@class BaseServiceSvc_GetUserRoles;
@class BaseServiceSvc_GetUserRolesResponse;
@class BaseServiceSvc_GetNewVersion;
@class BaseServiceSvc_GetNewVersionResponse;
@interface BaseServiceSvc_HelloWorld : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_HelloWorld *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_HelloWorldResponse : NSObject {
	
/* elements */
	NSString * HelloWorldResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_HelloWorldResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * HelloWorldResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_WriteSystemLog : NSObject {
	
/* elements */
	NSString * newLogInfoJson;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_WriteSystemLog *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * newLogInfoJson;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_WriteSystemLogResponse : NSObject {
	
/* elements */
	NSString * WriteSystemLogResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_WriteSystemLogResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * WriteSystemLogResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_CheckUserLogin : NSObject {
	
/* elements */
	NSString * user;
	NSString * pwd;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_CheckUserLogin *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * user;
@property (retain) NSString * pwd;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_CheckUserLoginResponse : NSObject {
	
/* elements */
	NSString * CheckUserLoginResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_CheckUserLoginResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * CheckUserLoginResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetFormxLegend : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetFormxLegend *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetFormxLegendResponse : NSObject {
	
/* elements */
	NSString * GetFormxLegendResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetFormxLegendResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetFormxLegendResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetFormx : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetFormx *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetFormxResponse : NSObject {
	
/* elements */
	NSString * GetFormxResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetFormxResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetFormxResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetFormxForecat : NSObject {
	
/* elements */
	NSString * dtfrom;
	NSNumber * days;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetFormxForecat *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dtfrom;
@property (retain) NSNumber * days;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetFormxForecatResponse : NSObject {
	
/* elements */
	NSString * GetFormxForecatResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetFormxForecatResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetFormxForecatResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetBusinessAnalysisReportData : NSObject {
	
/* elements */
	NSString * dtstart;
	NSString * dtend;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetBusinessAnalysisReportData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dtstart;
@property (retain) NSString * dtend;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetBusinessAnalysisReportDataResponse : NSObject {
	
/* elements */
	NSString * GetBusinessAnalysisReportDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetBusinessAnalysisReportDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetBusinessAnalysisReportDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetBusinessLevelReportData : NSObject {
	
/* elements */
	NSString * dtstart;
	NSString * dtend;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetBusinessLevelReportData *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dtstart;
@property (retain) NSString * dtend;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetBusinessLevelReportDataResponse : NSObject {
	
/* elements */
	NSString * GetBusinessLevelReportDataResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetBusinessLevelReportDataResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetBusinessLevelReportDataResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetBusinessLevelReportDataByTyp : NSObject {
	
/* elements */
	NSString * dtdate;
	NSString * typ;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetBusinessLevelReportDataByTyp *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * dtdate;
@property (retain) NSString * typ;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetBusinessLevelReportDataByTypResponse : NSObject {
	
/* elements */
	NSString * GetBusinessLevelReportDataByTypResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetBusinessLevelReportDataByTypResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetBusinessLevelReportDataByTypResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_ModifyFormxSta : NSObject {
	
/* elements */
	NSString * user;
	NSString * room;
	NSString * oldsta;
	NSString * newsta;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_ModifyFormxSta *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * user;
@property (retain) NSString * room;
@property (retain) NSString * oldsta;
@property (retain) NSString * newsta;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_ModifyFormxStaResponse : NSObject {
	
/* elements */
	NSString * ModifyFormxStaResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_ModifyFormxStaResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * ModifyFormxStaResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_ExistRole : NSObject {
	
/* elements */
	NSString * emp;
	NSString * funt;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_ExistRole *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * emp;
@property (retain) NSString * funt;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_ExistRoleResponse : NSObject {
	
/* elements */
	NSString * ExistRoleResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_ExistRoleResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * ExistRoleResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetUserRoles : NSObject {
	
/* elements */
	NSString * emp;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetUserRoles *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * emp;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetUserRolesResponse : NSObject {
	
/* elements */
	NSString * GetUserRolesResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetUserRolesResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetUserRolesResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetNewVersion : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetNewVersion *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface BaseServiceSvc_GetNewVersionResponse : NSObject {
	
/* elements */
	NSString * GetNewVersionResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (BaseServiceSvc_GetNewVersionResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetNewVersionResult;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "BaseServiceSvc.h"
@class BaseServiceSoap;
@class BaseServiceSoap12;
@interface BaseServiceSvc : NSObject {
	
}
+ (BaseServiceSoap *)BaseServiceSoap;
+ (BaseServiceSoap12 *)BaseServiceSoap12;
@end
@class BaseServiceSoapResponse;
@class BaseServiceSoapOperation;
@protocol BaseServiceSoapResponseDelegate <NSObject>
- (void) operation:(BaseServiceSoapOperation *)operation completedWithResponse:(BaseServiceSoapResponse *)response;
@end
@interface BaseServiceSoap : NSObject <BaseServiceSoapResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(BaseServiceSoapOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (BaseServiceSoapResponse *)HelloWorldUsingParameters:(BaseServiceSvc_HelloWorld *)aParameters ;
- (void)HelloWorldAsyncUsingParameters:(BaseServiceSvc_HelloWorld *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)WriteSystemLogUsingParameters:(BaseServiceSvc_WriteSystemLog *)aParameters ;
- (void)WriteSystemLogAsyncUsingParameters:(BaseServiceSvc_WriteSystemLog *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)CheckUserLoginUsingParameters:(BaseServiceSvc_CheckUserLogin *)aParameters ;
- (void)CheckUserLoginAsyncUsingParameters:(BaseServiceSvc_CheckUserLogin *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetFormxLegendUsingParameters:(BaseServiceSvc_GetFormxLegend *)aParameters ;
- (void)GetFormxLegendAsyncUsingParameters:(BaseServiceSvc_GetFormxLegend *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetFormxUsingParameters:(BaseServiceSvc_GetFormx *)aParameters ;
- (void)GetFormxAsyncUsingParameters:(BaseServiceSvc_GetFormx *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetFormxForecatUsingParameters:(BaseServiceSvc_GetFormxForecat *)aParameters ;
- (void)GetFormxForecatAsyncUsingParameters:(BaseServiceSvc_GetFormxForecat *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetBusinessAnalysisReportDataUsingParameters:(BaseServiceSvc_GetBusinessAnalysisReportData *)aParameters ;
- (void)GetBusinessAnalysisReportDataAsyncUsingParameters:(BaseServiceSvc_GetBusinessAnalysisReportData *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetBusinessLevelReportDataUsingParameters:(BaseServiceSvc_GetBusinessLevelReportData *)aParameters ;
- (void)GetBusinessLevelReportDataAsyncUsingParameters:(BaseServiceSvc_GetBusinessLevelReportData *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetBusinessLevelReportDataByTypUsingParameters:(BaseServiceSvc_GetBusinessLevelReportDataByTyp *)aParameters ;
- (void)GetBusinessLevelReportDataByTypAsyncUsingParameters:(BaseServiceSvc_GetBusinessLevelReportDataByTyp *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)ModifyFormxStaUsingParameters:(BaseServiceSvc_ModifyFormxSta *)aParameters ;
- (void)ModifyFormxStaAsyncUsingParameters:(BaseServiceSvc_ModifyFormxSta *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)ExistRoleUsingParameters:(BaseServiceSvc_ExistRole *)aParameters ;
- (void)ExistRoleAsyncUsingParameters:(BaseServiceSvc_ExistRole *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetUserRolesUsingParameters:(BaseServiceSvc_GetUserRoles *)aParameters ;
- (void)GetUserRolesAsyncUsingParameters:(BaseServiceSvc_GetUserRoles *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
- (BaseServiceSoapResponse *)GetNewVersionUsingParameters:(BaseServiceSvc_GetNewVersion *)aParameters ;
- (void)GetNewVersionAsyncUsingParameters:(BaseServiceSvc_GetNewVersion *)aParameters  delegate:(id<BaseServiceSoapResponseDelegate>)responseDelegate;
@end
@interface BaseServiceSoapOperation : NSOperation {
	BaseServiceSoap *binding;
	BaseServiceSoapResponse *response;
	id<BaseServiceSoapResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) BaseServiceSoap *binding;
@property (readonly) BaseServiceSoapResponse *response;
@property (nonatomic, assign) id<BaseServiceSoapResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate;
@end
@interface BaseServiceSoap_HelloWorld : BaseServiceSoapOperation {
	BaseServiceSvc_HelloWorld * parameters;
}
@property (retain) BaseServiceSvc_HelloWorld * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_HelloWorld *)aParameters
;
@end
@interface BaseServiceSoap_WriteSystemLog : BaseServiceSoapOperation {
	BaseServiceSvc_WriteSystemLog * parameters;
}
@property (retain) BaseServiceSvc_WriteSystemLog * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_WriteSystemLog *)aParameters
;
@end
@interface BaseServiceSoap_CheckUserLogin : BaseServiceSoapOperation {
	BaseServiceSvc_CheckUserLogin * parameters;
}
@property (retain) BaseServiceSvc_CheckUserLogin * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_CheckUserLogin *)aParameters
;
@end
@interface BaseServiceSoap_GetFormxLegend : BaseServiceSoapOperation {
	BaseServiceSvc_GetFormxLegend * parameters;
}
@property (retain) BaseServiceSvc_GetFormxLegend * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetFormxLegend *)aParameters
;
@end
@interface BaseServiceSoap_GetFormx : BaseServiceSoapOperation {
	BaseServiceSvc_GetFormx * parameters;
}
@property (retain) BaseServiceSvc_GetFormx * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetFormx *)aParameters
;
@end
@interface BaseServiceSoap_GetFormxForecat : BaseServiceSoapOperation {
	BaseServiceSvc_GetFormxForecat * parameters;
}
@property (retain) BaseServiceSvc_GetFormxForecat * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetFormxForecat *)aParameters
;
@end
@interface BaseServiceSoap_GetBusinessAnalysisReportData : BaseServiceSoapOperation {
	BaseServiceSvc_GetBusinessAnalysisReportData * parameters;
}
@property (retain) BaseServiceSvc_GetBusinessAnalysisReportData * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetBusinessAnalysisReportData *)aParameters
;
@end
@interface BaseServiceSoap_GetBusinessLevelReportData : BaseServiceSoapOperation {
	BaseServiceSvc_GetBusinessLevelReportData * parameters;
}
@property (retain) BaseServiceSvc_GetBusinessLevelReportData * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetBusinessLevelReportData *)aParameters
;
@end
@interface BaseServiceSoap_GetBusinessLevelReportDataByTyp : BaseServiceSoapOperation {
	BaseServiceSvc_GetBusinessLevelReportDataByTyp * parameters;
}
@property (retain) BaseServiceSvc_GetBusinessLevelReportDataByTyp * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetBusinessLevelReportDataByTyp *)aParameters
;
@end
@interface BaseServiceSoap_ModifyFormxSta : BaseServiceSoapOperation {
	BaseServiceSvc_ModifyFormxSta * parameters;
}
@property (retain) BaseServiceSvc_ModifyFormxSta * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_ModifyFormxSta *)aParameters
;
@end
@interface BaseServiceSoap_ExistRole : BaseServiceSoapOperation {
	BaseServiceSvc_ExistRole * parameters;
}
@property (retain) BaseServiceSvc_ExistRole * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_ExistRole *)aParameters
;
@end
@interface BaseServiceSoap_GetUserRoles : BaseServiceSoapOperation {
	BaseServiceSvc_GetUserRoles * parameters;
}
@property (retain) BaseServiceSvc_GetUserRoles * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetUserRoles *)aParameters
;
@end
@interface BaseServiceSoap_GetNewVersion : BaseServiceSoapOperation {
	BaseServiceSvc_GetNewVersion * parameters;
}
@property (retain) BaseServiceSvc_GetNewVersion * parameters;
- (id)initWithBinding:(BaseServiceSoap *)aBinding delegate:(id<BaseServiceSoapResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetNewVersion *)aParameters
;
@end
@interface BaseServiceSoap_envelope : NSObject {
}
+ (BaseServiceSoap_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface BaseServiceSoapResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
@class BaseServiceSoap12Response;
@class BaseServiceSoap12Operation;
@protocol BaseServiceSoap12ResponseDelegate <NSObject>
- (void) operation:(BaseServiceSoap12Operation *)operation completedWithResponse:(BaseServiceSoap12Response *)response;
@end
@interface BaseServiceSoap12 : NSObject <BaseServiceSoap12ResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(BaseServiceSoap12Operation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (BaseServiceSoap12Response *)HelloWorldUsingParameters:(BaseServiceSvc_HelloWorld *)aParameters ;
- (void)HelloWorldAsyncUsingParameters:(BaseServiceSvc_HelloWorld *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)WriteSystemLogUsingParameters:(BaseServiceSvc_WriteSystemLog *)aParameters ;
- (void)WriteSystemLogAsyncUsingParameters:(BaseServiceSvc_WriteSystemLog *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)CheckUserLoginUsingParameters:(BaseServiceSvc_CheckUserLogin *)aParameters ;
- (void)CheckUserLoginAsyncUsingParameters:(BaseServiceSvc_CheckUserLogin *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetFormxLegendUsingParameters:(BaseServiceSvc_GetFormxLegend *)aParameters ;
- (void)GetFormxLegendAsyncUsingParameters:(BaseServiceSvc_GetFormxLegend *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetFormxUsingParameters:(BaseServiceSvc_GetFormx *)aParameters ;
- (void)GetFormxAsyncUsingParameters:(BaseServiceSvc_GetFormx *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetFormxForecatUsingParameters:(BaseServiceSvc_GetFormxForecat *)aParameters ;
- (void)GetFormxForecatAsyncUsingParameters:(BaseServiceSvc_GetFormxForecat *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetBusinessAnalysisReportDataUsingParameters:(BaseServiceSvc_GetBusinessAnalysisReportData *)aParameters ;
- (void)GetBusinessAnalysisReportDataAsyncUsingParameters:(BaseServiceSvc_GetBusinessAnalysisReportData *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetBusinessLevelReportDataUsingParameters:(BaseServiceSvc_GetBusinessLevelReportData *)aParameters ;
- (void)GetBusinessLevelReportDataAsyncUsingParameters:(BaseServiceSvc_GetBusinessLevelReportData *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetBusinessLevelReportDataByTypUsingParameters:(BaseServiceSvc_GetBusinessLevelReportDataByTyp *)aParameters ;
- (void)GetBusinessLevelReportDataByTypAsyncUsingParameters:(BaseServiceSvc_GetBusinessLevelReportDataByTyp *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)ModifyFormxStaUsingParameters:(BaseServiceSvc_ModifyFormxSta *)aParameters ;
- (void)ModifyFormxStaAsyncUsingParameters:(BaseServiceSvc_ModifyFormxSta *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)ExistRoleUsingParameters:(BaseServiceSvc_ExistRole *)aParameters ;
- (void)ExistRoleAsyncUsingParameters:(BaseServiceSvc_ExistRole *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetUserRolesUsingParameters:(BaseServiceSvc_GetUserRoles *)aParameters ;
- (void)GetUserRolesAsyncUsingParameters:(BaseServiceSvc_GetUserRoles *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
- (BaseServiceSoap12Response *)GetNewVersionUsingParameters:(BaseServiceSvc_GetNewVersion *)aParameters ;
- (void)GetNewVersionAsyncUsingParameters:(BaseServiceSvc_GetNewVersion *)aParameters  delegate:(id<BaseServiceSoap12ResponseDelegate>)responseDelegate;
@end
@interface BaseServiceSoap12Operation : NSOperation {
	BaseServiceSoap12 *binding;
	BaseServiceSoap12Response *response;
	id<BaseServiceSoap12ResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) BaseServiceSoap12 *binding;
@property (readonly) BaseServiceSoap12Response *response;
@property (nonatomic, assign) id<BaseServiceSoap12ResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate;
@end
@interface BaseServiceSoap12_HelloWorld : BaseServiceSoap12Operation {
	BaseServiceSvc_HelloWorld * parameters;
}
@property (retain) BaseServiceSvc_HelloWorld * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_HelloWorld *)aParameters
;
@end
@interface BaseServiceSoap12_WriteSystemLog : BaseServiceSoap12Operation {
	BaseServiceSvc_WriteSystemLog * parameters;
}
@property (retain) BaseServiceSvc_WriteSystemLog * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_WriteSystemLog *)aParameters
;
@end
@interface BaseServiceSoap12_CheckUserLogin : BaseServiceSoap12Operation {
	BaseServiceSvc_CheckUserLogin * parameters;
}
@property (retain) BaseServiceSvc_CheckUserLogin * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_CheckUserLogin *)aParameters
;
@end
@interface BaseServiceSoap12_GetFormxLegend : BaseServiceSoap12Operation {
	BaseServiceSvc_GetFormxLegend * parameters;
}
@property (retain) BaseServiceSvc_GetFormxLegend * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetFormxLegend *)aParameters
;
@end
@interface BaseServiceSoap12_GetFormx : BaseServiceSoap12Operation {
	BaseServiceSvc_GetFormx * parameters;
}
@property (retain) BaseServiceSvc_GetFormx * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetFormx *)aParameters
;
@end
@interface BaseServiceSoap12_GetFormxForecat : BaseServiceSoap12Operation {
	BaseServiceSvc_GetFormxForecat * parameters;
}
@property (retain) BaseServiceSvc_GetFormxForecat * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetFormxForecat *)aParameters
;
@end
@interface BaseServiceSoap12_GetBusinessAnalysisReportData : BaseServiceSoap12Operation {
	BaseServiceSvc_GetBusinessAnalysisReportData * parameters;
}
@property (retain) BaseServiceSvc_GetBusinessAnalysisReportData * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetBusinessAnalysisReportData *)aParameters
;
@end
@interface BaseServiceSoap12_GetBusinessLevelReportData : BaseServiceSoap12Operation {
	BaseServiceSvc_GetBusinessLevelReportData * parameters;
}
@property (retain) BaseServiceSvc_GetBusinessLevelReportData * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetBusinessLevelReportData *)aParameters
;
@end
@interface BaseServiceSoap12_GetBusinessLevelReportDataByTyp : BaseServiceSoap12Operation {
	BaseServiceSvc_GetBusinessLevelReportDataByTyp * parameters;
}
@property (retain) BaseServiceSvc_GetBusinessLevelReportDataByTyp * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetBusinessLevelReportDataByTyp *)aParameters
;
@end
@interface BaseServiceSoap12_ModifyFormxSta : BaseServiceSoap12Operation {
	BaseServiceSvc_ModifyFormxSta * parameters;
}
@property (retain) BaseServiceSvc_ModifyFormxSta * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_ModifyFormxSta *)aParameters
;
@end
@interface BaseServiceSoap12_ExistRole : BaseServiceSoap12Operation {
	BaseServiceSvc_ExistRole * parameters;
}
@property (retain) BaseServiceSvc_ExistRole * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_ExistRole *)aParameters
;
@end
@interface BaseServiceSoap12_GetUserRoles : BaseServiceSoap12Operation {
	BaseServiceSvc_GetUserRoles * parameters;
}
@property (retain) BaseServiceSvc_GetUserRoles * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetUserRoles *)aParameters
;
@end
@interface BaseServiceSoap12_GetNewVersion : BaseServiceSoap12Operation {
	BaseServiceSvc_GetNewVersion * parameters;
}
@property (retain) BaseServiceSvc_GetNewVersion * parameters;
- (id)initWithBinding:(BaseServiceSoap12 *)aBinding delegate:(id<BaseServiceSoap12ResponseDelegate>)aDelegate
	parameters:(BaseServiceSvc_GetNewVersion *)aParameters
;
@end
@interface BaseServiceSoap12_envelope : NSObject {
}
+ (BaseServiceSoap12_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface BaseServiceSoap12Response : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
