//
//  XHWaterfallCollectionViewCell.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHTransitionProtocol.h"

@class XHPinterest;

@interface XHWaterfallCollectionViewCell : UICollectionViewCell <XHTansitionWaterfallGridViewProtocol>

/**
 *  需要展示和绑定的数据Model
 */
@property (nonatomic, strong) XHPinterest *pinterest;

@end
