//
//  UserModel.m
//  RuiZh
//
//  Created by 行 on 16/7/10.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.pwd forKey:@"pwd"];
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super init]) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.pwd = [coder decodeObjectForKey:@"pwd"];
    }
    return self;
}
@end
