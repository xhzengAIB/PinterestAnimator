//
//  UIView+XHViewFrame.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
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
