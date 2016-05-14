//
//  OAGuideCell.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/14.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAGuideCell.h"
#import "OATabBarController.h"

@implementation OAGuideCell
{
    UIButton *_starBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIButton *starBtn = [[UIButton alloc] init];
    
    [starBtn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    [starBtn sizeToFit];
    starBtn.x = (self.width - starBtn.width) * 0.5;
    starBtn.y = (self.height - starBtn.height) * 0.92;
    
    starBtn.hidden = YES;
    
    [self.contentView addSubview:starBtn];
    _starBtn = starBtn;
    
    [_starBtn addTarget:self action:@selector(starBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)getIndexPath:(NSInteger)indexPath{
    
    //设置背景图片
    UIImage *bimg =[UIImage imageNamed:[NSString stringWithFormat:@"guide%@Background",@(indexPath + 1)]];
    self.backgroundView = [[UIImageView alloc] initWithImage:bimg];
    
    //如果是最后一个按钮就显示出来
    _starBtn.hidden = indexPath == 3 ? NO:YES;
    
    
}

#pragma mark - 按钮点击方法
- (void)starBtnClick {
    // 跳转到主程序界面 通过应用程序对象
    [UIApplication sharedApplication].keyWindow.rootViewController = [[OATabBarController alloc] init];
    
}

@end
