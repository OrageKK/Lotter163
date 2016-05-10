//
//  OALuckyBtn.m
//  01-幸运转盘
//
//  Created by 黄坤 on 16/5/9.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OALuckyBtn.h"

@implementation OALuckyBtn
/**
 *  调整按钮身上图片的尺寸信息
 *
 *  @param contentRect <#contentRect description#>
 *
 *  @return <#return value description#>
 */
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat width = 40;
    CGFloat height = 46;
    CGFloat x = (contentRect.size.width - width) * 0.5;
    CGFloat y = 20;
    
    return CGRectMake(x, y, width, height);
}

@end
