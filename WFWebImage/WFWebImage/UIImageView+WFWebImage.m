//
//  UIImageView+WFWebImage.m
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import "UIImageView+WFWebImage.h"
#import "WFWebImageRequestManager.h"

@implementation UIImageView (WFWebImage)

- (void)setWebImage:(NSString *)imageUrl
{
    [self setWebImage:imageUrl placeholderImage:nil];
}

- (void)setWebImage:(NSString *)imageUrl placeholderImage:(UIImage *)placeholderImage
{
    self.image = placeholderImage;
    [[WFWebImageRequestManager sharedInstance] requestWebImage:imageUrl forImageView:self];
}

@end
