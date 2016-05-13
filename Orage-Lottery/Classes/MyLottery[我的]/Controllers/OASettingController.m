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
    
    // 返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
}

#pragma mark - 检查新版本
- (void)checkUpdate {
    
    
    // 通过UIAlertController弹窗提示,已经是最新版本了.
    
    UIAlertController *alertController =[UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - 选中cell的代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // MARK: - 1.取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // MARK: - 2.获取选中行的所有数据
    // 取出组的所有数据
    NSDictionary *selGroup = self.groupsArr[indexPath.section];
    
    // 获取组内所有行
    NSArray *selItems = selGroup[OAItems];
    
    // 取出选中行的数据
    NSDictionary *selItem = selItems[indexPath.row];
    
    
    
    // MARK: - 检查新版本,执行cell需要的方法
    
    // 取出方法名字符串
    NSString *selStr = selItem[OACallFunc];
    // 转为OC中的方法
    SEL selector = NSSelectorFromString(selStr);
    // 先判断再执行
    if ([self respondsToSelector:selector]) {
    // 宏的作用->告诉编译器忽略performSelector的警告
#pragma clang diagnostic push
        
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        // 执行方法
        [self performSelector:selector];
#pragma clang diagnostic pop
    }
    
    
    
    

    
    // MARK: - 3.跳转到目标控制器
    // 3.1获取目标控制器的字符串
    NSString *targetVcStr = selItem[OATargetVc];
    
    // 3.1.1如果字符串没有内容直接返回
    if (targetVcStr.length == 0) {
        return;
    }
    
    // 3.2转为类
    Class className = NSClassFromString(targetVcStr);
    
    // 3.2.1创建对象
    UIViewController *targetVc = [[className alloc] init];
    
    // 设置标题
    targetVc.navigationItem.title = selItem[OATitle];
    
    
    
#pragma mark - 如果是个设置控制器类型对象,加载plist文件
    if ([targetVc isKindOfClass:[OASettingController class]]) {
        
        // 转换为设置控制器类型的对象
        OASettingController *newSettingController = (OASettingController *)targetVc;
        
        // 配置plist文件
        newSettingController.plistName = selItem[OAPlistName];
        
        // 跳转
        [self.navigationController pushViewController:newSettingController animated:YES];
    } else {
        // 如果是其他普通控制器就直接跳转
        
        [self.navigationController pushViewController:targetVc animated:YES];
    }
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
