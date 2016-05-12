//
//  OASettingCell.h
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/12.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import <UIKit/UIKit.h>

// 组
#define OAHeader        @"OAHeader"                    // 组标题
#define OAFooter        @"OAFooter"                    // 组结尾
#define OAItems         @"OAItems"                      // 组内所有的cell

// cell
#define OAIcon          @"icon"                        // 图片
#define OATitle         @"title"                      // 标题
#define OAAccessoryType @"OAAccessoryType"      // 标题
#define OAAccessoryName @"OAAccessoryName"      // 标题
#define OATargetVc      @"OATargetVc"                // 目标控制器字符串
#define OAPlistName     @"OAPlistName"              // 要加载的plist文件名
#define OASubtitle      @"OASubtitle"                // 子标题
#define OACellStyle     @"OACellStyle"              // cell的样式
#define OAHighLight     @"OAHighLight"              // 子标题颜色
#define OAKeyName       @"OAKeyName"              // 存储和读取开关状态时的key
#define OATimeKey       @"OATimeKey"              // 存储和读取时间



@interface OASettingCell : UITableViewCell

/**
 *  提供对外接口创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item;

@property (strong, nonatomic) NSDictionary *cellItem;

@end
