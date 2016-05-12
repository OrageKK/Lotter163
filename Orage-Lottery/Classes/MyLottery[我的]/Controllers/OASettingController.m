//
//  OASettingController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/11.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OASettingController.h"

@implementation OASettingController

#pragma mark - 返回分组样式
- (instancetype)init {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (BOOL)hidesBottomBarWhenPushed{
    
    return YES;
}


@end
