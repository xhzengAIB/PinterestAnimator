//
//  UIView+XHViewFrame.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XHViewFrame)

/**
 *  设置View的位置
 *
 *  @param origin 目标位置
 */
- (void)setOrigin:(CGPoint)origin;

- (void)setTransFrame:(CGRect)frame;

@end
