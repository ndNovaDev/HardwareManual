//
//  danweiHeaderView.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "danweiHeaderView.h"
#import "frameModel.h"
#import "xinggangcanshuModel.h"

@interface danweiHeaderView()
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;
@property (nonatomic,strong)UILabel *label3;
@property (nonatomic,strong)UILabel *label4;
@property (nonatomic,strong)UILabel *label5;
@end
@implementation danweiHeaderView
-(instancetype)init{
    if (self = [super init]) {
        UILabel *label1 = [[UILabel alloc] init];
        label1.font = [UIFont systemFontOfSize:14];
        label1.numberOfLines = 0;
        label1.textAlignment = NSTextAlignmentCenter;
        self.label1 = label1;
        [self addSubview:label1];
        UILabel *label2 = [[UILabel alloc] init];
        label2.font = [UIFont systemFontOfSize:14];
        label2.numberOfLines = 0;
        label2.textAlignment = NSTextAlignmentCenter;
        self.label2 = label2;
        [self addSubview:label2];
        UILabel *label3 = [[UILabel alloc] init];
        label3.font = [UIFont systemFontOfSize:14];
        label3.numberOfLines = 0;
        label3.textAlignment = NSTextAlignmentCenter;
        self.label3 = label3;
        [self addSubview:label3];
        UILabel *label4 = [[UILabel alloc] init];
        label4.font = [UIFont systemFontOfSize:14];
        label4.numberOfLines = 0;
        label4.textAlignment = NSTextAlignmentCenter;
        self.label4 = label4;
        [self addSubview:label4];
        UILabel *label5 = [[UILabel alloc] init];
        label5.font = [UIFont systemFontOfSize:14];
        label5.numberOfLines = 0;
        label5.textAlignment = NSTextAlignmentCenter;
        self.label5 = label5;
        [self addSubview:label5];
    }
    return self;
}
-(void)setFm:(frameModel *)fm{
    _fm = fm;
    xinggangcanshuModel *xm = fm.xm;
    if ([xm.fatherName isEqualToString:@"圆钢"]) {
        self.label1.text = @"外径\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"方钢"]){
        self.label1.text = @"边宽\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"六角钢"]){
        self.label1.text = @"边宽\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"等边角钢"]){
        self.label1.text = @"型号\n";
        self.label2.text = @"边宽\nmm";
        self.label3.text = @"边厚\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"不等边角钢"]){
        self.label1.text = @"型号\n";
        self.label2.text = @"长边宽\nmm";
        self.label3.text = @"短边宽\nmm";
        self.label4.text = @"边厚\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"轻型槽钢"] || [xm.fatherName isEqualToString:@"槽钢"] || [xm.fatherName isEqualToString:@"轻型工字钢"] ||[xm.fatherName isEqualToString:@"工字钢"]){
        self.label1.text = @"型号\n";
        self.label2.text = @"高度\nmm";
        self.label3.text = @"腿宽\nmm";
        self.label4.text = @"腰厚\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"H型钢"]){
        self.label1.text = @"高度\nmm";
        self.label2.text = @"宽度\nmm";
        self.label3.text = @"腹板厚度\nmm";
        self.label4.text = @"翼缘厚度\nmm";
        self.label5.text = @"单重\nkg/m";
    }else if ([xm.fatherName isEqualToString:@"焊接钢管"] || [xm.fatherName isEqualToString:@"焊接钢管(加厚)"] ||[xm.fatherName isEqualToString:@"电线套管"]){
        self.label1.text = @"公称口径\nmm";
        self.label2.text = @"公称外径\nmm";
        self.label3.text = @"壁厚\nmm";
        self.label5.text = @"单重\nkg/m";
    }
    self.label1.frame = fm.lf1;
    self.label2.frame = fm.lf2;
    self.label3.frame = fm.lf3;
    self.label4.frame = fm.lf4;
    self.label5.frame = fm.lf5;
    
}
@end
