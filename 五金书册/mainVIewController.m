//
//  mainVIewController.m
//  test
//
//  Created by 李庆阳 on 15/9/30.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "mainVIewController.h"
#import "danweizhuanhuanButton.h"
#import "testTableViewController.h"
#import <sqlite3.h>
#import "miduModel.h"
#import "lengthTableViewController.h"

@interface mainVIewController()<UITableViewDataSource,UISearchBarDelegate,UIScrollViewDelegate,UITableViewDelegate>
@property (nonatomic,strong)UIView *indexView;
@property (nonatomic,strong)UIView *firstView;
@property (nonatomic,strong)UITableView *secondView;
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic, assign) sqlite3 *db;
@property (nonatomic,strong)NSMutableArray *midus;
@property (nonatomic,strong)UIView *descView;
@property (nonatomic,assign)BOOL searchTextEmpty;
@property (nonatomic,assign)CGFloat down;
@end
@implementation mainVIewController
-(NSMutableArray *)midus{
    if (!_midus) {
        _midus = [NSMutableArray array];
    }
    return _midus;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.searchTextEmpty = YES;
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.5, 44)];
    titleView.center = CGPointMake(self.view.frame.size.width * 0.5, 44);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    
    UIButton *oneBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    oneBtn.frame = CGRectMake(0, 0, titleView.frame.size.width * 0.5, titleView.frame.size.height);
    [oneBtn setTitle:@"单位转换" forState:UIControlStateNormal];
    [oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [oneBtn addTarget:self action:@selector(oneClick) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:oneBtn];
    
    UIButton *twoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    twoBtn.frame = CGRectMake(oneBtn.frame.size.width, 0, oneBtn.frame.size.width, oneBtn.frame.size.height);
    [twoBtn setTitle:@"常见密度" forState:UIControlStateNormal];
    [twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [twoBtn addTarget:self action:@selector(twoClick) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:twoBtn];
    
    UIView *indexView = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.frame.size.height - 4, oneBtn.frame.size.width, 4)];
    indexView.backgroundColor = [UIColor grayColor];
    self.indexView = indexView;
    [titleView addSubview:indexView];
    self.navigationItem.titleView = titleView;
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    firstView.backgroundColor = [UIColor whiteColor];
    self.firstView = firstView;
    [self.view addSubview:firstView];
//    ************************
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 30, self.view.frame.size.width, self.view.frame.size.height - 30)];
    self.contentView = contentView;
    [self.view addSubview:contentView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 34)];
    searchBar.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    searchBar.backgroundImage = [self imageWithColor:[UIColor clearColor] size:searchBar.bounds.size];
    self.searchBar = searchBar;
    searchBar.barTintColor = [UIColor lightGrayColor];
    searchBar.barStyle = UISearchBarStyleProminent;
    searchBar.delegate = self;
    [contentView addSubview:searchBar];
    
    UIView *descView = [[UIView alloc] initWithFrame:CGRectMake(0, 34, self.view.frame.size.width, 20)];
    descView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    self.descView = descView;
    [self.contentView addSubview:descView];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 60, 20)];
    nameLabel.text = @"材料名称";
    nameLabel.textColor = [UIColor grayColor];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.font = [UIFont systemFontOfSize:10];
    [descView addSubview:nameLabel];
    UILabel *danweiLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 70, 0, 60, 20)];
    danweiLabel.text = @"密度(g/cm³)";
    danweiLabel.textColor = [UIColor grayColor];
    danweiLabel.textAlignment = NSTextAlignmentRight;
    danweiLabel.font = [UIFont systemFontOfSize:10];
    [descView addSubview:danweiLabel];
    
    UITableView *secondView = [[UITableView alloc] initWithFrame:CGRectMake(0,54,self.view.frame.size.width, contentView.frame.size.height - 54) style:UITableViewStylePlain];
    secondView.backgroundColor = [UIColor whiteColor];
    secondView.allowsSelection = NO;
    secondView.delegate = self;
    secondView.dataSource = self;
    self.secondView = secondView;
    [self.contentView addSubview:secondView];
    
