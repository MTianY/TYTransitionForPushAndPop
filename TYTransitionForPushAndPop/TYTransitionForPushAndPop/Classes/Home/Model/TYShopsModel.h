//
//  TYShopsModel.h
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYShopsModel : NSObject

@property (nonatomic, assign) NSInteger w;
@property (nonatomic, assign) NSInteger h;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;

+ (instancetype)modelForDict:(NSDictionary *)dict;

@end
