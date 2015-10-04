//
//  xinggangcanshuTableViewController.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "xinggangcanshuTableViewController.h"
#import "xinggangcanshuModel.h"
#import "xinggangTableViewCell.h"
#import "frameModel.h"
#import "danweiHeaderView.h"
@interface xinggangcanshuTableViewController ()
@property (nonatomic,strong)NSArray *canshus;
@property (nonatomic,strong)frameModel *fm;
@end

@implementation xinggangcanshuTableViewController
-(frameModel *)fm{
    if (!_fm) {
        _fm = [[frameModel alloc] init];
    }
    return _fm;
}
-(instancetype)initWithStyle:(UITableViewStyle)style titleName:(NSString *)titleName canshus:(NSArray *)canshus{
    if (self = [super initWithStyle:style]) {
        self.title = titleName;
        self.canshus = canshus;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionHeaderHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.canshus.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    xinggangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[xinggangTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    frameModel *fm = [[frameModel alloc]  init];
    fm.xm = self.canshus[indexPath.row];
    self.fm = fm;
    cell.fm = fm;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    static NSString *viewID = @"head";
//    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewID];
//    if (headerView == nil) {
//        [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:viewID];
//        headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewID];
//    }
//    return headerView;
    danweiHeaderView *head = [[danweiHeaderView alloc] init];
    head.fm = self.fm;
    return head;
}
@end
