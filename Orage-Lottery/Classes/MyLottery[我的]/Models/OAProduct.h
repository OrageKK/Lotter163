//
//  OAProduct.h
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/13.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAProduct : NSObject
/**
 "title": "网易公开课",
 "stitle":"随时随地上名校公开课",
 "id": "com.netease.videoHD",
 "url": "http://itunes.apple.com/app/id415424368?mt=8",
 "icon": "open",
 "customUrl": "ntesopen"
 */

/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  子标题
 */
@property (nonatomic, copy) NSString *stitle;

/**
 *  ID
 */
@property (nonatomic, copy) NSString *ID;

/**
 *  在AppStore的连接
 */
@property (nonatomic, copy) NSString *url;

/**
 *  头像
 */
@property (nonatomic, copy) NSString *icon;

/**
 *  自定义链接
 */
@property (nonatomic, copy) NSString *customUrl;

/**
 *  类方法
 */
+ (instancetype)productWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
