//
//  XHPinterest.h
//  PinterestExample
//
//  Created by dw_iOS on 14-8-12.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHPinterest : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) NSString *title;

- (instancetype)initWithImageName:(NSString *)imageName
                            title:(NSString *)title;

@end
