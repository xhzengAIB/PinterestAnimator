//
//  XHNavigationController.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHNavigationController.h"
#import "XHTransitionProtocol.h"
#import "UICollectionView+XHIndexPath.h"

@interface XHNavigationController ()

@end

@implementation XHNavigationController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Pop Helper Method

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    NSInteger childrenCount = self.viewControllers.count;
    
    UIViewController <XHTransitionProtocol, XHWaterFallViewControllerProtocol> *toViewController = (UIViewController <XHTransitionProtocol, XHWaterFallViewControllerProtocol> *)self.viewControllers[childrenCount - 2];
    UICollectionView *toView = [toViewController transitionCollectionView];
    
    UIViewController *popedViewController = self.viewControllers[childrenCount - 1];
    UICollectionView *popView  = [popedViewController valueForKey:@"collectionView"];
    NSIndexPath *indexPath = [popView currentIndexPath];
    [toViewController viewWillAppearWithPageIndex:indexPath.row];
    [toView setCurrentIndexPath:[popView currentIndexPath]];
    
    return [super popViewControllerAnimated:animated];
}

@end
