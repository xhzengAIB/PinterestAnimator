//
//  XHPinterestPushTransition.m
//  PinterestExample
//
//  Created by dw_iOS on 14-8-14.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHPinterestPushTransition.h"

@implementation XHPinterestPushTransition

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController <XHTransitionProtocol> *fromViewController = (UIViewController <XHTransitionProtocol> * )([transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]);
    
    UIViewController <XHTransitionProtocol> *toViewController = (UIViewController <XHTransitionProtocol> * )([transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]);
    
    UIView *containerView = [transitionContext containerView];

    UIView *fromView = fromViewController.view;
    toViewController.view.frame = fromView.frame;
    UIView *toView = toViewController.view;
    
    UICollectionView *waterFallView = [fromViewController transitionCollectionView];
    
    UICollectionView *pageView = [toViewController transitionCollectionView];
    
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    NSIndexPath *indexPath = [waterFallView currentIndexPath];
    
    UIView <XHTansitionWaterfallGridViewProtocol> *gridView = (UIView <XHTansitionWaterfallGridViewProtocol> *)([waterFallView cellForItemAtIndexPath:indexPath]);
    
    CGPoint leftUpperPoint = [gridView convertPoint:CGPointZero toView:nil];
    
    pageView.hidden = YES;
    
    [pageView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:NO];
    
    CGFloat offsetY  = fromViewController.navigationController.navigationBarHidden ? 0.0 : 64;
    
    
    CGFloat offsetStatuBar = fromViewController.navigationController.navigationBarHidden ? 0.0 : 64;
    
    UIView *snapShot = [gridView snapShotForTransition];
    [containerView addSubview:snapShot];
    [snapShot setOrigin:leftUpperPoint];
    
    CGFloat animationScale = [self animationScale];
    [UIView animateWithDuration:[self animationDuration] animations:^{
        
        snapShot.transform = CGAffineTransformMakeScale(animationScale,
                                                        animationScale);
        
        [snapShot setOrigin:CGPointMake(kXHLargeGridItemPadding, offsetY + kXHLargeGridItemPadding)];
        
        fromView.alpha = 0;
        fromView.transform = snapShot.transform;
        fromView.frame = CGRectMake(-(leftUpperPoint.x)*animationScale,
                                    -(leftUpperPoint.y-offsetStatuBar)*animationScale+offsetStatuBar,
                                    fromView.frame.size.width,
                                    fromView.frame.size.height);
        
    } completion:^(BOOL finished) {
        if (finished) {
            [snapShot removeFromSuperview];
            pageView.hidden = NO;
            fromView.transform = CGAffineTransformIdentity;
            [transitionContext completeTransition:!self.canceled];
        }
    }];
}


@end
