//
//  OAMyController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/11.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAMyController.h"
#import "OASettingController.h"
#import "OANavigationController.h"




@implementation OAMyController{
    
    UIImageView *_loginImageView;
    
    UILabel *_loginLbl;
    
    UIButton *_loginBtn;
    
    UIButton *_registerBtn;
    
    
    
    
}


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupRestrain];
    
    self.view.backgroundColor = OARandomColor;
    
    // 设置导航栏标题
    self.title = @"我的彩票";
    // MARK: push时隐藏标签控制器
    self.hidesBottomBarWhenPushed = YES;
}


#pragma mark - 设置界面
- (void)setupUI {
    
    
    // 客服按钮
    UIButton *kefu = [[UIButton alloc] init];
    [kefu setImage:[UIImage imageNamed:@"FBMM_Barbutton"]forState:UIControlStateNormal];
    // 设置文字
    [kefu setTitle:@"客服" forState:UIControlStateNormal];
    kefu.titleLabel.textColor = [UIColor whiteColor];
    kefu.frame = CGRectMake(0, 0, 49, 22);
    kefu.titleLabel.font = [UIFont systemFontOfSize:18.0];
    
    // MARK:包装按钮
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:kefu];
    // 添加
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    
    
    
    // 设置按钮
    UIButton *settingBtn = [[UIButton alloc] init];
    
    [settingBtn setImage:[UIImage imageNamed:@"Mylottery_config"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    [settingBtn addTarget:self action:@selector(configItemClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    // 图片框
    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LoginScreen"]];
    
    [self.view addSubview:imageView];
    _loginImageView = imageView;
    
    
    
    
    
    //lbl
    UILabel *lbl = [[UILabel alloc] init];
    lbl.text = @"网易邮箱账号可以直接登录";
    lbl.font = [UIFont systemFontOfSize:15.0];
    [self.view addSubview:lbl];
    _loginLbl = lbl;
    
    
    
    
    
    //登录按钮
    UIButton *login = [[UIButton alloc ]init];
    // MARK: - 给登录按钮设置背景图片
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    UIImage *image2 = [UIImage imageNamed:@"RedButtonPressed"];
    
    // 对图片进行拉伸
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    image2 = [image2 stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [login setBackgroundImage:image forState:UIControlStateNormal];
    [login setBackgroundImage:image2 forState:UIControlStateSelected];
    // 设置文字
    [login setTitle:@"登       录" forState:UIControlStateNormal];
    // 添加
    [self.view addSubview:login];
    
    //赋值
    _loginBtn = login;
    
    
    
    
    
    //注册按钮
    UIButton *registerBtn = [[UIButton alloc] init];
    [registerBtn setBackgroundImage:image forState:UIControlStateNormal];
    [registerBtn setBackgroundImage:image2 forState:UIControlStateSelected];
    // 设置文字
    [registerBtn setTitle:@"注       册" forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    _registerBtn = registerBtn;
    
}

#pragma mark - 设置约束
- (void)setupRestrain {
    
    //图片框
    [_loginImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_topLayoutGuideBottom).offset(30);
        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.width.mas_equalTo(296);
//        make.height.mas_equalTo(138);
    }];
    
    
    //lbl
    [_loginLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_loginImageView.mas_bottom).offset(8);
        make.centerX.mas_equalTo(_loginImageView.mas_centerX);
    }];
    
    
    //登录按钮
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).offset(20);
        make.trailing.mas_equalTo(self.view).offset(-20);
        make.top.mas_equalTo(_loginLbl.mas_bottom).offset(55);
    }];
    
    //注册按钮
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_loginBtn.mas_bottom).offset(32);
        make.leading.trailing.mas_equalTo(_loginBtn);
    }];
    
  
    
}
#pragma mark - 跳转到设置控制器
- (void)configItemClick {
    
    // 1.创建设置控制器对象
    OASettingController *settingVc = [[OASettingController alloc] init];
    
    // 1.2 设置标题
    settingVc.navigationItem.title = @"设置";
    
    // 2.跳转
    [self.navigationController pushViewController:settingVc animated:YES];
    
    
}


@end
