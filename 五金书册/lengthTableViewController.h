//
//  lengthTableViewController.h
//  五金书册
//
//  Created by 李庆阳 on 15/10/2.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhuanhuanTableViewCell.h"
@interface lengthTableViewController : UITableViewController
@property (nonatomic,copy)NSString *fileName;
@property (nonatomic,copy)NSString *titleName;
-(instancetype)initWithName:(NSString *)name;
@end
