//
//  navigationItemButton.m
//  五金手册
//
//  Created by 李庆阳 on 15/9/29.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "navigationItemButton.h"

@implementation navigationItemButton
-(instancetype)initWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage title:(NSString *)title{
    if (self = [super initWithFrame:CGRectMake(0, 0, 60, 34)]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateHighlighted];
        [self.imageView setImage:image];
        [self.imageView setHighlightedImage:highlightImage];
    }
    return self;
}
+(instancetype)leftBtn{
    return [[self alloc] initWithImage:[UIImage imageNamed:@"tabbar_xingang"] highlightImage:[UIImage imageNamed:@"tabbar_xingang_selected"] title:@"常用资料"];
}
+(instancetype)rightBtn{
    return [[self alloc] initWithImage:[UIImage imageNamed:@"tabbar_xingang"] highlightImage:[UIImage imageNamed:@"tabbar_xingang_selected"] title:@"小尺子"];
}
-(void)layoutSubviews{
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    self.titleLabel.frame = CGRectMake(0, self.frame.size.height - titleSize.height, self.frame.size.width, titleSize.height);
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.height - titleSize.height, self.frame.size.height - titleSize.height);
    self.imageView.center = CGPointMake(self.frame.size.width * 0.5, self.imageView.frame.size.height * 0.5);
}
-(void)setHighlighted:(BOOL)highlighted{
    
}
@end
