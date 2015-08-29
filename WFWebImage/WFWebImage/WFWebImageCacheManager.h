//
//  WFWebImageCacheManager.h
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WFWebImageCacheManager : NSObject

+ (instancetype)sharedInstance;

- (UIImage *)imageForKey:(NSString *)imageUrl;

- (void)saveImage:(UIImage *)image forKey:(NSString *)imageUrl;

@end
