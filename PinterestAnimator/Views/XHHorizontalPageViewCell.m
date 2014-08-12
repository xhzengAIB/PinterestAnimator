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

#define kXHContainerViewIdentifier @"XHContainerViewIdentifier"

@interface XHContainerView : UICollectionReusableView

@property (nonatomic, strong) XHWaterfallContainerView *waterfallContainerView;

@end

@implementation XHContainerView

#pragma - Propertys

- (XHWaterfallContainerView *)waterfallContainerView {
    if (!_waterfallContainerView){
        _waterfallContainerView = [[XHWaterfallContainerView alloc] initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.bounds) - 10, CGRectGetHeight(self.bounds) - 10)];
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

- (void)setImage:(UIImage *)image {
    _image = image;
    CGFloat imageHeight = image.size.height * kXHScreenWidth / image.size.width;
    self.layout.headerHeight = imageHeight;
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
        for (NSInteger i = 0; i < CELL_COUNT; i++) {
            [_items addObject:[NSString stringWithFormat:@"%ld.jpg", (long)i]];
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
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
        
        [_collectionView registerClass:[XHContainerView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:kXHContainerViewIdentifier];
    }
    return _collectionView;
}

#pragma mark - Life Cycl

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        [self addSubview:self.collectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (-scrollView.contentOffset.y > 64) {
        if (self.pullDownAction) {
            self.pullDownAction(scrollView.contentOffset);
        }
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XHWaterfallCollectionViewCell *cell =
    (XHWaterfallCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                     forIndexPath:indexPath];
    cell.image = [UIImage imageNamed:self.items[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:kXHContainerViewIdentifier
                                                                 forIndexPath:indexPath];
        ((XHContainerView *)reusableView).waterfallContainerView.imageView.image = self.image;
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
    UIImage *image = [UIImage imageNamed:self.items[indexPath.row]];
    CGFloat imageHeight = image.size.height * KXHGridItemWidth / image.size.width;
    return CGSizeMake(KXHGridItemWidth, imageHeight);
}

@end
