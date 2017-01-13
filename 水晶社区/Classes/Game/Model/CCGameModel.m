//
//  CCGameModel.m
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCGameModel.h"

@implementation CCGameModel

+ (NSMutableArray *)games{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"game.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self gameWithDict:dict]];
    }
    return arrayM;
}

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)gameWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}



@end
