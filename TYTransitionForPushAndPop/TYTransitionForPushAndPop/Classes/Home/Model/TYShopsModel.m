//
//  TYShopsModel.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYShopsModel.h"

@implementation TYShopsModel

+ (instancetype)modelForDict:(NSDictionary *)dict {
    TYShopsModel *model = [[TYShopsModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
