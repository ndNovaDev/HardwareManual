//
//  testViewController.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/5.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.3, self.view.frame.size.width * 0.3)];
    imageView.center = CGPointMake(self.view.frame.size.width * 0.5, 84 + imageView.frame.size.height * 0.5);
    imageView.backgroundColor = [UIColor redColor];
    imageView.layer.cornerRadius = 20;
    [self.view addSubview:imageView];
    
    UILabel *verLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), self.view.frame.size.width, 30)];
    verLabel.textAlignment = NSTextAlignmentCenter;
    verLabel.text = @"当前版本: 1.0";
    [self.view addSubview:verLabel];
    
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(verLabel.frame) + 14, self.view.frame.size.width,150)];
    descLabel.numberOfLines = 0;
    descLabel.textColor = [UIColor lightGrayColor];
    descLabel.text = @"        该应用内部数据信息均来自网络，因该应用为专业工具，如果出现数据信息错误，可能会给您和他人带来不必要的麻烦和损失。\n        如果发现应用内部的数据错误及bug，或者您有关于应用功能改进方面的建议，欢迎点击下方的按钮来进行反馈。";
    [self.view addSubview:descLabel];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.3, 50)];
    btn.center = CGPointMake(self.view.frame.size.width * 0.5, CGRectGetMaxY(descLabel.frame) + (self.view.frame.size.height - 44 - CGRectGetMaxY(descLabel.frame)) * 0.5);
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [btn setTitle:@"意见反馈" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
-(void)jump{
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id1046547329"]];
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