//    *********************
    UIView *naviBarBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    naviBarBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:naviBarBackgroundView];
    
    CGFloat outMargin = self.view.frame.size.width * 0.2;
    CGFloat inMagin = self.view.frame.size.width * 0.1;
    CGFloat btnSize = self.view.frame.size.width * 0.25;
    NSArray *btnName = @[@"长度",@"面积",@"体积",@"质量"];
    for (int i = 0; i < 4; i++) {
        danweizhuanhuanButton *btn = [[danweizhuanhuanButton alloc] initWithImage:[UIImage imageNamed:@"tabbar_xingang"] highlightImage:[UIImage imageNamed:@"tabbar_xingang_selected"] title:nil frame:CGRectMake(i % 2 * (inMagin + btnSize) + outMargin, outMargin + (inMagin + btnSize) * (i / 2), btnSize, btnSize)];
        [btn setTitle:btnName[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(danweiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.firstView addSubview:btn];
    }
    
    [self setupDb];
    [self setupData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
-(void)keyboardChangeFrame:(NSNotification *)notification{
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView  animateWithDuration:0.25 animations:^{
        self.secondView.frame =  CGRectMake(0,54,self.view.frame.size.width, self.contentView.frame.size.height - 54 - self.down  - [UIScreen mainScreen].bounds.size.height + keyboardRect.origin.y);
    }];
}
-(void)oneClick{
    [UIView animateWithDuration:0.3 animations:^{
        self.searchBar.text = @"";
        [self searchBar:self.searchBar textDidChange:@""];
        [self.searchBar endEditing:YES];
        self.indexView.frame = CGRectMake(0, self.indexView.frame.origin.y, self.indexView.frame.size.width, self.indexView.frame.size.height);
        self.firstView.transform = CGAffineTransformMakeTranslation(0, 0);
        self.contentView.transform = CGAffineTransformMakeTranslation(0, 0);
//        self.descView.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    self.navigationItem.rightBarButtonItem = nil;
}
-(void)twoClick{
    [UIView animateWithDuration:0.3 animations:^{
        self.indexView.frame = CGRectMake(self.indexView.frame.size.width, self.indexView.frame.origin.y, self.indexView.frame.size.width, self.indexView.frame.size.height);
        self.firstView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
        self.contentView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);
    }];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchClick)];
}
-(void)danweiBtnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 0:{
            lengthTableViewController *lVC = [[lengthTableViewController alloc] initWithName:@"米"];
            lVC.fileName = @"length.plist";
            lVC.titleName = @"长度转换";
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 1:{
            lengthTableViewController *lVC = [[lengthTableViewController alloc] initWithName:@"平方米"];
            lVC.fileName = @"mianji.plist";
            lVC.titleName = @"面积转换";
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 2:{
            lengthTableViewController *lVC = [[lengthTableViewController alloc] initWithName:@"立方米"];
            lVC.fileName = @"tiji.plist";
            lVC.titleName = @"体积转换";
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 3:{
            lengthTableViewController *lVC = [[lengthTableViewController alloc] initWithName:@"千克"];
            lVC.fileName = @"zhiliang.plist";
            lVC.titleName = @"质量转换";
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
    }
    
}
-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)searchClick{
    self.down = 34;
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.transform = CGAffineTransformMakeTranslation(-self.view.frame.size.width, 34);
    }];
    [self.searchBar becomeFirstResponder];
}

//+(void)initialize{
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    item.tintColor = [UIColor blackColor];
//    
//}
#pragma mark - tableViewDS

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.midus.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    miduModel *mm = self.midus[indexPath.row];
    cell.textLabel.text = mm.name;
    cell.detailTextLabel.text = mm.value;
    return cell;
}
#pragma mark - 数据库
- (void)setupDb
{
    // 打开数据库(连接数据库)
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"midu.sqlite" ofType:nil];
    // 如果数据库文件不存在, 系统会自动创建文件自动初始化数据库
    int status = sqlite3_open(filename.UTF8String, &_db);
    if (status == SQLITE_OK) { // 打开成功
    }
}
- (void)setupData
{
    const char *sql = "SELECT name,value FROM midu;";
    // stmt是用来取出查询结果的
    sqlite3_stmt *stmt = NULL;
    // 准备
    int status = sqlite3_prepare_v2(self.db, sql, -1, &stmt, NULL);
    if (status == SQLITE_OK) { // 准备成功 -- SQL语句正确
        while (sqlite3_step(stmt) == SQLITE_ROW) { // 成功取出一条数据
            const char *name = (const char *)sqlite3_column_text(stmt, 0);
            const char *value = (const char *)sqlite3_column_text(stmt, 1);
            miduModel *mm = [[miduModel alloc] init];
            mm.name = [NSString stringWithUTF8String:name];
            mm.value = [NSString stringWithUTF8String:value];
            [self.midus addObject:mm];
        }
    }
}
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length) {
        self.searchTextEmpty = NO;
    }else{
        self.searchTextEmpty = YES;
    }
    [self.midus removeAllObjects];
    NSString *sql = [NSString stringWithFormat:@"SELECT name,value FROM midu WHERE name LIKE '%%%@%%';", searchText];
    // stmt是用来取出查询结果的
    sqlite3_stmt *stmt = NULL;
    // 准备
    int status = sqlite3_prepare_v2(self.db, sql.UTF8String, -1, &stmt, NULL);
    if (status == SQLITE_OK) { // 准备成功 -- SQL语句正确
        while (sqlite3_step(stmt) == SQLITE_ROW) { // 成功取出一条数据
            const char *name = (const char *)sqlite3_column_text(stmt, 0);
            const char *value = (const char *)sqlite3_column_text(stmt, 1);
            
            miduModel *mm = [[miduModel alloc] init];
            mm.name = [NSString stringWithUTF8String:name];
            mm.value = [NSString stringWithUTF8String:value];
            [self.midus addObject:mm];
        }
    }
    [self.secondView reloadData];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.searchTextEmpty) {
        [self.searchBar endEditing:YES];
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.transform = CGAffineTransformMakeTranslation(-self.view.frame.size.width, 0);
        }];
    }
}
-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    self.down = 0;
    return YES;
}


@end
