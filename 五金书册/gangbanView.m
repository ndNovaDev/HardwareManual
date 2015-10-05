//
//  gangbanView.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/5.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "gangbanView.h"
#import "TKeyBoardView.h"
#define margin 10

@interface gangbanView()
@property (nonatomic,strong)UITextField *dField;
@property (nonatomic,strong)UITextField *pField;
@property (nonatomic,strong)UILabel *title;
@end
@implementation gangbanView
{
    TKeyBoardView *keyBoardView1;
    TKeyBoardView *keyBoardView2;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin, frame.size.width, 30)];
        title.text = @"钢板:";
        self.title = title;
        [self addSubview:title];
        CGFloat labelWidth = (self.frame.size.width - 3 * margin) * 0.35;
        CGFloat fieldWidth = (self.frame.size.width - 3 * margin) * 0.65;
        UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,labelWidth, 30)];
        dLabel.textAlignment = NSTextAlignmentRight;
        dLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, (frame.size.height - 30 - margin) * 0.25 + ( 30 + margin));
        dLabel.text = @"厚度(mm):";
        [self addSubview:dLabel];
        UITextField *dField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dLabel.frame), dLabel.frame.origin.y, fieldWidth, 30)];
        dField.textAlignment = NSTextAlignmentRight;
        dField.borderStyle = UITextBorderStyleRoundedRect;
        self.dField = dField;
        [self addSubview:dField];
        UILabel *pLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
        pLabel.textAlignment = NSTextAlignmentRight;
        pLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, (frame.size.height - 30 - margin) * 0.5 + 30 + margin);
        pLabel.text = @"密度(g/cm³):";
        [self addSubview:pLabel];
        UITextField *pField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pLabel.frame), pLabel.frame.origin.y, fieldWidth, 30)];
        pField.text = @"7.851";
        pField.textAlignment = NSTextAlignmentRight;
        pField.borderStyle = UITextBorderStyleRoundedRect;
        self.pField = pField;
        [self addSubview:pField];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width * 0.25, 30)];
        btn.center = CGPointMake(frame.size.width * 0.5, (frame.size.height - 30 - margin) * 0.75 + 30 + margin);
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:@"计算" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        keyBoardView1 = [TKeyBoardView kBoardView];
        keyBoardView2 = [TKeyBoardView kBoardView];
        keyBoardView1.keyTextField = dField;
        keyBoardView2.keyTextField = pField;
    }
    return self;
}
-(void)btnClick{
    if (self.dField.text.length &&self.pField.text.length) {
        self.title.text = [NSString stringWithFormat:@"钢板单重(kg/㎡):    %.3f",[self.dField.text doubleValue] * [self.pField.text doubleValue]];
    }else{
        return;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
@end
