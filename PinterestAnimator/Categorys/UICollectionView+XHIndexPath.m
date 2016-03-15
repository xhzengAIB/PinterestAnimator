//
//  UICollectionView+XHIndexPath.m
//  PinterestExample
//
//  Created by dw_iOS on 14-7-21.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "UICollectionView+XHIndexPath.h"
#import <objc/runtime.h>

static NSString * const kXHIndexPathKey = @"XHIndexPathKey";

@implementation UICollectionView (XHIndexPath)


- (void)setCurrentIndexPath:(NSIndexPath *)indexPath {
    objc_setAssociatedObject(self, &kXHIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)currentIndexPath {
    NSInteger index = self.contentOffset.x / self.frame.size.width;
    
    NSIndexPath *indexPath = objc_getAssociatedObject(self, &kXHIndexPathKey);
    if (index > 0) {
        return [NSIndexPath indexPathForRow:index inSection:0];
    } else if (indexPath) {
        return indexPath;
    } else {
        return [NSIndexPath indexPathForRow:0 inSection:0];
    }
}

@end
