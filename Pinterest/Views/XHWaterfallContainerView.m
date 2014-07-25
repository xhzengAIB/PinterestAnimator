//
//  XHWaterfallContainerView.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-24.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHWaterfallContainerView.h"
#import "XHUIKitMacro.h"

#define kXHPhotoPadding 4

@interface XHWaterfallContainerView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation XHWaterfallContainerView

#pragma mark - Propertys

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.image = XH_STRETCH_IMAGE([UIImage imageNamed:@"NewsBackgroundImage"], UIEdgeInsetsMake(7, 7, 7, 7));
    }
    return _backgroundImageView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.backgroundImageView.frame) + kXHPhotoPadding, CGRectGetMinY(self.backgroundImageView.frame) + kXHPhotoPadding, CGRectGetWidth(self.backgroundImageView.bounds) - kXHPhotoPadding * 2, CGRectGetHeight(self.backgroundImageView.bounds) - kXHPhotoPadding * 2)];
        _imageView.backgroundColor = [UIColor grayColor];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addSubview:self.backgroundImageView];
        [self sendSubviewToBack:self.backgroundImageView];

        [self addSubview:self.imageView];
    }
    return self;
}

@end
