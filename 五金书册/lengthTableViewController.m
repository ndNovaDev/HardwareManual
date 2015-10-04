//
//  lengthTableViewController.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/2.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "lengthTableViewController.h"
#import "MJExtension.h"
#import "zhuanhuanModel.h"
#import "TKeyBoardView.h"
//#import "zhuanhuanTableViewCell.h"
@interface lengthTableViewController ()<UITextFieldDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)NSArray *names;
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)double value;
@end

@implementation lengthTableViewController
{
    TKeyBoardView *keyBoardView;
}
-(NSArray *)names{
    if (!_names) {
        _names = [zhuanhuanModel objectArrayWithFile:[[NSBundle mainBundle] pathForResource:self.fileName ofType:nil]];
    }
    return _names;
}
-(instancetype)initWithName:(NSString *)name{
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.value = 1;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.title = self.titleName;
    self.tableView.rowHeight = 44;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    self.tableView.tableHeaderView = view;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.view.frame.size.width * 0.5 - 20, 64)];
    label.text = self.name;
    label.textAlignment = NSTextAlignmentLeft;
    
    label.font = [UIFont systemFontOfSize:26];
    self.label = label;
    [view addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.25, 0, self.view.frame.size.width * 0.75 - 20, 64)];
    textField.font = [UIFont systemFontOfSize:18];
    textField.textAlignment = NSTextAlignmentRight;
    textField.text = @"1";
    textField.delegate = self;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [textField addTarget:self action:@selector(textFiledValueChanged:) forControlEvents:UIControlEventEditingChanged];
    self.textField = textField;
    [view addSubview:textField];
//    keyBoardView = [TKeyBoardView kBoardView];
//    keyBoardView.keyTextField = textField;
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    zhuanhuanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[zhuanhuanTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    zhuanhuanModel *zm = self.names[indexPath.row];
    cell.zm = zm;
    cell.name = self.name;
    cell.value = self.value;
    cell.NVs = self.names;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    zhuanhuanTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.label.text = cell.zm.name;
    self.name = cell.zm.name;
    [self.tableView reloadData];
    [self.textField endEditing:YES];
}
-(void)textFiledValueChanged:(UITextField *)textField{
    self.value = [textField.text intValue];
    [self.tableView reloadData];
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.textField) {
        if (string.length == 0) return YES;
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 9) {
            return NO;
        }
    }
    
    return YES;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.textField endEditing:YES];
}
@end
