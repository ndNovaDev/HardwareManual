//
//  biangangView.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/5.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "biangangView.h"
#import "TKeyBoardView.h"

#define margin 10

@interface biangangView()
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UITextField *wField;
@property (nonatomic,strong)UITextField *dField;
@property (nonatomic,strong)UITextField *pField;

@end
@implementation biangangView
{
    TKeyBoardView *keyBoardView1;
    TKeyBoardView *keyBoardView2;
    TKeyBoardView *keyBoardView3;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *lineVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        lineVIew.backgroundColor = [UIColor blackColor];
        [self addSubview:lineVIew];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(margin, margin, frame.size.width, 30)];
        title.text = @"扁钢:";
        self.title = title;
        [self addSubview:title];
        
        CGFloat labelWidth = (self.frame.size.width - 3 * margin) * 0.35;
        CGFloat fieldWidth = (self.frame.size.width - 3 * margin) * 0.65;
        
        UILabel *wLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
        wLabel.textAlignment = NSTextAlignmentRight;
        wLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, (frame.size.height - 30 - margin) * 0.2 + ( 30 + margin));
        wLabel.text = @"宽度(mm):";
        [self addSubview:wLabel];
        
        UITextField *wField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(wLabel.frame), wLabel.frame.origin.y, fieldWidth, 30)];
        [wField addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];
        [wField addTarget:self action:@selector(endEdit) forControlEvents:UIControlEventEditingDidEnd];
        wField.textAlignment = NSTextAlignmentRight;
        wField.borderStyle = UITextBorderStyleRoundedRect;
        self.wField = wField;
        [self addSubview:wField];
        
        UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,labelWidth, 30)];
        dLabel.textAlignment = NSTextAlignmentRight;
        dLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, (frame.size.height - 30 - margin) * 0.4 + ( 30 + margin));
        dLabel.text = @"厚度(mm):";
        [self addSubview:dLabel];
        
        UITextField *dField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dLabel.frame), dLabel.frame.origin.y, fieldWidth, 30)];
        [dField addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];
        [dField addTarget:self action:@selector(endEdit) forControlEvents:UIControlEventEditingDidEnd];
        dField.textAlignment = NSTextAlignmentRight;
        dField.borderStyle = UITextBorderStyleRoundedRect;
        self.dField = dField;
        [self addSubview:dField];
        UILabel *pLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
        pLabel.textAlignment = NSTextAlignmentRight;
        pLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, (frame.size.height - 30 - margin) * 0.6 + 30 + margin);
        pLabel.text = @"密度(g/cm³):";
        [self addSubview:pLabel];
        UITextField *pField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pLabel.frame), pLabel.frame.origin.y, fieldWidth, 30)];
        [pField addTarget:self action:@selector(beginEdit) forControlEvents:UIControlEventEditingDidBegin];
        [pField addTarget:self action:@selector(endEdit) forControlEvents:UIControlEventEditingDidEnd];
        pField.text = @"7.851";
        pField.textAlignment = NSTextAlignmentRight;
        pField.borderStyle = UITextBorderStyleRoundedRect;
        self.pField = pField;
        [self addSubview:pField];
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width * 0.25, 30)];
        btn.center = CGPointMake(frame.size.width * 0.5, (frame.size.height - 30 - margin) * 0.8 + 30 + margin);
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:@"计算" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        keyBoardView1 = [TKeyBoardView kBoardView];
        keyBoardView2 = [TKeyBoardView kBoardView];
        keyBoardView3 = [TKeyBoardView kBoardView];
        keyBoardView1.keyTextField = dField;
        keyBoardView2.keyTextField = pField;
        keyBoardView3.keyTextField = wField;
        
    }
    return self;
}
-(void)btnClick{
    if (self.dField.text.length && self.pField.text.length && self.wField.text.length) {
        self.title.text = [NSString stringWithFormat:@"扁钢单重(kg/m):    %.4f",[self.dField.text doubleValue] * [self.pField.text doubleValue] * [self.wField.text doubleValue] / 1000];
    }else{
        return;
    }
}
-(void)beginEdit{
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.frame.size.height + 20);
    }];
}
-(void)endEdit{
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
@end
