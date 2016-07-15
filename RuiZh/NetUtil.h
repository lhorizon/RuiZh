//
//  NetUtil.h
//  RuiZh
//
//  Created by 行 on 16/7/14.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"
#import "SystemUtil.h"

#define  defaultDomain @"http://61.4.83.137/rzservice/RZHotelService.asmx"

@interface NetUtil : NSObject
 
+(NSDictionary *) doGetSync:(NSString *) paramString;
+(NSDictionary *) doGetSync:(NSString *)domain paramString:(NSString *) paramString;
+ (void) doGetAsync;
@end
