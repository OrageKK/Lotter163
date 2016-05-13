
//
//  OAProduct.m
//  Orage-Lottery
//
//  Created by 黄坤 on 16/5/13.
//  Copyright © 2016年 wzpnyg. All rights reserved.
//

#import "OAProduct.h"

@implementation OAProduct
- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
        self.url = dict[@"url"];
        
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}
@end
