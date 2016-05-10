//
//  OABottomView.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OABottomView.h"

@implementation OABottomView

- (void)addButtonWithImage:(UIImage *)norImg andSelectImage:(UIImage *)selImg {
    
    // 1.创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置图片
    [button setBackgroundImage:norImg forState:UIControlStateNormal];
    [button setBackgroundImage:selImg forState:UIControlStateSelected];
    
    // 3.添加按钮
    [self addSubview:button];
    
    // 4.按钮监听事件
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 点击底部的按钮时调用
- (void)btnClick:(UIButton *)sender {
    
    NSLog(@"按钮被点了");
    
    // MARK: - 1.修改按钮的状态
    
    
    
    // MARK: - 2.让标签控制器切换子控制器
    
    
}

#pragma mark - 布局按钮的方法
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 遍历并布局按钮
    // 宽/高
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    
    // y
    CGFloat btnY = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // x
        CGFloat btnX = idx * btnW;
//        obj.tag = idx;
        obj.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }];
    
    
}


@end
