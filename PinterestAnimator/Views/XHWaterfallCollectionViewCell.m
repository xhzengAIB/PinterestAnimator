//
//  XHWaterfallCollectionViewCell.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
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
