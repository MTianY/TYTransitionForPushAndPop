//
//  TYDetailPhotoViewController.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYDetailPhotoViewController.h"
#import <UIImageView+WebCache.h>
#import "TYTransitionAnimateForPop.h"

@interface TYDetailPhotoViewController () <UINavigationControllerDelegate>

/**
 百分比驱动的交互转换对象.驱动显示和消失的自定义动画
 */
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransiton;

@end

@implementation TYDetailPhotoViewController

#pragma mark - view 的生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:self.img] placeholderImage:nil];
    [self setupScreenEdgePanGes];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.delegate = self;
}

#pragma mark - 业务逻辑

// pop
- (IBAction)popButtonClick:(id)sender {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

// 添加滑动手势
- (void)setupScreenEdgePanGes {
    UIScreenEdgePanGestureRecognizer *edgePanGes = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanGesture:)];
    edgePanGes.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePanGes];
}

// 监听滑动手势操作
- (void)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePanGes {
    // 1.手指滑动距离的进度(百分比)
    CGFloat progress = [edgePanGes translationInView:self.view].x / (self.view.bounds.size.width) * 1.0;
    // 限制在 0~1 之间
    progress = MIN(1.0, MAX(0.0, progress));
    // 2.
    if (edgePanGes.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenInteractiveTransiton = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    }else if (edgePanGes.state == UIGestureRecognizerStateChanged) {
        // 手指滑动时,告知 UIPercentDrivenInteractiveTransition 对象当前的进度值
        [self.percentDrivenInteractiveTransiton updateInteractiveTransition:progress];
    }else if (edgePanGes.state == UIGestureRecognizerStateCancelled || edgePanGes.state == UIGestureRecognizerStateEnded) {
        if (progress > 0.5) {
            [self.percentDrivenInteractiveTransiton finishInteractiveTransition];
        }else {
            [self.percentDrivenInteractiveTransiton cancelInteractiveTransition];
        }
        self.percentDrivenInteractiveTransiton = nil;
    }
}

#pragma mark - <UINavigationControllerDelegate>

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if ([fromVC isKindOfClass:[TYDetailPhotoViewController class]]) {
        TYTransitionAnimateForPop *animatePop = [[TYTransitionAnimateForPop alloc] init];
        return animatePop;
    }else {
        return nil;
    }
}


@end
