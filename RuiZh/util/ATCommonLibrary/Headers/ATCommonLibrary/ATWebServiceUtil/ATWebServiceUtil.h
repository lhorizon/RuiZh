//
//  WebServiceHelper.h
//  Moa_Iphone
//
//  Created by AntuBwm on 14-2-17.
//  Copyright (c) 2014年 AntuBwm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATWebServiceUtil : NSObject<NSXMLParserDelegate>
{
    NSString *currentElement;
}
@property(nonatomic,retain)NSString *xmlValue;
-(NSString*)XMLParser:(NSData*)data;
@end
