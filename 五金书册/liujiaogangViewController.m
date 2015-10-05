//
//  liujiaogangViewController.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/5.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "liujiaogangViewController.h"
#import "TKeyBoardView.h"
#define margin 10
@interface liujiaogangViewController ()
@property (nonatomic,strong)UITextField *dField;
@property (nonatomic,strong)UITextField *pField;
@property (nonatomic,strong)UILabel *gLabel;
@end

@implementation liujiaogangViewController
{
    TKeyBoardView *keyBoardView1;
    TKeyBoardView *keyBoardView2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"其他尺寸(六角钢)";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    
    CGFloat labelWidth = (self.self.view.frame.size.width - 3 * margin) * 0.35;
    CGFloat fieldWidth = (self.self.view.frame.size.width - 3 * margin) * 0.65;
    CGFloat height = (self.view.frame.size.height * 0.6 ) - 30 - margin - 64;
    
    UILabel *dLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
    dLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.2 + 60);
    dLabel.textAlignment = NSTextAlignmentRight;
    dLabel.text = @"边宽(mm):";
    [self.view addSubview:dLabel];
    
    UITextField *dField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(dLabel.frame), dLabel.frame.origin.y, fieldWidth, 30)];
    dField.textAlignment = NSTextAlignmentRight;
    dField.borderStyle = UITextBorderStyleRoundedRect;
    self.dField = dField;
    [self.view addSubview:dField];
    
    UILabel *pLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
    pLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.4 + 60);
    pLabel.textAlignment = NSTextAlignmentRight;
    pLabel.text = @"密度(g/cm³):";
    [self.view addSubview:pLabel];
    
    UITextField *pField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pLabel.frame), pLabel.frame.origin.y, fieldWidth, 30)];
    pField.text = @"7.851";
    pField.textAlignment = NSTextAlignmentRight;
    pField.borderStyle = UITextBorderStyleRoundedRect;
    self.pField = pField;
    [self.view addSubview:pField];
    
    UILabel *ggLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
    ggLabel.center = CGPointMake(2 * margin + labelWidth * 0.5, height * 0.6 + 60);
    ggLabel.textAlignment = NSTextAlignmentRight;
    ggLabel.text = @"单重(kg/m):";
    [self.view addSubview:ggLabel];
    
    UILabel *gLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(ggLabel.frame), ggLabel.frame.origin.y, fieldWidth, 30)];
    gLabel.textAlignment = NSTextAlignmentRight;
    self.gLabel = gLabel;
    [self.view addSubview:gLabel];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, 30)];
    btn.center = CGPointMake(self.view.frame.size.width * 0.5, height * 0.8 + 60);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"计算" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    keyBoardView1 = [TKeyBoardView kBoardView];
    keyBoardView1.keyTextField = dField;
    keyBoardView2 = [TKeyBoardView kBoardView];
    keyBoardView2.keyTextField = pField;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)btnClick{
    if (self.dField.text.length && self.pField.text.length) {
        self.gLabel.text = [NSString stringWithFormat:@"%.4f",0.8666 * [self.dField.text doubleValue] * [self.dField.text doubleValue] * [self.pField.text doubleValue] / 1000];
    }else{
        return;
    }
}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
