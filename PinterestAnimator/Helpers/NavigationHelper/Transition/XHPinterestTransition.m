//
//  XHPinterestTransition.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-14.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHPinterestTransition.h"
#import "XHTransitionProtocol.h"

#import "UICollectionView+XHIndexPath.h"
#import "UIView+XHViewFrame.h"
#import "XHUIKitMacro.h"

@interface XHPinterestTransition ()

/**
 *  缩放参数
 */
@property (nonatomic, assign) CGFloat animationScale;

@end

@implementation XHPinterestTransition

- (id)init {
    self = [super init];
    if (self) {
        self.animationScale = ((CGRectGetWidth(kXHScreen) - kXHLargeGridItemPadding * 2) / KXHGridItemWidth);
        self.animationDuration = 0.3;
    }
    return self;
}

- (void)customAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController <XHTransitionProtocol> *fromViewController = (UIViewController <XHTransitionProtocol> * )([transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey]);
    
    UIViewController <XHTransitionProtocol> *toViewController = (UIViewController <XHTransitionProtocol> * )([transitionContext viewControllerForKey:UITransitionContextToViewControllerKey]);
    
    UIView *containerView = [transitionContext containerView];
    
    
    if (self.operation == UINavigationControllerOperationPop) {
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
                [transitionContext completeTransition:YES];
            }

        }];
        
    } else if (self.operation == UINavigationControllerOperationPush) {
        
        UIView *fromView = fromViewController.view;
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
                [transitionContext completeTransition:YES];
            }
        }];

    }
    
}

#pragma mark - UIViewControllerAnimatedTransitioning Delegate

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.animationDuration;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    [self customAnimateTransition:transitionContext];
}

@end
