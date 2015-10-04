//
//  zhuanhuanTableViewCell.h
//  五金书册
//
//  Created by 李庆阳 on 15/10/3.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class zhuanhuanModel;
@interface zhuanhuanTableViewCell : UITableViewCell
@property (nonatomic,strong)zhuanhuanModel *zm;
@property (nonatomic,assign)double value;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)NSArray *NVs;
@end
