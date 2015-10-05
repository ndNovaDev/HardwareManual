//
//  gangbanNaviController.m
//  五金手册
//
//  Created by 李庆阳 on 15/9/29.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "gangbanNaviController.h"
#import "gangbanViewController.h"
@interface gangbanNaviController ()

@end

@implementation gangbanNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    gangbanViewController *gVC = [[gangbanViewController alloc] init];
    self.viewControllers = @[gVC];
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
