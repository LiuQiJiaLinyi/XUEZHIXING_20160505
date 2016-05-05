//
//  RightCollectionViewCell.m
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/4.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//


#import "RightCollectionViewCell.h"

@interface RightCollectionViewCell ()
{
}
@end

@implementation RightCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        _buttonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 100, 10)];
        _buttonLabel.text = @"商品展示";
        
        _topIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _topIamgeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"团购图标%d副本",_imageNum]];
       
    }
    [self addSubview:_buttonLabel];
    [self addSubview:_topIamgeView];
    
    return  self;
}

-(void)setImageNum:(int)imageNum
{
    _imageNum = imageNum;
    _topIamgeView.image = [UIImage imageNamed:[NSString stringWithFormat:@"团购图标%d副本",_imageNum]];
    
}

@end
