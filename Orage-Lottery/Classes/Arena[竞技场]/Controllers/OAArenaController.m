//
//  OAArenaController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAArenaController.h"

@interface OAArenaController ()

/**
 *  选项卡
 */
@property (nonatomic, weak) IBOutlet UISegmentedControl *segment;

@end


@implementation OAArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    
    // 设置导航栏的背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    // 设置选项卡的背景
    // 普通状态
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    // 选中状态
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 文字的颜色
    [self.segment setTitleTextAttributes:@{
                                          NSForegroundColorAttributeName:[UIColor whiteColor]
                                          
                                          } forState:UIControlStateNormal];
    [self.segment setTitleTextAttributes:@{
                                          NSForegroundColorAttributeName:[UIColor cyanColor]
                                          }forState:UIControlStateSelected];
    
}


@end
