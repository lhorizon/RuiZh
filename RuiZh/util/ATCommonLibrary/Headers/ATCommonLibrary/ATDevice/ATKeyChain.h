//
//  ATKeyChain.h
//  TreeViewDemo
//
//  Created by AntuBwm on 15-1-6.
//  Copyright (c) 2015年 Baiwm. All rights reserved.
//

#import <Foundation/Foundation.h>
NSString *const ATKEYCHAIN = @"com.Antu";
@interface ATKeyChain : NSObject
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data ;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
@end
