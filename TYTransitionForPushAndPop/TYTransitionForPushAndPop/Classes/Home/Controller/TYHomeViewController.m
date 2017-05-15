//
//  TYHomeViewController.m
//  TYTransitionForPushAndPop
//
//  Created by 马天野 on 2017/5/15.
//  Copyright © 2017年 MTY. All rights reserved.
//

#import "TYHomeViewController.h"
#import "TYShopsModel.h"
#import "TYShopsCell.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TYHomeViewController ()

@property (nonatomic, strong) NSMutableArray *shopsArrayM;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation TYHomeViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 懒加载

- (NSMutableArray *)shopsArrayM {
    if (nil == _shopsArrayM) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1.plist" ofType:nil]];
        NSMutableArray *tempArrayM = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            TYShopsModel *shopModel = [TYShopsModel modelForDict:dict];
            [tempArrayM addObject:shopModel];
        }
        _shopsArrayM = tempArrayM;
    }
    return _shopsArrayM;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (nil == _flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = self.rowSpace;
        _flowLayout.minimumInteritemSpacing = self.colSpace;
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat itemW = (kScreenWidth - (self.colCount + 1) * self.colSpace) / self.colCount;
//        CGFloat itemW = 200;
        CGFloat itemH = itemW;
        _flowLayout.itemSize = CGSizeMake(itemW, itemH);
    }
    return _flowLayout;
}

#pragma mark - 初始化操作

- (instancetype)init {
    if (self = [super init]) {
        _colCount = 2;
        _colSpace = 10;
        _rowSpace = 10;
    }
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:self.flowLayout];
    self.collectionView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    [self.collectionView registerNib:[UINib nibWithNibName:@"TYShopsCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    return self;
}

#pragma mark - view 的生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.shopsArrayM);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shopsArrayM.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TYShopsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.shopsArrayM[indexPath.row];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>


@end
