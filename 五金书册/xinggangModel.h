//
//  xinggangModel.h
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xinggangModel : NSObject
@property (nonatomic,assign)BOOL edit;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,strong)NSArray *sub;
/**标记是否为其他钢管*/
@property (nonatomic,assign)BOOL other;
@end
