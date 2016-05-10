//
//  OATabBarController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OATabBarController.h"
#import "OABottomView.h"
@interface OATabBarController () <OABottomViewDelegate>

@end

@implementation OATabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK:添加标签的子控制器
    [self setupChildVcs];
    
    // MARK:添加底部标签
    [self setupBottomView];
    
    // MARK: - 通过此属性修改选中的控制器
//    self.selectedIndex = 2;
    
}

#pragma mark - 添加底部的标签
- (void)setupBottomView {
    
    //创建视图
    OABottomView  *bottomView = [[OABottomView alloc] init];
    
    //设置frame信息
    bottomView.frame = self.tabBar.bounds;
    
    
#pragma mark - 设置代理
    bottomView.delegate = self;
    //添加到父视图
    [self.tabBar addSubview:bottomView];
    
    //MARK:添加按钮
    //遍历标签子控制器,每遍历到一个子控制器,给底部添加一个按钮
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 拼接图片名
        NSString *norImgName = [NSString stringWithFormat:@"TabBar%@", @(idx + 1)];
        NSString *selImgName = [NSString stringWithFormat:@"TabBar%@Sel", @(idx + 1)];
        
        // 创建普通的和选中的图片
        UIImage *norImg = [UIImage imageNamed:norImgName];
        UIImage *selImg = [UIImage imageNamed:selImgName];
        
        // 让bottomV添加按钮
        [bottomView addButtonWithImage:norImg andSelectImage:selImg];
        

        
    }];
    
}

#pragma mark - 实现代理方法
-(void)bottomView:(OABottomView *)bottomView didSelectIndex:(NSUInteger)idx {
    
    //修改标签控制器选中的索引
    self.selectedIndex = idx;
}

#pragma mark - 添加标签的子控制器
- (void)setupChildVcs {
   //大厅
    UINavigationController *hallNav = [self navWithStoryboardName:@"OAHall"];
    
    //竞技场
    UINavigationController *arenaNav = [self navWithStoryboardName:@"OAArena"];
    //发现
    UINavigationController *discoveryNav = [self navWithStoryboardName:@"OADiscovery"];
    //历史
    UINavigationController *historyNav = [self navWithStoryboardName:@"OAHistory"];
    //我的
    UINavigationController *myLotteryNav = [self navWithStoryboardName:@"OAMy"];
    
    self.viewControllers = @[hallNav, arenaNav, discoveryNav, historyNav, myLotteryNav];
    
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
