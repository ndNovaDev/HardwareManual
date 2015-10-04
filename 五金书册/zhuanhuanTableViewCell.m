//
//  zhuanhuanTableViewCell.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/3.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "zhuanhuanTableViewCell.h"
#import "zhuanhuanModel.h"

@interface zhuanhuanTableViewCell()
@property (nonatomic,assign)double x;

@end
@implementation zhuanhuanTableViewCell
-(void)setNVs:(NSArray *)NVs{
    _NVs = NVs;
    [self changeValue];
}
-(void)setZm:(zhuanhuanModel *)zm{
    _zm = zm;
    self.textLabel.text = zm.name;
}
-(void)setName:(NSString *)name{
    _name = name;
    [self changeValue];
}

-(void)setValue:(double)value{
    _value = value;
    [self changeValue];
}
-(void)changeValue{
    for (zhuanhuanModel *zm in self.NVs) {
        if ([self.name isEqualToString:zm.name]) {
            self.x = 1.0 / [zm.value doubleValue];
        }
    }
//    *****
    double result = [self.zm.value doubleValue] * self.value * self.x;
//    NSNumberFormatter *numberFormatter0 = [[NSNumberFormatter alloc] init];
//    [numberFormatter0 setPositiveFormat:@"###,##0;"];
//    unsigned long long result0 = (unsigned long long)(result);
//    NSNumberFormatter *numberFormatter1 = [[NSNumberFormatter alloc] init];
//    [numberFormatter1 setPositiveFormat:@"###,##0.0;"];
//    unsigned long long result1 = (unsigned long long)(result * 10);
//    NSNumberFormatter *numberFormatter2 = [[NSNumberFormatter alloc] init];
//    [numberFormatter2 setPositiveFormat:@"###,##0.00;"];
//    unsigned long long result2 = (unsigned long long)(result * 100);
//    NSNumberFormatter *numberFormatter3 = [[NSNumberFormatter alloc] init];
//    [numberFormatter3 setPositiveFormat:@"###,##0.000;"];
//    unsigned long long result3 = (unsigned long long)(result * 1000);
//    NSString *formattedNumberString;
//    if (result < 0.001) {
//        self.detailTextLabel.text = @"NA";
//    }else{
//        if (result3 % 10){
//            formattedNumberString = [numberFormatter3 stringFromNumber:[NSNumber numberWithDouble:result]];
//        }else if (result2 % 10){
//            formattedNumberString = [numberFormatter2 stringFromNumber:[NSNumber numberWithDouble:result]];
//        }else if (result1 % 10){
//            formattedNumberString = [numberFormatter1 stringFromNumber:[NSNumber numberWithDouble:result]];
//        }else{
//            formattedNumberString = [numberFormatter0 stringFromNumber:[NSNumber numberWithDouble:result]];
//        }
//        self.detailTextLabel.text = formattedNumberString;
//    }
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:@"###,##0.000;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:result]];
    if (result < 0.001) {
        self.detailTextLabel.text = @"NA";
    }else{
        self.detailTextLabel.text = formattedNumberString;
    }
    

    

//    *****
//    self.detailTextLabel.text = [NSString stringWithFormat:@"%f",[self.zm.value doubleValue] * self.value * self.x];
}
@end
