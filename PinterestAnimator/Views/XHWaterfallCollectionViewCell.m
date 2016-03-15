//
//  XHWaterfallCollectionViewCell.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHWaterfallCollectionViewCell.h"
#import "XHWaterfallContainerView.h"

@interface XHWaterfallCollectionViewCell ()

@property (nonatomic, strong) XHWaterfallContainerView *waterfallContainerView;

@end

@implementation XHWaterfallCollectionViewCell

#pragma mark - Propertys

- (void)setPinterest:(XHPinterest *)pinterest {
    _pinterest = pinterest;
    self.waterfallContainerView.displayPinterest = pinterest;
}

- (XHWaterfallContainerView *)waterfallContainerView {
    if (!_waterfallContainerView) {
        _waterfallContainerView = [[XHWaterfallContainerView alloc] initWithFrame:self.bounds
                                   cornerRadii:6];
    }
    return _waterfallContainerView;
}

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code
        [self addSubview:self.waterfallContainerView];
    }
    return self;
}

#pragma mark - XHTansitionWaterfallGridViewProtocol

- (UIView *)snapShotForTransition {
    XHWaterfallContainerView *snapShotView = [[XHWaterfallContainerView alloc] initWithFrame:self.waterfallContainerView.frame
                                              cornerRadii:self.waterfallContainerView.cornerRadii];
    snapShotView.displayPinterest = self.waterfallContainerView.displayPinterest;
    return snapShotView;
}

@end
