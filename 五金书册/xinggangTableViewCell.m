//
//  xinggangTableViewCell.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "xinggangTableViewCell.h"
#import "xinggangcanshuModel.h"
#import "frameModel.h"

@interface xinggangTableViewCell()
@property (nonatomic,strong)UILabel *label1;
@property (nonatomic,strong)UILabel *label2;
@property (nonatomic,strong)UILabel *label3;
@property (nonatomic,strong)UILabel *label4;
@property (nonatomic,strong)UILabel *label5;
@end
@implementation xinggangTableViewCell
-(UILabel *)label1{
    if (!_label1) {
        _label1 = [[UILabel alloc] init];
        _label1.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label1];
    }
    return _label1;
}
-(UILabel *)label2{
    if (!_label2) {
        _label2 = [[UILabel alloc] init];
        _label2.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label2];
    }
    return _label2;
}
-(UILabel *)label3{
    if (!_label3) {
        _label3 = [[UILabel alloc] init];
        _label3.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label3];
    }
    return _label3;
}
-(UILabel *)label4{
    if (!_label4) {
        _label4 = [[UILabel alloc] init];
        _label4.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label4];
    }
    return _label4;
}
-(UILabel *)label5{
    if (!_label5) {
        _label5 = [[UILabel alloc] init];
        _label5.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label5];
    }
    return _label5;
}


-(void)setFm:(frameModel *)fm{
    _fm = fm;
    xinggangcanshuModel *xm = fm.xm;
    if ([xm.fatherName isEqualToString:@"圆钢"]) {
        self.label1.text = xm.d;
        self.label5.text = [NSString stringWithFormat:@"%.2f",(0.7854 * [xm.d doubleValue] * [xm.d doubleValue] * 7.815 / 1000)];
    }else if ([xm.fatherName isEqualToString:@"方钢"]){
        self.label1.text = xm.a;
        self.label5.text = [NSString stringWithFormat:@"%.2f",[xm.a doubleValue] * [xm.a doubleValue] * 7.815 / 1000];
    }else if ([xm.fatherName isEqualToString:@"六角钢"]){
        self.label1.text = xm.a;
        self.label5.text = [NSString stringWithFormat:@"%.2f",0.866 * 7.815 * [xm.a doubleValue] * [xm.a doubleValue] / 1000];
    }else if ([xm.fatherName isEqualToString:@"等边角钢"]){
        self.label1.text = xm.type;
        self.label2.text = xm.b;
        self.label3.text = xm.d;
        self.label5.text = xm.G;
    }else if ([xm.fatherName isEqualToString:@"不等边角钢"]){
        self.label1.text = xm.type;
        self.label2.text = xm.k;
        self.label3.text = xm.b;
        self.label4.text = xm.d;
        self.label5.text = xm.G;
    }else if ([xm.fatherName isEqualToString:@"轻型槽钢"] || [xm.fatherName isEqualToString:@"槽钢"] || [xm.fatherName isEqualToString:@"轻型工字钢"] ||[xm.fatherName isEqualToString:@"工字钢"]){
        self.label1.text = xm.type;
        self.label2.text = xm.h;
        self.label3.text = xm.b;
        self.label4.text = xm.d;
        self.label5.text = xm.G;
    }else if ([xm.fatherName isEqualToString:@"H型钢"]){
        self.label1.text = xm.h;
        self.label2.text = xm.b;
        self.label3.text = xm.f;
        self.label4.text = xm.y;
        self.label5.text = xm.G;
    }else if ([xm.fatherName isEqualToString:@"焊接钢管"] || [xm.fatherName isEqualToString:@"焊接钢管(加厚)"] ||[xm.fatherName isEqualToString:@"电线套管"]){
        self.label1.text = xm.rr;
        self.label2.text = xm.r;
        self.label3.text = xm.d;
        self.label5.text = xm.G;
    }
    self.label1.frame = fm.lf1;
    self.label2.frame = fm.lf2;
    self.label3.frame = fm.lf3;
    self.label4.frame = fm.lf4;
    self.label5.frame = fm.lf5;
}

@end
