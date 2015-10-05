//
//  gangbanViewController.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/5.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "gangbanViewController.h"
#import "navigationItemButton.h"
#import "mainVIewController.h"
#import "gangbanView.h"
#import "biangangView.h"
@interface gangbanViewController ()

@end

@implementation gangbanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"钢板";
    self.view.backgroundColor = [UIColor whiteColor];
    navigationItemButton *leftBtn = [navigationItemButton leftBtn];
    [leftBtn addTarget:self action:@selector(moreTool) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    navigationItemButton *rightBtn = [navigationItemButton rightBtn];
    [rightBtn addTarget:self action:@selector(showRuler) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    gangbanView *gangban = [[gangbanView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height * 0.5 - 64)];
    [self.view addSubview:gangban];
    biangangView *biangang = [[biangangView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(gangban.frame), self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:biangang];
    
    
}

-(void)moreTool{
    mainVIewController *tVC = [[mainVIewController alloc] init];
    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:tVC];
    [self presentViewController:nVC animated:YES completion:nil];
}
-(void)showRuler{
    
}

@end
