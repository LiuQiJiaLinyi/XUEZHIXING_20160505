//
//  LeftTableViewCell.h
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/4.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftTableViewCell : UITableViewCell
@property (nonatomic ,copy) UILabel * nameLabel;
@property (nonatomic ,copy) UIImageView * cellImageView;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
