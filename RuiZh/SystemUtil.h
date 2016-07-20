//
//  SystemUtil.h
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetUtil.h"
#import "MBProgressHUD+MJ.h"

@interface SystemUtil : NSObject

+(UIColor *) getColorFromDecimal:(NSString *)decimalString;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *) jsonString;
@end
