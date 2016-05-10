//
//  OAHallController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAHallController.h"

@interface OAHallController ()

/**
 *  遮盖
 */
@property (weak, nonatomic) UIView *coverView;

/**
 *  广告图片框
 */
@property (weak, nonatomic) UIImageView *adImageView;


@end


@implementation OAHallController

- (IBAction)activityBtnClick {
    
    // MARK:1.创建遮盖
    UIView *coverV = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 设置颜色
    coverV.backgroundColor = [UIColor blackColor];
    coverV.alpha = 0.4;
    
    // 添加
    [self.tabBarController.view addSubview:coverV];
    
    // 赋值
    _coverView = coverV;
    
    
    
    // MARK:2.创建广告图片框
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    
    // 打开用户交互
    image.userInteractionEnabled = YES;
    
    image.center = self.tabBarController.view.center;
    
    // 添加
    [self.tabBarController.view addSubview:image];
    
    _adImageView = image;
    
    
    // MARK:3.关闭按钮
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 设置图片
    [closeBtn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    
    // 调整大小
    [closeBtn sizeToFit];
    
    // 调整位置
    closeBtn.x = image.width - closeBtn.width;
    
    // 添加
    [image addSubview:closeBtn];
    
    //监听点击事件
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}

#pragma mark - 关闭按钮的点击事件
- (void)closeBtnClick {
    
    // MARK:通过动画修改遮盖和图片框的透明度并移除
    [UIView animateWithDuration:0.5 animations:^{
        
        self.adImageView.alpha = 0;
        self.coverView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self.coverView removeFromSuperview];
        [self.adImageView removeFromSuperview];
    }];
    
}


@end
