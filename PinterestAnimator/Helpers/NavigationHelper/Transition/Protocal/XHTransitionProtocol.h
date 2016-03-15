//
//  XHTransitionProtocol.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-17.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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