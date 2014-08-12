//
//  XHPinterestTransition.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-14.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHPinterestTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *  动画参数
 */
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 *  用于标记push或者pop
 */
@property (nonatomic, assign) UINavigationControllerOperation operation;

@end
