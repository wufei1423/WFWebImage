//
//  UIImageView+WFWebImage.h
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (WFWebImage)

- (void)setWebImage:(NSString *)imageUrl;

- (void)setWebImage:(NSString *)imageUrl placeholderImage:(UIImage *)placeholderImage;

@end
