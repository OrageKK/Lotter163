//
//  OAGuideController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/14.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAGuideController.h"
#import "OAGuideCell.h"
@interface OAGuideController ()


/**
 *  广告
 */
@property (weak, nonatomic) UIImageView *adImgView;
/**
 *  大图
 */
@property (weak, nonatomic) UIImageView *bigImgView;
/**
 *  小图
 */
@property (weak, nonatomic) UIImageView *smallImgView;

@end

@implementation OAGuideController

static NSString * const reuseIdentifier = @"Cell";


- (instancetype)init {
    // 定义布局
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置大小
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    
    // 水平滚动
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置间距
    flow.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flow];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.collectionView.backgroundColor = OARandomColor;
    
    // 分页效果
    self.collectionView.pagingEnabled = YES;
    
    // 去掉底部的线
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    
    
    // 添加控件
    [self setupUI];
    
    [self.collectionView registerClass:[OAGuideCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)setupUI {
    
    // 波浪线
    UIImageView *wavyLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    wavyLine.x = -200;
    [self.collectionView addSubview:wavyLine];
    
    
    // 广告
    UIImageView *adImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:adImgV];
    _adImgView = adImgV;
    
    // 大图片
    UIImageView *largeImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:largeImgV];
    
//    [largeImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.collectionView);
//        make.centerY.equalTo(self.collectionView).mas_offset(100);
//    }];
    
    largeImgV.y = self.collectionView.height * 0.7;
    _bigImgView = largeImgV;
    
    // 小图片
    UIImageView *smallImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:smallImgV];
//    [smallImgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.collectionView);
//        make.centerY.equalTo(self.collectionView).mas_offset(150);
//    }];
    
    smallImgV.y = self.collectionView.height * 0.8;
    _smallImgView = smallImgV;
}

#pragma mark - 降速方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 计算偏移量
//    CGFloat offsetX = self.collectionView.contentOffset.x;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 确定滚动方向
    // 如果是imgView.x > offsetX -> 向右
    if (self.adImgView.x > offsetX) {
        // 向右 需要先偏离一个屏幕的宽度
        self.adImgView.x = self.adImgView.x - 2 * scrollView.width;
        
    } else {
        // 向左
        self.adImgView.x = self.adImgView.x + 2 * scrollView.width;
    }
    
    
    
    
    // 拿到索引
    NSInteger idx = offsetX / scrollView.width;
    
    // 更换图片
    // 拼接图片名称
    NSString *adImgStr = [NSString stringWithFormat:@"guide%@",@(idx + 1)];
    NSString *largeImgStr = [NSString stringWithFormat:@"guideLargeText%@",@(idx + 1)];
    NSString *smallImgStr = [NSString stringWithFormat:@"guideSmallText%@",@(idx + 1)];
    
    self.adImgView.image = [UIImage imageNamed:adImgStr];
    self.bigImgView.image = [UIImage imageNamed:largeImgStr];
    self.smallImgView.image = [UIImage imageNamed:smallImgStr];
    
    
    [UIView animateWithDuration:0.5 animations:^{
  
#pragma mark - 如果创建用frame修改用frame
        self.adImgView.x = offsetX;
        self.bigImgView.x = offsetX;
        self.smallImgView.x = offsetX;
        
        
#pragma mark - 如果创建用约束自动布局修改用transform
//        self.adImgView.transform = CGAffineTransformMakeTranslation(offsetX, 0);
//        self.bigImgView.transform = CGAffineTransformMakeTranslation(offsetX, 0);
//        self.smallImgView.transform = CGAffineTransformMakeTranslation(offsetX, 0);
    }];
    
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    OAGuideCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // 设置数据 传递索引,cell内部设置数据
    
    [cell getIndexPath:indexPath.item];
    
    
    return cell;
}

@end
