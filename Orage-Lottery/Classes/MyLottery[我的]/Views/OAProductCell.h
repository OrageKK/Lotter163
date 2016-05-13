//
//  OAProductCell.h
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/13.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OAProduct;
@interface OAProductCell : UICollectionViewCell

/**
 *  cell显示的数据模型
 */
@property (strong, nonatomic) OAProduct *productModel;
@end
