//
//  SystemUtil.m
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "SystemUtil.h"

@implementation SystemUtil


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
 
    
    return dic;
    
}

@end
