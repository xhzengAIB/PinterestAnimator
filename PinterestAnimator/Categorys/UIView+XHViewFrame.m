//
//  UIView+XHViewFrame.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
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
