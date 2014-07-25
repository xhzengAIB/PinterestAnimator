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
- (UICollectionView *)transitionCollectionView;

@end

@protocol XHTansitionWaterfallGridViewProtocol <NSObject>

- (UIView *)snapShotForTransition;

@end


@protocol XHWaterFallViewControllerProtocol <NSObject>

- (void)viewWillAppearWithPageIndex:(NSInteger)pageIndex;

@end

@protocol XHHorizontalPageViewControllerProtocol <NSObject>

- (CGPoint)pageViewCellScrollViewContentOffset;

@end