//
//  XHNavigationControllerDelegate.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHNavigationControllerDelegate.h"
#import "XHPinterestTransition.h"

@implementation XHNavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    XHPinterestTransition *pinterestTransition = [[XHPinterestTransition alloc] init];
    pinterestTransition.operation = operation;
    return pinterestTransition;
}

@end
