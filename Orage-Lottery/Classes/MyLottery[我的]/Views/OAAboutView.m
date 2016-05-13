//
//  OAAboutView.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/14.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAAboutView.h"

@implementation OAAboutView{
    UIImageView *_logo;
    UILabel *_lbl;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
        
        
    }
    return self;
}

- (void)setupUI {
    
    self.width = 320;
    self.height = 330;
    
    UIImageView *logo = [[UIImageView alloc] init];
    logo.image = [UIImage imageNamed:@"about_logo"];
    [logo sizeToFit];
    [self addSubview:logo];
    _logo = logo;
    
    UILabel *lbl = [[UILabel alloc] init];
    lbl.text = @"版本:3.36 build 314";
    lbl.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lbl];
    _lbl = lbl;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_logo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.centerX.mas_equalTo(self);
    }];
    
    [_lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_logo.mas_bottom).offset(22);
        make.leading.equalTo(_logo);
    }];
}

@end
