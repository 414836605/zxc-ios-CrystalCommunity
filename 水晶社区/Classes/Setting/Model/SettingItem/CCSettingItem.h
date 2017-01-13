//
//  CCSettingItem.h
//  ItheimaLottery
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CCSettingItemOption)();




@interface CCSettingItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

// 保存一段功能，在恰当的时候调用
@property (nonatomic, copy) CCSettingItemOption option;


+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
