//
//  OAAboutController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/14.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAAboutController.h"
#import "OAAboutView.h"
@interface OAAboutController ()

@end

@implementation OAAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置headerView
    self.tableView.tableHeaderView = [[OAAboutView alloc] init];
    
    // 不让tableView滚动的属性
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 评分支持
- (void)scoreSupport {
    
    NSLog(@"感谢评分支持");
    
    // 1.评分支持链接NSURL https://www.github.com
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/id411654863?mt=8"];
    
    // 2.通过应用程序对象打开链接
    [[UIApplication sharedApplication] openURL:url];
}

#pragma mark - 客服电话
- (void)callMM {
    
    
    NSLog(@"拨打客服电话");
    NSURL *telUrl = [NSURL URLWithString:@"tel://10086"];
    //    @"facetime://huijuan@apple.com";
    if ([[UIApplication sharedApplication] canOpenURL:telUrl]) {
        
        [[UIApplication sharedApplication] openURL:telUrl];
    } else {
        
        NSLog(@"不能打电话");
    }

    
}

@end
