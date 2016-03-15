//
//  UIView+XHViewFrame.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "UIView+XHViewFrame.h"

@implementation UIView (XHViewFrame)

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)setTransFrame:(CGRect)frame {
    frame.size.width -= frame.origin.x;
    frame.size.height -= frame.origin.y;
}

@end
