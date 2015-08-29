//
//  WFWebImageRequestManager.h
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WFWebImageRequestManager : NSObject

+ (instancetype)sharedInstance;

- (void)requestWebImage:(NSString *)imageUrl forImageView:(UIImageView *)imageView;

@end
