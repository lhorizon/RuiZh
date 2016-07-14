//
//  ChineseDatePicker.h
//  Moa_Iphone
//
//  Created by AntuBwm on 14-2-24.
//  Copyright (c) 2014年 AntuBwm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ATChinesDatePickerDelegate;
@interface ATChineseDatePicker : UIView
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property(retain,nonatomic)NSString *selectDateTime;
@property (weak,nonatomic) id<ATChinesDatePickerDelegate> delegate;
@property(retain,nonatomic)UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIView *btnView;
- (IBAction)btnOK:(id)sender;
- (IBAction)btnClear:(id)sender;
- (IBAction)btnCancel:(id)sender;
@end
@protocol ATChinesDatePickerDelegate <NSObject>

//@required
-(void)dateTimeSesect:(NSString*)dateTime;
@end
