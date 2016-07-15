//
//  NetUtil.m
//  RuiZh
//
//  Created by 行 on 16/7/14.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "NetUtil.h"

@implementation NetUtil

+(NSDictionary *) doGetSync:(NSString *) paramString{
    return [self doGetSync:defaultDomain paramString:paramString];
}
+(NSDictionary *) doGetSync :(NSString *)domain paramString:(NSString *) paramString{
    //    1.设置请求路径
    NSString *urlStr=[domain stringByAppendingString:paramString ];
    NSURL *url=[NSURL URLWithString:urlStr];
    
    //    2.创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //    request.
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data =  [NSData dataWithContentsOfURL:url];
    GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithData:data options:GDataXMLInvalidKind error:&error];
    GDataXMLElement *arr = [doc rootElement];
    NSArray *names = [arr children];
    GDataXMLElement *name = [names objectAtIndex:0];
    
   NSLog(@"response data: %@",[name stringValue] );
    return  [SystemUtil dictionaryWithJsonString:[name stringValue]];
}
+(void) doGetAsync{
    
}
@end
