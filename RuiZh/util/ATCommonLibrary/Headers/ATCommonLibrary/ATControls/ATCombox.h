//
//  ATCombox.h
//  TreeViewDemo
//
//  Created by AntuBwm on 14-6-5.
//  Copyright (c) 2014年 Baiwm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATCombox : UIView<UITableViewDataSource,UITableViewDelegate>
{

}
@property(retain,nonatomic)NSArray *data;
@property(retain,nonatomic)NSDictionary *selectItem;
@property(retain,nonatomic)UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIView *btnView;
- (IBAction)btnOK:(id)sender;
- (IBAction)btnClear:(id)sender;
- (IBAction)btnCancel:(id)sender;
@end
