//
//  SoapRequest.h
//  RuiZh
//
//  Created by 行 on 16/7/12.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoapRequest : NSObject <NSXMLParserDelegate,  NSURLConnectionDelegate>
@property (strong, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) NSMutableString *soapResults;
@property (strong, nonatomic) NSXMLParser *xmlParser;
@property (nonatomic) BOOL elementFound;
@property (strong, nonatomic) NSString *matchingElement;
@property (strong, nonatomic) NSURLConnection *conn;
@end
