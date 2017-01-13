//
//  CCGroupModel.h
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCGroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int online;
@property (nonatomic, strong) NSArray *friends;


@property (nonatomic, assign, getter = isOpened) bool opened;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupWithDict:(NSDictionary *)dict;
+(NSArray *)groups;


@end
