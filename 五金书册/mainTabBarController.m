//
//  mainTabBarController.m
//  五金手册
//
//  Created by 李庆阳 on 15/9/29.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "mainTabBarController.h"
#import "xinggangNaviController.h"
#import "gangguanNaviController.h"
#import "gangbanNaviController.h"
#import "loveNaviController.h"
@interface mainTabBarController ()

@end

@implementation mainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor blackColor];
    xinggangNaviController *xgNC = [[xinggangNaviController alloc] init];
    gangbanNaviController *gbNC = [[gangbanNaviController alloc] init];
    gangguanNaviController *ggNC = [[gangguanNaviController alloc] init];
    loveNaviController *lNC = [[loveNaviController alloc] init];
    
    [self addNaviController:xgNC image:[UIImage imageNamed:@"tabbar_xingang"]selectImage:[[UIImage imageNamed:@"tabbar_xingang_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:@"型钢"];
    [self addNaviController:gbNC image:[UIImage imageNamed:@"tabbar_xingang"] selectImage:[[UIImage imageNamed:@"tabbar_xingang_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:@"钢板"];
    [self addNaviController:ggNC image:[UIImage imageNamed:@"tabbar_xingang"] selectImage:[[UIImage imageNamed:@"tabbar_xingang_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:@"钢管"];
    [self addNaviController:lNC image:[UIImage imageNamed:@"tabbar_xingang"] selectImage:[[UIImage imageNamed:@"tabbar_xingang_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] title:@"关于"];
    
    
    
    
}

-(void)addNaviController:(UINavigationController *)naviController image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectImage];
    naviController.tabBarItem = item;
    [self addChildViewController:naviController];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//+(void)initialize{
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    item.tintColor = [UIColor blackColor];
//}
@end
