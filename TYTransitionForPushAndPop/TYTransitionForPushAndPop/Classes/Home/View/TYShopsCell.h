//
//  TYShopsCell.h
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYShopsModel;
@interface TYShopsCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLabel;

@property (strong, nonatomic) TYShopsModel *model;

@end
