//
//  RightCollectionViewCell.h
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/4.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightCollectionViewCell : UICollectionViewCell
@property (nonatomic , copy)UILabel * buttonLabel;
@property (nonatomic ,copy)UIImageView * topIamgeView;
@property (nonatomic ,assign)int imageNum;
-(instancetype)initWithFrame:(CGRect)frame;
@end
