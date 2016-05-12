//
//  OASettingController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/11.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OASettingController.h"
#import "OASettingCell.h"


@interface OASettingController ()

/**
 *  保存所有数据的数组
 */
@property (strong, nonatomic) NSArray *groupsArr;

@end

@implementation OASettingController

#pragma mark - 返回分组样式
- (instancetype)init {
    
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - 数据源方法
// 有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupsArr.count;
}
// 每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    // 取出第section组的所有数据
    NSDictionary *group = self.groupsArr[section];
    
    // 取出该组所有cell的数组
    NSArray *items = group[OAItems];
    
    // 返回行数
    return items.count;
    
}

// 返回每一个cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取出第section组的所有数据
    NSDictionary *group = self.groupsArr[indexPath.section];
    
    // 取出该组所有cell的数组
    NSArray *items = group[OAItems];
    
    // 取出对应行的数据
    NSDictionary *item = items[indexPath.row];
    
    // 创建cell


    OASettingCell *cell = [OASettingCell cellWithTableView:tableView andItem:item];
    
    // 设置数据

    
    cell.cellItem = item;
    // 返回cell
    return  cell;
}

// 显示组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    // 组的所有数据
    NSDictionary *group = self.groupsArr[section];
    
    return group[OAHeader];
}

// 显示组结尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    // 组的所有数据
    NSDictionary *group = self.groupsArr[section];
    
    return group[OAFooter];
    
}





#pragma mark - 懒加载
- (NSArray *)groupsArr {
    if (_groupsArr == nil) {
        
        _groupsArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"]];
    }
    
    return _groupsArr;
}


- (BOOL)hidesBottomBarWhenPushed{
    
    return YES;
}


@end
