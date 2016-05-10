//
//  OARotateView.h
//  01-幸运转盘
//
//  Created by 黄坤 on 16/5/9.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OARotateView;

@protocol OARotateViewDelegate <NSObject>

@optional
- (void)rotateView:(OARotateView *)rotate wantToAlertViewShow:(NSString *)message;

@end


@interface OARotateView : UIView


+ (instancetype)rotateView;

/**
 *  开始转动方法
 */


- (void)starRotate;

@property (weak, nonatomic) id<OARotateViewDelegate> delegate;


@end
