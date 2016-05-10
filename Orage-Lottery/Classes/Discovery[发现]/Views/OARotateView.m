//
//  OARotateView.m
//  01-幸运转盘
//
//  Created by 黄坤 on 16/5/9.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OARotateView.h"
#import "OALuckyBtn.h"
@interface OARotateView (){
    //旋转的图片框
    IBOutlet UIImageView *_rotateWheel;
    
    /**
     *  保存选中的按钮
     */
    OALuckyBtn *_selectBtn;
    
    /**
     *  定时器
     */
    CADisplayLink *_link;
    
    

}
//@property (weak, nonatomic) UIAlertController *alertVc;
@end

@implementation OARotateView



+ (instancetype)rotateView{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"OARotateView" owner:nil options:nil]lastObject];
}


#pragma mark - 开始选号
- (IBAction)chooseNumberBtnClick {
    
    //停止定时器的刷新
    [_link invalidate];
    
    
    //开启核心动画的转动
    //创建基本核心动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    //设置代理
    anim.delegate = self;
    
    //设置属性
    //按钮的偏移角度
    CGFloat angle = _selectBtn.tag * (M_PI * 2 / 12);
    
    anim.toValue = @(M_PI * 2 * 5 - angle);
    
    //设置时长
    anim.duration = 2.5;
    //设置动画节奏属性
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    
    //添加到Layer上
    [_rotateWheel.layer addAnimation:anim forKey:nil];
    
 
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    //将视图的tramsform改回同样的位置
    //获取按钮的偏移角度
    CGFloat angle = _selectBtn.tag * (M_PI * 2 / 12);
    
    //MAKE回去保证按钮在最上面
    _rotateWheel.transform = CGAffineTransformMakeRotation(-angle);
    
    
    
    
    
    
    
    if ([self.delegate respondsToSelector:@selector(rotateView:wantToAlertViewShow:)]) {
        NSLog(@"代理有响应");
        [self.delegate rotateView:self wantToAlertViewShow:@"8.9.7.5.7"];
        
    }else {
        NSLog(@"代理无响应");
    }
    
#warning mark - 通过application取得viewController的方法显示alertController
//    UIViewController *vc = [UIApplication sharedApplication].windows[0].rootViewController;
//    [vc presentViewController:alertVc animated:YES completion:nil];
    
 
}


#pragma mark - 开始转动
- (void)starRotate {
    //开启定时器
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotate)];
    
    //添加到运行循环
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    //赋值
    _link = link;
}

//转动方法
- (void)rotate {
    // 1.让图片框一直转动
    _rotateWheel.transform = CGAffineTransformRotate(_rotateWheel.transform, M_PI_4 * 0.01);
}

#pragma mark - 添加按钮
//不管怎么创建保证按钮都有
//纯代码
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupButtons];
    }
    return self;
}
//xib
- (void)awakeFromNib {
    [self setupButtons];
}

#pragma mark - 添加按钮的方法
- (void)setupButtons {
    //创建按钮
    for (NSInteger i = 0; i<12; i++) {
        OALuckyBtn *btn = [OALuckyBtn buttonWithType:UIButtonTypeCustom];
        
        //绑定tag
        btn.tag = i;
        //按钮的背景色
        btn.backgroundColor = [UIColor clearColor];
        //屏蔽自灰效果,也可在OALuckyBtn中重写setHighlighted:方法
        btn.adjustsImageWhenHighlighted = NO;
        
        //按钮的图片
        //选中状态的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        
        UIImage *image = [self createImageWithOriginaImg:@"LuckyAstrology" andIdx:i];
        [btn setImage:image forState:UIControlStateNormal];

        
        UIImage *image2 = [self createImageWithOriginaImg:@"LuckyAstrologyPressed" andIdx:i];
        [btn setImage:image2 forState:UIControlStateSelected];
        
        
        //添加
        [_rotateWheel addSubview:btn];
        
        //监听按钮的点击事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - 按钮的点击方法
- (void)btnClick:(OALuckyBtn *)sender {
    //清除之前保存按钮的状态
    _selectBtn.selected  = NO;
    
    //修改当前选中的
    sender.selected = YES;
    
    //将当前选中的按钮保存起来
    _selectBtn = sender;
}

#pragma mark - 裁减图片
- (UIImage *)createImageWithOriginaImg: (NSString *)imgName andIdx:(NSInteger )idx {
    //普通状态的图片
    //获取
    UIImage *originaImage = [UIImage imageNamed:imgName];
    
    
    
    //计算裁减图片的数据
    CGFloat width = originaImage.size.width / 12;
    CGFloat height = originaImage.size.height;
    CGFloat y = 0;
    CGFloat x = idx * width;
    
    //MARK:通过乘以屏幕的缩放因子,实现像素的转换,把点坐标转为像素
    
    //获取当前的屏幕缩放因子
    CGFloat scale = [UIScreen mainScreen].scale;
    
    width *= scale;
    height *= scale;
    x *= scale;
    y *= scale;
    
    
    CGRect rect = CGRectMake(x, y, width, height);
    /**
     *  裁减图片
     *  CGImageRef  _Nullable image 要裁减的图片
     *  CGRect rect 裁减的范围
     */
    
    //裁减好的图片
    CGImageRef cgImg = CGImageCreateWithImageInRect(originaImage.CGImage, rect);
    
    
    UIImage *clip = [UIImage imageWithCGImage:cgImg];
    
    CGImageRelease(cgImg);
    
    return clip;

}


#pragma mark - 布局按钮
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 遍历按钮并布局
    [_rotateWheel .subviews enumerateObjectsUsingBlock:^(__kindof OALuckyBtn * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 确定大小 根据图片确定
        obj.bounds = CGRectMake(0, 0, 68, 143);
        
        // 调整位置
        obj.center = _rotateWheel.center;
        
        // 修改锚点
        obj.layer.anchorPoint = CGPointMake(0.5, 1);
        
        // 散开
        obj.transform = CGAffineTransformRotate(obj.transform, (M_PI * 2 / 12) * idx);
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
