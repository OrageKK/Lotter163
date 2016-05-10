//
//  OABottomView.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OABottomView.h"
#import "OABottoomButton.h"

@interface OABottomView()
/**
 *  用来保存底部被选中的按钮
 */
@property (weak, nonatomic) OABottoomButton *selectBtn;

@end



@implementation OABottomView

- (void)addButtonWithImage:(UIImage *)norImg andSelectImage:(UIImage *)selImg {
    
    // 1.创建按钮
    OABottoomButton *button = [OABottoomButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置图片
    [button setBackgroundImage:norImg forState:UIControlStateNormal];
    [button setBackgroundImage:selImg forState:UIControlStateSelected];
    
    // 3.添加按钮
    [self addSubview:button];
    
    // 4.按钮监听事件
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 点击底部的按钮时调用
- (void)btnClick:(OABottoomButton *)sender {
    
    NSLog(@"按钮被点了");
    
    // MARK: - 1.修改按钮的状态
    // 1.将之前保存的清除
    self.selectBtn.selected = NO;
    
    // 2.将选中的状态设置为yes
    sender.selected = YES;
    
    // 3.赋值保存
    self.selectBtn = sender;
    
    
    
    // MARK: - 2.让标签控制器切换子控制器
    
#pragma mark - 通过代理判断并执行协议方法
    if ([self.delegate respondsToSelector:@selector(bottomView:didSelectIndex:)]) {
        
        [self.delegate bottomView:self didSelectIndex:sender.tag];
    }
    
}

#pragma mark - 布局按钮的方法
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 遍历并布局按钮
    // 宽/高
    CGFloat btnW = self.width / self.subviews.count;
    CGFloat btnH = self.height;
    
    // y
    CGFloat btnY = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof OABottoomButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // x
        CGFloat btnX = idx * btnW;
        
  
        obj.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        
        // MARK:设置按钮的tag值作为跳转控制器的索引
        obj.tag = idx;
        
        // MARK:设置默认选中第0个按钮
        if (idx == 0) {
            
            [self btnClick:obj];
        }
        
    }];
    
    
}


@end
