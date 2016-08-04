//
//  RoomforecastTableViewCell.m
//  RuiZh
//
//  Created by 行 on 16/8/5.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "RoomforecastTableViewCell.h"

@implementation RoomforecastTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_lefttext release];
    [_righttext release];
    [super dealloc];
}
@end
