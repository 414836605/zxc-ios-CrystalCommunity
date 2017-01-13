//
//  CCGameCellView.m
//  水晶社区
//
//  Created by mac on 16-8-23.
//  Copyright (c) 2016年 crystal. All rights reserved.
//

#import "CCGameCellView.h"
#import "CCGameModel.h"

@interface CCGameCellView()
@property (weak, nonatomic) IBOutlet UILabel *cnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cdescribeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cimage;

@end

@implementation CCGameCellView

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"Cell";
    CCGameCellView *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CCGameCell" owner:nil options:nil] lastObject];
    }

    return cell;
}

- (void)setGame:(CCGameModel *)game{
    _game = game;
    
    self.cimage.image = [UIImage imageNamed:game.image];
    self.cnameLabel.text = game.name;
    self.cdescribeLabel.text = game.describe;
    
}
@end
