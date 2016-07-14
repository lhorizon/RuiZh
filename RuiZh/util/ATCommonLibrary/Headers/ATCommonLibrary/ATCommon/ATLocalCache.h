//
//  ATLocalCache.h
//  本地缓存
//
//  Created by AntuBwm on 14-2-21.
//  Copyright (c) 2014年 AntuBwm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATLocalCache : NSObject
/**
 缓存数据到本地文件中
 */
+ (void)saveActionData:(NSArray *)fileArray withFileName:(NSString*)fileName;
/**
 加载本地文件中的缓存数据
 */
+ (NSMutableArray *)loadActionData:(NSString *)fileName;

/**
 删除缓存文件
 */
+(void)deleteDataWithFileName:(NSString*)fileName;

/**
 获取指定文件名的沙盒路径
 */
+(NSString*)FileOperDocumentFilePath:(NSString*)fileName;
@end
