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
        cell =[[self alloc] initWithStyle:[self styleWithItem:item] reuseIdentifier:ID];
        
    }
    return cell;
}

#pragma mark - 判断cell的样式
//注意是类方法
+ (UITableViewCellStyle)styleWithItem:(NSDictionary *)item {
    
    // 定义一个样式的变量
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    
    if ([item[OACellStyle] isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        
        style = UITableViewCellStyleSubtitle;
    } else if([item[OACellStyle] isEqualToString:@"UITableViewCellStyleValue1"]) {
        
        style = UITableViewCellStyleValue1;
    } else if([item[OACellStyle] isEqualToString:@"UITableViewCellStyleValue2"]) {
        
        style = UITableViewCellStyleValue2;
    } else if([item[OACellStyle] isEqualToString:@"UITableViewCellStyleDefault"]) {
        
        style = UITableViewCellStyleDefault;
    }
    return style;
    
    
}

#pragma mark - 设置时间
- (void)setTimeString:(NSString *)timeString {
    
    _timeString = timeString;
    
    self.detailTextLabel.text = timeString;
    
    //MARK: 1- 存储时间
    //- 获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //- 存储数据
    [defaults setObject:timeString forKey:self.cellItem[OATimeKey]];
    //- 同步
    [defaults synchronize];
    
}

#pragma mark - 开关存储
- (void)switcherValueChanged:(UISwitch *)sender {
    
    
    
    // MARK: - 2.存储开关状态数据
    //- 获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //- 存储数据
    [defaults setBool:sender.isOn forKey:self.cellItem[OAKeyName]];
    
    //- 同步
    [defaults synchronize];
    
}


#pragma mark - 重写set方法分发数据
-(void)setCellItem:(NSDictionary *)cellItem{
    _cellItem = cellItem;
    
    // 设置数据
    if ([cellItem[OAIcon] length] > 0) {
        
        
        self.imageView.image = [UIImage imageNamed:cellItem[OAIcon]];
    }
    
    self.textLabel.text = cellItem[OATitle];
    
    // 设置子标题
    self.detailTextLabel.text = cellItem[OASubtitle];
    
    // 设置子标题颜色
    BOOL isHeighLight = [cellItem[OAHighLight] boolValue];
    
    // MARK: 2- 读取时间数据
    if ([cellItem[OATimeKey] length] > 0) {
        
        // - 获取偏好设置对象
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // - 读取时间
        NSString *timeStr = [defaults objectForKey:cellItem[OATimeKey]];
        
        // - 设置时间
        // 如果没有读取出数据,就别设置了
        if (timeStr.length > 0) {
            self.detailTextLabel.text = timeStr;
        }
    }
    
    
    // 如果是高亮状态显示红色,否则显示黑色
    if (isHeighLight) {
        self.detailTextLabel.textColor = [UIColor redColor];
    } else {
        self.detailTextLabel.textColor = [UIColor blackColor];
    }
    
    // 1.取出对应的key值显示是箭头还是开关
    NSString *classStr = cellItem[OAAccessoryType];
    
    
    // 1.2- 如果没有对应的箭头或者开关,干脆不往下走了
    if (classStr.length <= 0) {
        return ;
    }
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
        // MARK: - 1.读取开关的数据
        //- 获取偏好设置对象
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        //打印沙盒路径
        //NSLog(@"%@",NSHomeDirectory());
        
        //- 读取数据
        BOOL isOn = [defaults boolForKey:cellItem[OAKeyName]];
        
        //- 设置给开关
        switcher.on = isOn;
        
        // 开关状态是否改变
        [switcher addTarget:self action:@selector(switcherValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        self.accessoryView = switcher;
    }

    
}


@end
