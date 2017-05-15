//
//  TYTransitionAnimateForPop.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/16.
//  Copyright © 2017年 MTY. All rights reserved.
//

/*
 * 自定义 pop 转场动画
 */

#import "TYTransitionAnimateForPop.h"
#import "TYHomeViewController.h"
#import "TYDetailPhotoViewController.h"

@implementation TYTransitionAnimateForPop

#pragma mark - <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 1.取出 fromVc 和 toVc 和 容器的 view
    TYDetailPhotoViewController *fromVc_detailVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TYHomeViewController *toVc_homeVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 2.创建一个截图
    UIView *screenShotView = [fromVc_detailVc.shopImageView snapshotViewAfterScreenUpdates:NO];
    screenShotView.frame = [containerView convertRect:fromVc_detailVc.shopImageView.frame fromView:fromVc_detailVc.shopImageView.superview];
    screenShotView.backgroundColor = [UIColor clearColor];
    fromVc_detailVc.shopImageView.hidden = YES;
    
    // 3.获取 toVc 转换后的 frame
    toVc_homeVc.view.frame = [transitionContext finalFrameForViewController:toVc_homeVc];
    
    // 4.添加到 containerView 上
    [containerView insertSubview:toVc_homeVc.view belowSubview:fromVc_detailVc.view];
    [containerView addSubview:screenShotView];
    
    // 5.执行动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        fromVc_detailVc.view.alpha = 0;
        screenShotView.frame = toVc_homeVc.finalCellRect;
    } completion:^(BOOL finished) {
        [screenShotView removeFromSuperview];
        fromVc_detailVc.shopImageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
    
}

@end
