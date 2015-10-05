//
//  xinggangcanshuTableViewController.h
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xinggangcanshuTableViewController : UITableViewController
@property (nonatomic,assign)BOOL needEdit;
-(instancetype)initWithStyle:(UITableViewStyle)style titleName:(NSString *)titleName canshus:(NSArray *)canshus;

@end
