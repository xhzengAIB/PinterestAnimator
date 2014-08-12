//
//  XHHorizontalPageViewController.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHHorizontalPageViewController.h"

#import "XHHorizontalPageViewCell.h"

#import "UICollectionView+XHIndexPath.h"

#define kXHHorizontalPageViewCellIdentify @"XHHorizontalPageViewCellIdentify"

@interface XHHorizontalPageViewController ()

@property (nonatomic, assign) CGPoint pullOffset;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewFlowLayout;

@end

@implementation XHHorizontalPageViewController

#pragma mark - Propertys

- (UICollectionView *)collectionView {
    if (!_collectionView){
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.collectionViewFlowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[XHHorizontalPageViewCell class] forCellWithReuseIdentifier:kXHHorizontalPageViewCellIdentify];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[XHHorizontalPageViewCell class] forCellWithReuseIdentifier:kXHHorizontalPageViewCellIdentify];
        [_collectionView setCurrentIndexPath:self.indexPath];
        
        [_collectionView performBatchUpdates:^{
            [_collectionView reloadData];
        } completion:^(BOOL finished) {
            if (finished) {
                [self.collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
            }
        }];
    }
    return _collectionView;
}

#pragma mark - Life Cycle

- (instancetype)initWithCollectionViewFlowLayout:(UICollectionViewFlowLayout *)collectionViewFlowLayout currentIndexPath:(NSIndexPath *)indexPath {
    self = [super init];
    if (self) {
        self.pullOffset = CGPointZero;
        self.collectionViewFlowLayout = collectionViewFlowLayout;
        self.indexPath = indexPath;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XHTransitionProtocol

- (CGPoint)pageViewCellScrollViewContentOffset {
    return self.pullOffset;
}

- (UICollectionView *)transitionCollectionView {
    return self.collectionView;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XHHorizontalPageViewCell *collectionCell = (XHHorizontalPageViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kXHHorizontalPageViewCellIdentify forIndexPath:indexPath];
    collectionCell.image = [UIImage imageNamed:self.items[indexPath.row]];
    collectionCell.didSelectedSubItemAction = ^(NSString *imageName) {
        
    };
    collectionCell.pullDownAction = ^(CGPoint offset) {
        self.pullOffset = offset;
        [self.navigationController popToRootViewControllerAnimated:YES];
    };
    [collectionCell setNeedsDisplay];
    return collectionCell;
}

@end
