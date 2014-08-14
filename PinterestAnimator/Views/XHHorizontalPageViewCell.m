//
//  XHHorizontalPageViewCell.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-23.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHHorizontalPageViewCell.h"

#import "XHWaterfallCollectionViewCell.h"

#import "CHTCollectionViewWaterfallLayout.h"

#import "XHUIKitMacro.h"
#import "XHWaterfallContainerView.h"

#import "XHPinterest.h"

#define kXHContainerViewIdentifier @"XHContainerViewIdentifier"

@interface XHContainerView : UICollectionReusableView

@property (nonatomic, strong) XHWaterfallContainerView *waterfallContainerView;

@end

@implementation XHContainerView

#pragma mark - Propertys

- (XHWaterfallContainerView *)waterfallContainerView {
    if (!_waterfallContainerView) {
        _waterfallContainerView = [[XHWaterfallContainerView alloc] initWithFrame:CGRectMake(kXHLargeGridItemPadding, kXHLargeGridItemPadding, CGRectGetWidth(self.bounds) - kXHLargeGridItemPadding * 2, CGRectGetHeight(self.bounds) - kXHLargeGridItemPadding * 2) cornerRadii:6 * ((CGRectGetWidth(kXHScreen) - kXHLargeGridItemPadding * 2) / KXHGridItemWidth)];
    }
    return _waterfallContainerView;
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.waterfallContainerView];
    }
    return self;
}

@end

@interface XHHorizontalPageViewCell () <CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CHTCollectionViewWaterfallLayout *layout;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation XHHorizontalPageViewCell

#pragma mark - Propertys

- (void)setPinterest:(XHPinterest *)pinterest {
    _pinterest = pinterest;
    CGFloat imageHeight = pinterest.image.size.height * kXHScreenWidth / pinterest.image.size.width;
    self.layout.headerHeight = imageHeight;
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
        for (NSInteger i = 1; i < XH_CELL_COUNT; i++) {
            XHPinterest *pinterest = [[XHPinterest alloc] initWithImageName:[NSString stringWithFormat:@"l%ld.jpg", (long)i]
                                                                      title:[NSString stringWithFormat:@"Title : %ld", (long)i]];
            [_items addObject:pinterest];
        }
    }
    return _items;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        _layout.minimumColumnSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:self.layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[XHWaterfallCollectionViewCell class]
            forCellWithReuseIdentifier:XH_CELL_IDENTIFIER];
        
        [_collectionView registerClass:[XHContainerView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:kXHContainerViewIdentifier];
    }
    return _collectionView;
}

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        [self addSubview:self.collectionView];
    }
    return self;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (-scrollView.contentOffset.y > 64) {
        if (self.pullDownAction) {
            self.pullDownAction(scrollView.contentOffset);
        }
    }
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XHWaterfallCollectionViewCell *cell =
    (XHWaterfallCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:XH_CELL_IDENTIFIER
                                                                     forIndexPath:indexPath];
    cell.pinterest = self.items[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:kXHContainerViewIdentifier
                                                                 forIndexPath:indexPath];
        ((XHContainerView *)reusableView).waterfallContainerView.displayPinterest = self.pinterest;
    }
    
    return reusableView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectedSubItemAction) {
        self.didSelectedSubItemAction(self.items[indexPath.row]);
    }
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XHPinterest *currentPinterest = self.items[indexPath.row];
    CGFloat imageHeight = currentPinterest.image.size.height * KXHGridItemWidth / currentPinterest.image.size.width;
    return CGSizeMake(KXHGridItemWidth, imageHeight);
}

@end
