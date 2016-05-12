//
//  OASettingCell.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/12.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OASettingCell.h"

@implementation OASettingCell

+(instancetype)cellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item{
    // 创建cell
    static NSString *ID = @"mmd";
    OASettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell =[[OASettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


#pragma mark - 重写set方法分发数据
-(void)setCellItem:(NSDictionary *)cellItem{
    _cellItem = cellItem;
    
    // 设置数据
    self.imageView.image = [UIImage imageNamed:cellItem[OAIcon]];
    
    self.textLabel.text = cellItem[OATitle];
    
    // 1.取出对应的key值显示是箭头还是开关
    NSString *classStr = cellItem[OAAccessoryType];
    
    // 2.转为类
    Class className = NSClassFromString(classStr);
    
    // 3.创建对象
    id obj = [[className alloc] init];
    
    // 3.1判断对象类型
    if ([obj isKindOfClass:[UIImageView class]]) {
        //强转
        UIImageView *imageView = (UIImageView *)obj;
        
        imageView.image = [UIImage imageNamed:cellItem[OAAccessoryName]];
        
        //设置大小
        [imageView sizeToFit];
        
        //展示
        self.accessoryView = imageView;
    } else if ([obj isKindOfClass:[UISwitch class]]){
        UISwitch *switcher = (UISwitch *)obj;
        
        self.accessoryView = switcher;
    }

}


@end
