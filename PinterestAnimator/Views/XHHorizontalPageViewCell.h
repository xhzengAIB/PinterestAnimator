//
//  XHHorizontalPageViewCell.h
//  PinterestExample
//
//  Created by dw_iOS on 14-7-23.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PullDownAction)(CGPoint offset);

typedef void(^DidSelectedSubItemAction)(NSString *imageName);

@interface XHHorizontalPageViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) PullDownAction pullDownAction;

@property (nonatomic, copy) DidSelectedSubItemAction didSelectedSubItemAction;

@end
