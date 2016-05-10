//
//  OABottomView.h
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OABottomView : UIView
/**
 *  添加按钮的方法
 *
 *  @param norImg 普通状态的图片
 *  @param selImg 选中状态的图片
 */
- (void)addButtonWithImage:(UIImage *)norImg andSelectImage:(UIImage *)selImg;
@end
