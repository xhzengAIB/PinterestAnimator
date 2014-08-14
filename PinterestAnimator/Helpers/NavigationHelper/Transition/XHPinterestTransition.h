//
//  XHPinterestTransition.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-14.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XHTransitionProtocol.h"

#import "UICollectionView+XHIndexPath.h"
#import "UIView+XHViewFrame.h"
#import "XHUIKitMacro.h"

@interface XHPinterestTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  缩放参数
 */
@property (nonatomic, assign) CGFloat animationScale;

/**
 *  动画参数
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *  用于可交互性的控制数据，不过有个bug，后续找方案解决
 */
@property (nonatomic, assign) BOOL canceled;

@end
