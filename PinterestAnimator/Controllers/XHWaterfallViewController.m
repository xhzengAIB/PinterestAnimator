//
//  XHWaterfallViewController.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHWaterfallViewController.h"
#import "XHNavigationControllerDelegate.h"

#import "XHHorizontalPageViewController.h"

#import "XHPinterest.h"

@interface XHWaterfallViewController ()

@property (nonatomic, strong) XHNavigationControllerDelegate *navigationControllerDelegate;

@end

@implementation XHWaterfallViewController

#pragma mark - Propertys

- (XHNavigationControllerDelegate *)navigationControllerDelegate {
    return _navigationControllerDelegate;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Pinterest";
    
    if (!_navigationControllerDelegate) {
        _navigationControllerDelegate = [[XHNavigationControllerDelegate alloc] initWithNavigationController:self.navigationController
                                                                                  panGestureRecognizerEnable:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - XHTransitionProtocol

- (void)viewWillAppearWithPageIndex:(NSInteger)pageIndex {
    UICollectionViewScrollPosition position = UICollectionViewScrollPositionCenteredVertically & UICollectionViewScrollPositionCenteredHorizontally;
    XHPinterest *pinterest = self.items[pageIndex];
    CGFloat imageHeight = pinterest.image.size.height * KXHGridItemWidth / pinterest.image.size.width;
    if (imageHeight > 400) {
        position = UICollectionViewScrollPositionTop;
    }
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:pageIndex inSection:0];
    [self.collectionView setCurrentIndexPath:currentIndexPath];
    if (pageIndex < 2) {
        [self.collectionView setContentOffset:CGPointZero animated:NO];
    } else {
        [self.collectionView scrollToItemAtIndexPath:currentIndexPath atScrollPosition:position animated:NO];
    }
}

- (UICollectionView *)transitionCollectionView {
    return self.collectionView;
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    XHHorizontalPageViewController *horizontalPageViewController = [[XHHorizontalPageViewController alloc] initWithCollectionViewFlowLayout:[self pageViewControllerLayout] currentIndexPath:indexPath];
    
    horizontalPageViewController.items = self.items;
    
    [collectionView setCurrentIndexPath:indexPath];
    
    [self.navigationController pushViewController:horizontalPageViewController animated:YES];
}

- (UICollectionViewFlowLayout *)pageViewControllerLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGSize itemSize = self.navigationController.navigationBarHidden ? (CGSizeMake(kXHScreenWidth, CGRectGetHeight(kXHScreen) + 20)) : (CGSizeMake(kXHScreenWidth, CGRectGetHeight(kXHScreen) - 64));
    flowLayout.itemSize = itemSize;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return flowLayout;
}

@end
