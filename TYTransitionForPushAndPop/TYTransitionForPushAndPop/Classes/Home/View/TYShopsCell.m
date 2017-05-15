//
//  TYShopsCell.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYShopsCell.h"
#import "TYShopsModel.h"
#import <UIImageView+WebCache.h>

@implementation TYShopsCell

- (void)setModel:(TYShopsModel *)model {
    _model = model;
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:nil];
    self.shopPriceLabel.text = model.price;
}

@end
