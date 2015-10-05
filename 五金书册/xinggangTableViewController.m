//
//  xinggangTableViewController.m
//  五金手册
//
//  Created by 李庆阳 on 15/9/29.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "xinggangTableViewController.h"
#import "navigationItemButton.h"
#import "mainVIewController.h"
#import "xinggangModel.h"
#import "MJExtension.h"
#import "xinggangcanshuTableViewController.h"
#import "gangguanViewController.h"
@interface xinggangTableViewController ()
@property (nonatomic,strong)NSArray *names;
@property (nonatomic,copy)NSString *filename;

@end

@implementation xinggangTableViewController
-(NSArray *)names{
    if (!_names) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.filename ofType:nil]];
        _names = [xinggangModel objectArrayWithKeyValuesArray:array];
    }
    return _names;
}
-(instancetype)initWithStyle:(UITableViewStyle)style titleName:(NSString *)titleName filename:(NSString *)filename{
    if (self = [super initWithStyle:style]) {
        self.title = titleName;
        self.filename = filename;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    navigationItemButton *leftBtn = [navigationItemButton leftBtn];
    [leftBtn addTarget:self action:@selector(moreTool) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    navigationItemButton *rightBtn = [navigationItemButton rightBtn];
    [rightBtn addTarget:self action:@selector(showRuler) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

-(void)moreTool{
    mainVIewController *tVC = [[mainVIewController alloc] init];
    UINavigationController *nVC = [[UINavigationController alloc] initWithRootViewController:tVC];
    [self presentViewController:nVC animated:YES completion:nil];
}
-(void)showRuler{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    xinggangModel *xm = self.names[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = xm.name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    xinggangModel *xm = self.names[indexPath.row];
    if (xm.other) {
        gangguanViewController *gVC = [[gangguanViewController alloc] init];
        gVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:gVC animated:YES];
    }else{
        xinggangcanshuTableViewController *xcTVC = [[xinggangcanshuTableViewController alloc] initWithStyle:UITableViewStylePlain titleName:xm.name canshus:xm.sub];
        xcTVC.hidesBottomBarWhenPushed = YES;
        if (xm.edit) {
            xcTVC.needEdit = YES;
        }
        [self.navigationController pushViewController:xcTVC animated:YES];
    }
}
@end
