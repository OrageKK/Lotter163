//
//  OALuckyController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OALuckyController.h"
#import "OALuckyViewController.h"
@interface OALuckyController ()

/**
 *  显示动画的图片框
 */
@property (weak, nonatomic) IBOutlet UIImageView *lightImageView;

@end


@implementation OALuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 开始做动画
    self.lightImageView.animationImages = @[
                                            [UIImage imageNamed:@"lucky_entry_light0"],
                                            [UIImage imageNamed:@"lucky_entry_light1"]
                                            ];
    
    // 动画时长
    self.lightImageView.animationDuration = 1.0;
    
    // 开启动画
    [self.lightImageView startAnimating];
    
}

#pragma mark - 以modal形式显示
-(IBAction)showLuckRotateWheel {
    
    //创建转盘控制器
    OALuckyViewController *rotateView = [[OALuckyViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rotateView];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
}


@end
