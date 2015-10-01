//
//  gangguanTableViewController.m
//  五金手册
//
//  Created by 李庆阳 on 15/9/29.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "gangguanTableViewController.h"
#import "navigationItemButton.h"
#import "mainVIewController.h"
@implementation gangguanTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"钢管";
    navigationItemButton *leftBtn = [navigationItemButton leftBtn];
    [leftBtn addTarget:self action:@selector(moreTool) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    navigationItemButton *rightBtn = [navigationItemButton rightBtn];
    [rightBtn addTarget:self action:@selector(showRuler) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}
-(void)moreTool{
    mainVIewController *tVC = [[mainVIewController alloc] init];
    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:tVC];
    [self presentViewController:nVC animated:YES completion:nil];
}
-(void)showRuler{
    
}
@end
