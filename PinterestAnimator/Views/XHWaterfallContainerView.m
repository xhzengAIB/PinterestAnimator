//
//  XHWaterfallContainerView.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-24.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHWaterfallContainerView.h"
#import "XHUIKitMacro.h"

#import "XHPinterest.h"

#define kXHPhotoPadding 4

@interface XHWaterfallContainerView ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation XHWaterfallContainerView

#pragma mark - Propertys

- (void)setDisplayPinterest:(XHPinterest *)displayPinterest {
    _displayPinterest = displayPinterest;
    self.imageView.image = displayPinterest.image;
    self.titleLabel.text = displayPinterest.title;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_backgroundImageView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(self.cornerRadii, self.cornerRadii)];
        
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _backgroundImageView.bounds;
        maskLayer.path = maskPath.CGPath;
        _backgroundImageView.layer.mask = maskLayer;
    }
    return _backgroundImageView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.backgroundImageView.bounds), CGRectGetHeight(self.backgroundImageView.bounds))];
        _imageView.backgroundColor = [UIColor grayColor];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleToFill;
        
//        [_imageView addSubview:self.titleLabel];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.imageView.bounds) - 30, CGRectGetWidth(self.imageView.bounds), 30)];
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.500];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
                  cornerRadii:(CGFloat)cornerRadii {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.cornerRadii = cornerRadii;
        
        [self addSubview:self.backgroundImageView];
        
        [self.backgroundImageView addSubview:self.imageView];
    }
    return self;
}

@end
