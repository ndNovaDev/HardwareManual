//
//  xinggangcanshuModel.h
//  五金书册
//
//  Created by 李庆阳 on 15/10/4.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xinggangcanshuModel : NSObject
/**所属种类*/
@property (nonatomic,copy)NSString *fatherName;
/**外径/厚度*/
@property (nonatomic,copy)NSString *d;
/**方钢/六角钢边宽*/
@property (nonatomic,copy)NSString *a;
/**型号*/
@property (nonatomic,copy)NSString *type;
/**等边角钢边宽/不等边角钢短边宽*/
@property (nonatomic,copy)NSString *b;
/**单重*/
@property (nonatomic,copy)NSString *G;
/**不等边角钢长边宽*/
@property (nonatomic,copy)NSString *k;
/**高度*/
@property (nonatomic,copy)NSString *h;
/**H型钢腹板厚度*/
@property (nonatomic,copy)NSString *f;
/**H型钢翼板厚度*/
@property (nonatomic,copy)NSString *y;
/**公称口径*/
@property (nonatomic,copy)NSString *rr;
/**公称外径*/
@property (nonatomic,copy)NSString *r;

@end
