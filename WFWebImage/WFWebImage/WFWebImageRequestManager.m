//
//  WFWebImageRequestManager.m
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import "WFWebImageRequestManager.h"
#import "WFWebImageCacheManager.h"

static const NSTimeInterval WFWebImageTimeout = 30;

@interface WFWebImageRequestManager ()

@property (nonatomic, strong) NSMutableDictionary *imageViewDic;
@property (nonatomic, strong) NSMutableDictionary *imageViewUrlDic;
@property (nonatomic, strong) NSMutableArray *requestArr;

@end

@implementation WFWebImageRequestManager

+ (instancetype)sharedInstance
{
    static WFWebImageRequestManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

#pragma mark - lazy load

- (NSMutableDictionary *)imageViewDic
{
    if (_imageViewDic == nil) {
        _imageViewDic = [NSMutableDictionary dictionary];
    }
    return _imageViewDic;
}

- (NSMutableDictionary *)imageViewUrlDic
{
    if (_imageViewUrlDic == nil) {
        _imageViewUrlDic = [NSMutableDictionary dictionary];
    }
    return _imageViewUrlDic;
}

- (NSMutableArray *)requestArr
{
    if (_requestArr == nil) {
        _requestArr = [NSMutableArray array];
    }
    return _requestArr;
}

#pragma mark - public method

- (void)requestWebImage:(NSString *)imageUrl forImageView:(UIImageView *)imageView
{
    // get from cache
     UIImage *imageCache = [[WFWebImageCacheManager sharedInstance] imageForKey:imageUrl];
    if (imageCache) {
        imageView.image = imageCache;
        return;
    }
    
    // save imageView
    [self.imageViewDic setObject:imageView forKey:[NSNumber numberWithUnsignedInteger:imageView.hash]];
    
    // save imageView for url
    [self.imageViewUrlDic setObject:imageUrl forKey:[NSNumber numberWithUnsignedInteger:imageView.hash]];
    
    // already downloading
    if ([self.requestArr containsObject:imageUrl]) {
        return;
    }
    
    // init request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:imageUrl] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:WFWebImageTimeout];
    // record request
    [self.requestArr addObject:imageUrl];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *imageUrl = response.URL.absoluteString;
        if (connectionError == nil && data) {
            UIImage *imageDownload = [UIImage imageWithData:data];
            // refrsh UI
            NSMutableArray *refreshImageViews = [NSMutableArray array];
            NSArray *imageViews = self.imageViewDic.allKeys;
            for (NSUInteger i = 0; i < imageViews.count; i++) {
                id imageViewKey = imageViews[i];
                if ([self.imageViewUrlDic[imageViewKey] isEqualToString:imageUrl]) {
                    UIImageView *imageViewUI = self.imageViewDic[imageViewKey];
                    imageViewUI.image = imageDownload;
                    [refreshImageViews addObject:imageViewKey];
                }
            }
            // delete refreshed imageView
            for (NSUInteger i = 0; i < refreshImageViews.count; i++) {
                id imageViewKey = refreshImageViews[i];
                [self.imageViewDic removeObjectForKey:imageViewKey];
                [self.imageViewUrlDic removeObjectForKey:imageViewKey];
            }
            
            // cache
            [[WFWebImageCacheManager sharedInstance] saveImage:imageDownload forKey:imageUrl];
        }
        
        // delete record
        [self.requestArr removeObject:imageUrl];
    }];
}

@end
