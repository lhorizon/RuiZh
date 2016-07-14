//
//  NSDate+Common.h
//  Jgzb
//
//  Created by AntuBwm on 14-8-7.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Common)
+(id)now;
/**
 返回年底
 */
-(NSInteger)year;
/**
 返回1-12
 */
-(NSInteger)month;
/**
 返回1-31
 */
-(NSInteger)day;

/**
 星期(1-7)
 */
- (NSInteger)weekday;

/**
 星期(一-日)
 */
- (NSString*)CNWeekday;

/**
 返回小时部分
 */
- (NSInteger)hour;
/**
 返回分钟部分
 */
- (NSInteger)minute;
/**
 返回秒钟部分
 */
- (NSInteger)second;
/**
 返回yyyy-MM-dd
 */
-(NSString*)date;
/**
 返回yyyy-MM
 */
-(NSString*)yearMonth;

/**
 返回yyyy-MM格式
 */
+(NSDateFormatter*)yearMonthFormatter;
/**
 返回yyyy-MM-dd格式
 */
+(NSDateFormatter*)CNDateFormatter;
/**
 返回yyyy-MM-dd HH:mm:ss格式
 */
+(NSDateFormatter*)CNDateTimeFormatter;

-(NSDateComponents*)dateComponents;
-(NSDateComponents*)timeComponents;
@end
