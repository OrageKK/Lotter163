//
//  OANavigationController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OANavigationController.h"

@implementation OANavigationController


// 设置导航栏背景演示
/**
 UIBarMetricsDefault,           任何情况都ok
 UIBarMetricsCompact,           只有横着的时候ok
 UIBarMetricsDefaultPrompt      有提示标题,就可以显示
 UIBarMetricsCompactPrompt      有提示标题,并且横着才显示
 */

// 第一次初始化这个类的时候调用,并且只调用一次
+ (void)initialize {
    UINavigationBar *nav = [UINavigationBar appearance];//appearance 外观代理对象(单例)返回值为控件类型
    //通过外观代理对象设置的界面效果,将来任何通过此类实例化的控件,界面效果都一样
    
    //统一设置导航栏的背景
    [nav setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
//     设置导航栏的标题颜色
    [nav setTitleTextAttributes:@{
                                 NSForegroundColorAttributeName:[UIColor whiteColor]
                                 }];
    // 设置两侧按钮的文字颜色
    [nav setTintColor:[UIColor whiteColor]];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
