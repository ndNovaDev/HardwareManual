//
//  frameModel.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "frameModel.h"
#import "xinggangcanshuModel.h"
#define margin 5
@implementation frameModel
-(void)setXm:(xinggangcanshuModel *)xm{
    _xm = xm;
    CGRect cellSize = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    CGSize labelSize = CGSizeMake((cellSize.size.width - 6 * margin) * 0.2, 44);
    CGFloat firstWidth = cellSize.size.width * 0.2;
    self.lf1 = CGRectMake(0, 0, firstWidth, labelSize.height);
    self.lf2 = CGRectMake(margin + CGRectGetMaxX(self.lf1), 0, labelSize.width, labelSize.height);
    self.lf3 = CGRectMake(margin + CGRectGetMaxX(self.lf2), 0, labelSize.width, labelSize.height);
    self.lf4 = CGRectMake(margin + CGRectGetMaxX(self.lf3), 0, labelSize.width, labelSize.height);
    self.lf5 = CGRectMake(cellSize.size.width - margin - firstWidth, 0, firstWidth, labelSize.height);
}
@end
