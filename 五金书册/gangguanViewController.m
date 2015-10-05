//
//  gangguanViewController.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/5.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "gangguanViewController.h"
#import "TKeyBoardView.h"
#import "MBProgressHUD+CZ.h"
#define margin 10
@interface gangguanViewController ()
@property (nonatomic,strong)UITextField *rField;
@property (nonatomic,strong)UITextField *dField;
@property (nonatomic,strong)UITextField *pField;
@property (nonatomic,strong)UILabel *glabel;
@end

@implementation gangguanViewController
{
    TKeyBoardView *keyBoardView1;
    TKeyBoardView *keyBoardView2;
    TKeyBoardView *keyBoardView3;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"其他钢管";
    
    
    CGFloat labelWidth = (self.self.view.frame.size.width - 3 * margin) * 0.35;
    CGFloat fieldWidth = (self.self.view.frame.size.width - 3 * margin) * 0.65;
    CGFloat height = ((self.view.frame.size.height * 0.6 ) - 30 - margin) - 64;
    
    UILabel *rLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
    rLabel.textAlignment = NSTextAlignmentRight;
    rLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.2 + 60);
    rLabel.text = @"外径(mm):";
    [self.view addSubview:rLabel];
    
    UITextField *rField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(rLabel.frame), rLabel.frame.origin.y, fieldWidth, 30)];
    rField.textAlignment = NSTextAlignmentRight;
    rField.borderStyle = UITextBorderStyleRoundedRect;
    self.rField = rField;
    [self.view addSubview:rField];
    
    UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,labelWidth, 30)];
    dLabel.textAlignment = NSTextAlignmentRight;
    dLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.4  + 60 );
    dLabel.text = @"壁厚(mm):";
    [self.view addSubview:dLabel];
    
    UITextField *dField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dLabel.frame), dLabel.frame.origin.y, fieldWidth, 30)];
    dField.textAlignment = NSTextAlignmentRight;
    dField.borderStyle = UITextBorderStyleRoundedRect;
    self.dField = dField;
    [self.view addSubview:dField];
    
    UILabel *pLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
    pLabel.textAlignment = NSTextAlignmentRight;
    pLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.6  + 60);
    pLabel.text = @"密度(g/cm³):";
    [self.view addSubview:pLabel];
    UITextField *pField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pLabel.frame), pLabel.frame.origin.y, fieldWidth, 30)];
    pField.text = @"7.851";
    pField.textAlignment = NSTextAlignmentRight;
    pField.borderStyle = UITextBorderStyleRoundedRect;
    self.pField = pField;
    [self.view addSubview:pField];
    
    UILabel *Glabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
    Glabel.textAlignment = NSTextAlignmentRight;
    Glabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.8  + 60);
    Glabel.text = @"单重(kg/m):";
    [self.view addSubview:Glabel];
    
    UILabel *gLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(Glabel.frame) , Glabel.frame.origin.y,fieldWidth,30)];
    gLabel.textAlignment = NSTextAlignmentRight;
    self.glabel = gLabel;
    [self.view addSubview:gLabel];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, 30)];
    btn.center = CGPointMake(self.view.frame.size.width * 0.5, height * 0.8 + 30 + margin + 60);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"计算" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    keyBoardView1 = [TKeyBoardView kBoardView];
    keyBoardView2 = [TKeyBoardView kBoardView];
    keyBoardView3 = [TKeyBoardView kBoardView];
    keyBoardView1.keyTextField = rField;
    keyBoardView2.keyTextField = dField;
    keyBoardView3.keyTextField = pField;
    
    
}
-(void)btnClick{
    if (self.dField.text.length && self.pField.text.length && self.rField.text.length) {
        if ([self.rField.text doubleValue] <= (2 * [self.dField.text doubleValue])) {
            [MBProgressHUD showError:@"亲,请输入符合常理的数据~"];
        }else{
            self.glabel.text = [NSString stringWithFormat:@"%.4f", 0.02466 * [self.dField.text doubleValue] * ([self.rField.text doubleValue] - [self.dField.text doubleValue])];
        }
    }else{
        return;
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
