//
//  NetUtil.m
//  RuiZh
//
//  Created by 行 on 16/7/14.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "NetUtil.h"

@implementation NetUtil

+(void) doGetSync:(NSString *) paramString{
    [self doGetSync:defaultDomain paramString:paramString];
    
}
+(void) doGetSync :(NSString *)domain paramString:(NSString *) paramString{
    //    1.设置请求路径
    NSString *urlStr=[domain stringByAppendingString:paramString ];
    NSURL *url=[NSURL URLWithString:urlStr];
    
    //    2.创建请求对象
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //    request.
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"error: %@",[error localizedDescription]);
    }else{
        NSLog(@"response : %@",response);
        NSLog(@"backData : %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }
    
}
+(void) doGetAsync{
    
}
@end
