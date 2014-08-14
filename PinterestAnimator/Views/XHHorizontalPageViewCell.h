//
//  XHHorizontalPageViewCell.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-23.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHPinterest;

// Block
typedef void(^XHPullDownAction)(CGPoint offset);
typedef void(^XHDidSelectedSubItemAction)(XHPinterest *currentPinterest);



@interface XHHorizontalPageViewCell : UICollectionViewCell

/**
 *  需要展示和绑定的数据Model
 */
@property (nonatomic, strong) XHPinterest *pinterest;

/**
 *  详情页面，下拉scrollView到一定程度的回调
 */
@property (nonatomic, copy) XHPullDownAction pullDownAction;

/**
 *  点击详情页面的其他item的回调
 */
@property (nonatomic, copy) XHDidSelectedSubItemAction didSelectedSubItemAction;

@end
