//
//  XHUIKitMacro.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-14.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
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
