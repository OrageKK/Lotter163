//
//  OALuckyViewController.m
//  01-幸运转盘
//
//  Created by 黄坤 on 16/5/9.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OALuckyViewController.h"
#import "OARotateView.h"
@interface OALuckyViewController()<OARotateViewDelegate>

@property (weak, nonatomic) OARotateView *rotateView;
@end

@implementation OALuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    //添加图片
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"LuckyBackground"].CGImage);
    
    //加载xib
    OARotateView *rotate =  [OARotateView rotateView];
    
    [self.view addSubview:rotate];
    
    
    
    self.rotateView = rotate;
    
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    //设置代理
    self.rotateView.delegate = self;
    //开始转动
    [rotate starRotate];
    
}
#pragma mark - 实现代理方法
-(void)rotateView:(OARotateView *)rotate wantToAlertViewShow:(NSString *)message {
    //给用户提示
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"8.9.7.5.7" preferredStyle:UIAlertControllerStyleAlert];
    
    
    //添加按钮
//    __weak typeof (self) weakself = self;
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //接着转
        [rotate starRotate];
    }];
    
    [alertVc addAction:confirm];
    //显示
    [self presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark - 控制器的视图布局好了自己的子控件
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _rotateView.bounds = CGRectMake(0, 0, 286, 286);
    _rotateView.center = self.view.center;
}
#pragma mark - 状态栏显示白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

#pragma mark - 关闭按钮的点击方法
- (IBAction)closeBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
