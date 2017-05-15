//
//  TYHomeViewController.h
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYHomeViewController : UICollectionViewController

/**
 总列数 (默认 2 列)
 */
@property (nonatomic, assign) CGFloat colCount;

/**
 行间距 (默认 10)
 */
@property (nonatomic, assign) CGFloat rowSpace;

/**
 列间距 (默认 10)
 */
@property (nonatomic, assign) CGFloat colSpace;

@property (nonatomic, assign) CGRect finalCellRect;

@end
