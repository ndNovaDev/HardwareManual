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
@interface lengthTableViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)NSArray *names;
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)UITextField *textField;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.title = self.titleName;
    self.tableView.rowHeight = 44;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    self.tableView.tableHeaderView = view;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, self.view.frame.size.width * 0.25 - 20, 64)];
    label.text = @"米";
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    zhuanhuanModel *zm = self.names[indexPath.row];
    cell.textLabel.text = zm.name;
    cell.detailTextLabel.text = zm.value;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor = [UIColor redColor];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.textField endEditing:YES];
}
-(void)textFiledValueChanged:(UITextField *)textField{
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.textField) {
        if (string.length == 0) return YES;
        
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        if (existedLength - selectedLength + replaceLength > 20) {
            return NO;
        }
    }
    
    return YES;
}

@end
