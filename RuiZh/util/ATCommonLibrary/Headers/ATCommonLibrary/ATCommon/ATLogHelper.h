//
//  ATLogHelper.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-8-11.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Common.h"
/**
 日志类型
 add by baiwm
 */
typedef enum {
    ErrorLog = 0,     //错误日志
    InfoLog           //消息日志
}LogType;
/**
 日志来源
 add by baiwm
 */
@interface ATLogSource: NSObject
/**
 类名*/
@property(retain,nonatomic)NSString *className;
/**
 行数
 */
@property(assign,nonatomic)int rowIndex;
+(id)logSourceWithClassName:(NSString*)className row:(int)rowIndex;
@end
@interface ATLogHelper : NSObject
/**
 日志目录路径
 */
+(NSString*)logDirectory;
/**
 当天的日志文件路径
 */
+(NSString*)logFilePath;
+(void)WriteLog:(NSString*)message logType:(LogType)type logSource:(ATLogSource*)source;

@end
