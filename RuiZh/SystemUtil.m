//
//  SystemUtil.m
//  RuiZh
//
//  Created by 行 on 16/7/15.
//  Copyright © 2016年 lihang personal. All rights reserved.
//

#import "SystemUtil.h"

@implementation SystemUtil


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
 
    
    return dic;
    
}


+(NSString *)decimalToHexStr:  (NSString * ) decimalString
{
    NSString *nLetterValue;
    NSString *str =@"";
    long long int decimalStr = [decimalString  longLongValue];
    long long int ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=decimalStr%16;
        decimalStr=decimalStr/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%lli",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (decimalStr == 0) {
            break;  
        }
       
        
    }
    
    if(str.length==6){
        str = [@"FF" stringByAppendingString:str ];
    }else if(str.length==5){
        str = [@"FF0" stringByAppendingString:str ];
    }else if(str.length==4){
        str = [@"FF00" stringByAppendingString:str ];
    }else if(str.length==3){
        str = [@"FF00" stringByAppendingString:str ];
    }
    return str;
}

// [self getColor:@"#FFFFFFFF"];
+(UIColor *) getColor:(NSString *)hexColor
{
    unsigned int alpha, red, green, blue;
    NSRange range;
    range.length =2;
        
    range.location =1;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&alpha];//透明度
    range.location =3;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =5;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =7;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
 
        return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:(float)(alpha/255.0f)];
}

+(UIColor *) getColorFromDecimal:(NSString *)decimalString
{
    return [SystemUtil getColor: [@"#" stringByAppendingString:  [SystemUtil decimalToHexStr:decimalString ]]];
}
@end
