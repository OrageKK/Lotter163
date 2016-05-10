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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //统一设置导航栏的背景
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
}

@end
