//
//  AppDelegate.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "AppDelegate.h"
#import "OATabBarController.h"
#import "OAGuideController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - 判断新特性界面的逻辑
- (BOOL)isNewVersion {
    
    // 获取当前版本号
    // 获取info.plist文件中的所有信息
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    
    // 获取应用版本号
    NSString *version = info[@"CFBundleShortVersionString"];
    
    // MARK:旧的版本号从偏好设置中读取
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 读取旧版本号
    NSString *lodVersion = [defaults objectForKey:@"app_version"];
    
    // 比较版本号
    // 如果新的等于旧的,就不用显示新特性
    if ([version isEqualToString:lodVersion]) {
        return NO;
    } else {
        // 如果新的不等于旧的,显示新特性界面
        // 存储版本号信息
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:version forKey:@"app_version"];
        
        //同步
        [defaults synchronize];
        
        return YES;
    }

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置窗口的根控制器
    if ([self isNewVersion]) {
        // 是新版本
        self.window.rootViewController = [[OAGuideController alloc] init];
        
    } else {
        
        // 不是新版本
        self.window.rootViewController = [[OATabBarController alloc] init];
    }

    
    // 让窗口成为主窗口并可见
    [self.window makeKeyAndVisible];
    
    // MARK:通过应用程序对象统一设置状态栏效果
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
