//
//  XHPinterestPopTransition.m
//  PinterestExample
//
//  Created by dw_iOS on 14-8-14.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHPinterestPopTransition.h"

@implementation XHPinterestPopTransition

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController <XHTransitionProtocol> *fromViewController = (UIViewController <XHTransitionProtocol> * )([transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]);
    
    UIViewController <XHTransitionProtocol> *toViewController = (UIViewController <XHTransitionProtocol> * )([transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]);
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *toView = toViewController.view;
    
    [containerView addSubview:toView];
    toView.hidden = YES;
    
    UICollectionView *waterFallView = [toViewController transitionCollectionView];
    
    UICollectionView *pageView = [fromViewController transitionCollectionView];
    
    
    [waterFallView layoutIfNeeded];
    
    NSIndexPath *indexPath = pageView.currentIndexPath;
    
    UIView <XHTansitionWaterfallGridViewProtocol> *gridView = (UIView <XHTansitionWaterfallGridViewProtocol> *)([waterFallView cellForItemAtIndexPath:indexPath]);
    
    [waterFallView performBatchUpdates:^{
        
    } completion:NULL];
    
    
    CGPoint leftUpperPoint = [gridView convertPoint:CGPointZero toView:nil];
    
    UIView *snapShot = [gridView snapShotForTransition];
    
    CGFloat animationScale = [self animationScale];
    
    snapShot.transform = CGAffineTransformMakeScale(animationScale, animationScale);
    
    CGFloat pullOffsetY = [(UIViewController <XHHorizontalPageViewControllerProtocol> *)fromViewController pageViewCellScrollViewContentOffset].y;
    
    CGFloat offsetY = fromViewController.navigationController.navigationBarHidden ? 0.0 : 64;
    [snapShot setOrigin:CGPointMake(kXHLargeGridItemPadding, -pullOffsetY+offsetY + kXHLargeGridItemPadding)];
    
    [containerView addSubview:snapShot];
    
    
    toView.hidden = NO;
    
    toView.alpha = 0.0;
    toView.transform = snapShot.transform;
    
    toView.frame = CGRectMake(-(leftUpperPoint.x * animationScale), -((leftUpperPoint.y-offsetY) * animationScale + pullOffsetY+offsetY),
                              toView.frame.size.width, toView.frame.size.height);
    
    
    UIView *whiteViewContainer = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    whiteViewContainer.backgroundColor = [UIColor whiteColor];
    
    [containerView addSubview:whiteViewContainer];
    [containerView insertSubview:whiteViewContainer belowSubview:toView];
    
    [UIView animateWithDuration:[self animationDuration] animations:^{
        snapShot.transform = CGAffineTransformIdentity;
        [snapShot setOrigin:leftUpperPoint];
        
        toView.transform = CGAffineTransformIdentity;
        [toView setOrigin:CGPointZero];
        toView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        if (finished) {
            [snapShot removeFromSuperview];
            [whiteViewContainer removeFromSuperview];
            [transitionContext completeTransition:!self.canceled];
        }
        
    }];
}

@end
