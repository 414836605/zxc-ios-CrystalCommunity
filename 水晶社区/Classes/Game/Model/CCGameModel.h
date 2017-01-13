//
//  CCGameModel.h
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCGameModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *describe;
@property (nonatomic, strong) NSString *image;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)gameWithDict:(NSDictionary *)dict;
+(NSMutableArray *)games;

@end
