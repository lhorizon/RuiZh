//
//  AnalyticsViewController.m
//  RuiZh
//
//  Created by 行 on 16/8/6.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "AnalyticsViewController.h"

@interface AnalyticsViewController ()

@end

@implementation AnalyticsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isjianbao = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tabanalytics addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged ];

    //    self.toaday=[dateFormatter stringFromDate:epochNSDate];
    //    self.textBeganDate.text = self.toaday;
    NSDate *epochNSDate = [[NSDate alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today =[dateFormatter stringFromDate:epochNSDate];
    self.textfieldEndTime.text = today;
    self.textfieldBeginTime.text = today;
    
}
-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    switch (Index)
    {
        case 0:
            self.isjianbao = YES;
            [self.jianbao setHidden:NO];
            [self.viewShourufenxi setHidden:YES];
            [self loadYingyeJianbao:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
            break;
        case 1:
            self.isjianbao = NO;
            [self.jianbao setHidden:YES];
            [self.viewShourufenxi setHidden:NO];
            break;
            
    }
}
//加载营业简报
-(void) loadYingyeJianbao:(NSString *) dtstart dtend:(NSString *) dtend {
    [MBProgressHUD showMessage:@"加载"];
    NSString *urlStr=[NSString stringWithFormat:@"/GetBusinessLevelReportData?dtstart=%@&dtend=%@",dtstart,dtend];
    NSDictionary *data =[NetUtil doGetSync:urlStr];
    [MBProgressHUD hideHUD];
    
    if(data!=nil&&[@"True" isEqualToString:[data valueForKey:@"Result"]]){
        [MBProgressHUD showSuccess:@"获取成功"];
        self.yeingyejianbaoData = [data valueForKey:@"Data"];
            
        
    }else{
        [MBProgressHUD showError:@"获取失败"];
    }
    self.yeingyejianbaoData= [NetUtil doGetSync:urlStr];
    
    
}
-(void) dealData{
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [super dealloc];
}
- (IBAction)mdfBeginTime {
    [self dateAction: self.textfieldBeginTime];
    
}
- (IBAction)dateAction:(UITextField *) text {
    //设置日期选择框
    UIDatePicker *datePicker = [[UIDatePicker alloc] init]; datePicker.datePickerMode = UIDatePickerModeDate;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert.view addSubview:datePicker];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
        //实例化一个NSDateFormatter对象
        [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式
        NSString *dateString = [dateFormat stringFromDate:datePicker.date];
        //求出当天的时间字符串
        text.text =dateString;
        if(self.isjianbao)
        [self loadYingyeJianbao:self.textfieldBeginTime.text dtend:self.textfieldEndTime.text];
        NSLog(@"%@",dateString);
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    
    [self presentViewController:alert animated:YES completion:^{ }];
}
- (IBAction)mdfyEndTime {
    
    [self dateAction: self.textfieldEndTime];
}
@end
