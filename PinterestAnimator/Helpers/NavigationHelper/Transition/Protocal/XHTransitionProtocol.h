//
//  XHTransitionProtocol.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-17.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XHTransitionProtocol <NSObject>

@optional
/**
 *  获取需要变换的CollectionView
 *
 *  @return 目标变换CollectionView
 */
- (UICollectionView *)transitionCollectionView;

@end

@protocol XHTansitionWaterfallGridViewProtocol <NSObject>

/**
 *  获取需要缩放的快照View
 *
 *  @return 目标快照
 */
- (UIView *)snapShotForTransition;

@end


@protocol XHWaterFallViewControllerProtocol <NSObject>

/**
 *  当详情页面进行左右滑动之后，需要回调告诉父视图控制器
 *
 *  @param pageIndex 某一页码
 */
- (void)viewWillAppearWithPageIndex:(NSInteger)pageIndex;

@end

@protocol XHHorizontalPageViewControllerProtocol <NSObject>

/**
 *  获取横向滚动ScrollView的ContentOffset
 *
 *  @return 目标ContentOffset
 */
- (CGPoint)pageViewCellScrollViewContentOffset;

@end