//
//  CCGroupModel.m
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCGroupModel.h"

#import "CCFriendsModel.h"

@implementation CCGroupModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            [arrayM addObject:[CCFriendsModel friendWithDict:dict]];
        }
        self.friends = arrayM;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)groups{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self groupWithDict:dict]];
    }
    return arrayM;
}

@end
