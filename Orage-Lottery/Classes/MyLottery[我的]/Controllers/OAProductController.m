//
//  OAProductController.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/13.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAProductController.h"
#import "OAProductCell.h"
#import "OAProduct.h"
@interface OAProductController ()

/**
 *  存放所有产品模型的数组
 */
@property (nonatomic, strong) NSArray <OAProduct *> *productsArr;

@end

@implementation OAProductController

// 重用标识
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[OAProductCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    
}

- (instancetype)init {
    
    // MARK: - 定义布局形式
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置大小
    flow.itemSize = CGSizeMake(80, 80);
    
    // 设置边距
    flow.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    // 设置间距
    flow.minimumLineSpacing = 20;
    flow.minimumInteritemSpacing = 0;
    
    
    
    return [super initWithCollectionViewLayout:flow];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 获取到选中的数据
    OAProduct *selPro = self.productsArr[indexPath.item];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.productsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建cell
    OAProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //设置数据
    cell.productModel = self.productsArr[indexPath.item];
    
    
    // Configure the cell
    
    return cell;
}


#pragma mark - 懒加载
- (NSArray<OAProduct *> *)productsArr {
    if (!_productsArr) {
        
        // 加载文件路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        
        // 将文件转为二进制数据
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        //通过序列化转为OC内容(数组或字典)
        NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 字典转模型
        NSMutableArray *tempArrM = [NSMutableArray array];
        
        [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            OAProduct *productModel = [OAProduct productWithDict:obj];
            
            [tempArrM addObject:productModel];
        }];
        
        
        _productsArr = tempArrM.copy;
        
        
    }
    
    return _productsArr;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
