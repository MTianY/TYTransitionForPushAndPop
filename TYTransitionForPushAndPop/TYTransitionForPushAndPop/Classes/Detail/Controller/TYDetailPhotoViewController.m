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

@end

@implementation TYDetailPhotoViewController

#pragma mark - view 的生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:self.img] placeholderImage:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.delegate = self;
}

#pragma mark - pop

- (IBAction)popButtonClick:(id)sender {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
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
