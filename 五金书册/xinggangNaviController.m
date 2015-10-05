//
//  xinggangNaviController.m
//  五金手册
//
//  Created by 李庆阳 on 15/9/29.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "xinggangNaviController.h"
#import "xinggangTableViewController.h"
@interface xinggangNaviController ()

@end

@implementation xinggangNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    xinggangTableViewController *xinggangTVC = [[xinggangTableViewController alloc] initWithStyle:UITableViewStylePlain titleName:@"型钢" filename:@"xinggang.plist"];
    self.viewControllers = @[xinggangTVC];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
