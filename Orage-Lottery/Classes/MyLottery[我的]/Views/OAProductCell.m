//
//  OAProductCell.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/13.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAProductCell.h"
#import "OAProduct.h"
@interface OAProductCell ()
/**
 *  图片框
 */
@property (weak, nonatomic) UIImageView *iconView;
/**
 *  应用名称
 */
@property (weak, nonatomic) UILabel *titleLbl;
@end


@implementation OAProductCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *iconView = [[UIImageView alloc] init];
        [self addSubview:iconView];
        _iconView = iconView;
        
        
        UILabel *titleLbl = [[UILabel alloc] init];
        titleLbl.font = [UIFont systemFontOfSize:13.0];
        titleLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLbl];
        _titleLbl = titleLbl;
        
        self.iconView.layer.cornerRadius = 10;
        self.iconView.layer.masksToBounds = YES;
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.height = 80;
    self.width = 80;
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(57);
        make.top.mas_equalTo(self.mas_top);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.mas_equalTo(self);
    }];
}



#pragma mark - 重写set方法分发数据

- (void)setProductModel:(OAProduct *)productModel {
    _productModel = productModel;
    
    self.iconView.image = [UIImage imageNamed:productModel.icon];
    
    self.titleLbl.text = productModel.title;
}

@end
