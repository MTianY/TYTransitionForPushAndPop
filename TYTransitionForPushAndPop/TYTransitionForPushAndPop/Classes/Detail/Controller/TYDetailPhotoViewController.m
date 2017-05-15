//
//  TYDetailPhotoViewController.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYDetailPhotoViewController.h"
#import <UIImageView+WebCache.h>

@interface TYDetailPhotoViewController ()

@end

@implementation TYDetailPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:self.img] placeholderImage:nil];
}

#pragma mark - pop

- (IBAction)popButtonClick:(id)sender {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}



@end
