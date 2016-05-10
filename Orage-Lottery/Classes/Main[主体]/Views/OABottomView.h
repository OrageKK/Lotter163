//
//  OABottomView.h
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OABottomView;

#pragma mark - 制定代理协议
@protocol OABottomViewDelegate <NSObject>

@optional

- (void)bottomView:(OABottomView *)bottomView didSelectIndex:(NSUInteger)idx;

@end

@interface OABottomView : UIView
/**
 *  添加按钮的方法
 *
 *  @param norImg 普通状态的图片
 *  @param selImg 选中状态的图片
 */
- (void)addButtonWithImage:(UIImage *)norImg andSelectImage:(UIImage *)selImg;

//设置代理属性
@property (weak, nonatomic) id<OABottomViewDelegate> delegate;
@end
