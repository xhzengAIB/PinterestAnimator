//
//  XHNavigationController.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
