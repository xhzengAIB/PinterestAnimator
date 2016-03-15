//
//  XHUIKitMacro.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-14.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

@import UIKit;
@import Foundation;


#define KXHGridItemWidth (145.0 * 1)

#define kXHLargeGridItemPadding 10

#define kXHScreen [[UIScreen mainScreen] bounds]
#define kXHScreenWidth CGRectGetWidth(kXHScreen)

#define XH_CELL_IDENTIFIER @"XHWaterfallCell"

#define XH_CELL_COUNT 10


// device verson float value
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

// iPad
#define kIsiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// image STRETCH
#define XH_STRETCH_IMAGE(image, edgeInsets) (CURRENT_SYS_VERSION < 6.0 ? [image stretchableImageWithLeftCapWidth:edgeInsets.left topCapHeight:edgeInsets.top] : [image resizableImageWithCapInsets:edgeInsets resizingMode:UIImageResizingModeStretch])
