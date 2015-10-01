//
//  danweizhuanhuanButton.m
//  五金书册
//
//  Created by 李庆阳 on 15/10/1.
//  Copyright © 2015年 NovaDev. All rights reserved.
//

#import "danweizhuanhuanButton.h"

@implementation danweizhuanhuanButton
-(instancetype)initWithImage:(UIImage *)image highlightImage:(UIImage *)highlightImage title:(NSString *)title frame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateHighlighted];
        [self.imageView setImage:image];
        [self.imageView setHighlightedImage:highlightImage];
    }
    return self;
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
