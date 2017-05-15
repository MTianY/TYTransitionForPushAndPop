//
//  TYTransitionAnimateForPush.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

/*
 * 自定义 push 转场动画
 */

#import "TYTransitionAnimateForPush.h"
#import "TYHomeViewController.h"
#import "TYDetailPhotoViewController.h"
#import "TYShopsCell.h"

@implementation TYTransitionAnimateForPush

#pragma mark - <UIViewControllerAnimatedTransitioning>

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 1.拿到过度动画前后的两个控制器,fromVc 和 toVc.以及容器的 view
    TYHomeViewController *fromVc_homeVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TYDetailPhotoViewController *toVc_detailPhotoVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 2.将 fromVc 上我们要点击的图片截图.
    // 点击 cell 对应的 indexPath
    NSIndexPath *indexPath = [[fromVc_homeVc.collectionView indexPathsForSelectedItems] firstObject];
    // 拿到点击的 cell
    TYShopsCell *cell = (TYShopsCell *)[fromVc_homeVc.collectionView cellForItemAtIndexPath:indexPath];
    // 对图片截图
    UIView *screenShotView = [cell.shopImageView snapshotViewAfterScreenUpdates:NO];
    screenShotView.frame = fromVc_homeVc.finalCellRect = [containerView convertRect:cell.shopImageView.frame fromView:cell];
    cell.shopImageView.hidden = YES;
    
    /*
     * snapshotViewAfterScreenUpdates:
     * 根据当前视图的内容返回快照视图.
     * 一般传 "NO" 来捕获当前状态下的屏幕
     */
    
    /*
     * convertRect: fromView:
     * 将矩形从另一个坐标系到当前坐标系的转换
     * 
     * Rect : 在视图的局部坐标系(边界)中指定的矩形
     *
     * view: 坐标系中的矩形, 如果 view 为 nil. 那么该方法将转换为窗口的基坐标. 否则, view 和 接收方必须同属一个 UIWindow 对象
     */
    
    /*
     * finalFrameForViewController:
     * 返回转换结束时对应视图的大小
     */
    
    // 3.toView 的 view 的 frame 及 透明度
    toVc_detailPhotoVc.view.frame = [transitionContext finalFrameForViewController:toVc_detailPhotoVc];
    toVc_detailPhotoVc.view.alpha = 0;
    
    // 4.添加到容器的 view 上
    [containerView addSubview:toVc_detailPhotoVc.view];
    [containerView addSubview:screenShotView];
    
    // 5.执行动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        screenShotView.frame = toVc_detailPhotoVc.shopImageView.frame;
        toVc_detailPhotoVc.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [screenShotView removeFromSuperview];
        cell.shopImageView.hidden = NO;
        [transitionContext completeTransition:YES];
    }];
    
}

@end
