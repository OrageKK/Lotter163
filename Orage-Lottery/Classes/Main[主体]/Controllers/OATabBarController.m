//
//  OATabBarController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OATabBarController.h"
#import "OABottomView.h"
@interface OATabBarController ()

@end

@implementation OATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK:添加标签的子控制器
    [self setupChildVcs];
    
}


#pragma mark - 添加标签的子控制器
- (void)setupChildVcs {
   
    UINavigationController *hallNav = [self navWithStoryboardName:@"OAHall"];
}

#pragma mark - 根据故事版创建控制器
- (UINavigationController *)navWithStoryboardName:(NSString *)sbName {
    // ->加载文件[故事板文件]
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    // ->实例化文件中的控制器[带箭头的控制器]
    UINavigationController *nav = [sb instantiateInitialViewController];
    
    // 设置测试颜色
    nav.topViewController.view.backgroundColor = OARandomColor;
    
    return nav;
}


@end
