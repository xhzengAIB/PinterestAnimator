//
//  UICollectionView+XHIndexPath.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (XHIndexPath)

/**
 *  设置某一indexPath，用于记录
 *
 *  @param indexPath 目标indexPath
 */
- (void)setCurrentIndexPath:(NSIndexPath *)indexPath;

/**
 *  获取上述方法某一indexPath，把记录起来的拿回来用
 *
 *  @return 返回记录的indexPath
 */
- (NSIndexPath *)currentIndexPath;

@end
