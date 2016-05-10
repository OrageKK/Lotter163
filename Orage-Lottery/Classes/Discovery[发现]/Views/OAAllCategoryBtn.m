//
//  OAAllCategoryBtn.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAAllCategoryBtn.h"

@implementation OAAllCategoryBtn

#pragma mark - layoutSubviews方法,调整图片和文字的位置
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5;
    
}

@end
