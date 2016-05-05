//
//  LeftTableViewCell.m
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/4.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "LeftTableViewCell.h"
@interface LeftTableViewCell()
{
    
}
@end


@implementation LeftTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    _nameLabel = nil;
    _cellImageView = nil;
    
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _nameLabel =[[UILabel alloc] initWithFrame:CGRectMake(40, 10, 70, 10)];
        _nameLabel.text = @"商品大类";
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _cellImageView.image = [UIImage imageNamed:@"团购图标1副本"];
        
        [self addSubview:_nameLabel];
        [self addSubview:_cellImageView];
    }
    return  self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
