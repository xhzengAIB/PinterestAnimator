//
//  XHPinterest.m
//  PinterestExample
//
//  Created by dw_iOS on 14-8-12.
//  Copyright (c) 2014年 广州华多网络科技有限公司 多玩事业部 iOS软件工程师 曾宪华. All rights reserved.
//

#import "XHPinterest.h"

@implementation XHPinterest

- (instancetype)initWithImageName:(NSString *)imageName
                            title:(NSString *)title {
    self = [super init];
    if (self) {
        if (imageName) {
            self.image = [UIImage imageNamed:imageName];
        }
        self.title = title;
    }
    return self;
}

@end
