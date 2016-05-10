//
//  OAGroupBuyController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/10.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAGroupBuyController.h"
#import "OAAllCategoryBtn.h"

@interface OAGroupBuyController ()

/**
 *  蓝色视图
 */
@property (weak, nonatomic) UIView *blueView;

@end

@implementation OAGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 添加蓝色的视图
    UIView *blueV = [[UIView alloc] init];
    
    blueV.backgroundColor = OARandomColor;
    
    blueV.x = 0;
    blueV.y = 64;
    blueV.width = self.view.width;
    blueV.height = 0;
    
    [self.view addSubview:blueV];
    
    _blueView = blueV;
    
}

- (IBAction)topButtonClick:(OAAllCategoryBtn *)sender {
    
    // MARK:让按钮内部的图片框发生旋转
    BOOL isIdentity = CGAffineTransformIsIdentity(sender.imageView.transform);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    CGFloat height;
    if (isIdentity) {
        
        //发生形变
        transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
        height = 200;
        
    }else {
        
        //清除形变
        transform = CGAffineTransformIdentity;
        height = 0;
        
    }
    
    // MARK:动画显示蓝色视图
    [UIView animateWithDuration:0.5 animations:^{
        
        sender.imageView.transform = transform;
        self.blueView.height = height;
    }];
    
    
    
    
}

@end
