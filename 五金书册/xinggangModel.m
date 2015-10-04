//
//  xinggangModel.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "xinggangModel.h"
#import "MJExtension.h"
#import "xinggangcanshuModel.h"
@implementation xinggangModel
-(instancetype)init{
    if (self = [super init]) {
        [xinggangModel setupObjectClassInArray:^NSDictionary *{
            return @{@"sub":@"xinggangcanshuModel"};
        }];
    }
    return self;
}
@end
