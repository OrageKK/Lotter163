//
//  OAScoreLiveController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/13.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAScoreLiveController.h"
#import "OASettingCell.h"
@interface OAScoreLiveController ()
/**
 *  用来叫出键盘的文本框
 */
@property (nonatomic, strong) UITextField *field;

/**
 *  时间选择控件
 */
@property (nonatomic, strong) UIDatePicker *datePicker;

/**
 *  工具条
 */
@property (nonatomic, strong) UIToolbar *toolbar;

/**
 *  选中的cell
 */
@property (nonatomic, weak) OASettingCell *selectCell;

@end




@implementation OAScoreLiveController

-(void)viewDidLoad {
    
    [super viewDidLoad];
}



#pragma mark - 重写选中cell的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取消选中的动画效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    // 如果是第0组-有switch无点击事件-直接返回
    if (indexPath.section == 0) {
        return;
    }
    
    // 获取选中的cell
    
    OASettingCell *selCell = [tableView cellForRowAtIndexPath:indexPath];
    
    // 赋值
    _selectCell = selCell;
    
    // 将文本框添加到cell上
    [selCell addSubview:self.field];
    
    // 让文本框成为第一响应者
    [self.field becomeFirstResponder];
    
    
   
    
}

#pragma mark - 点击完成调用
- (void)doneItemClick {
    
    // 1.获取时间数据 NSDate
    NSDate *date = self.datePicker.date;
    
    // 2.日期格式化
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm"; // 小时,分钟
    
    // 3.将时间数据转为字符串
    NSString *timeStr = [formatter stringFromDate:date];
    
    // 4.设置给cell的detailLabel
    self.selectCell.timeString = timeStr;
    
    //    HMLog(@"%@", timeStr);
    
    
    // 5.关闭键盘
    [self.view endEditing:YES];
}

#pragma mark - 点击取消调用
- (void)cancelItemClick {
    
    // 关闭键盘
    [self.view endEditing:YES];
    
}



#pragma mark - 懒加载控件
// 文本框
- (UITextField *)field {
    
    if (_field == nil) {
        _field = [[UITextField alloc] init];
        
        // 设置自定义键盘和工具条
        _field.inputView = self.datePicker;
        _field.inputAccessoryView = self.toolbar;
    }
    
    return _field;
}

- (UIDatePicker *)datePicker {
    
    if (_datePicker == nil) {
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        
        datePicker.datePickerMode = UIDatePickerModeTime;
        datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        
        _datePicker = datePicker;
        
    }
    return _datePicker;
}

- (UIToolbar *)toolbar {
    
    if (_toolbar == nil) {
        _toolbar = [[UIToolbar alloc] init];
        
        _toolbar.frame = CGRectMake(0, 0, 0, 44);
        
        // 3个按钮
        // 完成
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneItemClick)];
        // 弹簧
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        // 取消
        UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelItemClick)];
        
        
        
        _toolbar.items = @[cancel,flex, done ];
    }
    return _toolbar;
}


@end
