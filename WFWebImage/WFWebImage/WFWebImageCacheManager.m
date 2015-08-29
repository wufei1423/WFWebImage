//
//  WFWebImageCacheManager.m
//  WFWebImage
//
//  Created by feiwu on 15/8/29.
//  Copyright (c) 2015年 feiwu. All rights reserved.
//

#import "WFWebImageCacheManager.h"
#import "NSString+Hash.h"
#import <objc/runtime.h>

static NSString * const WFWebImageCacheName = @"WFWebImageCacheName";
static NSString * const WFWebImageKey = @"WFWebImageKey";

@interface WFWebImageCacheManager () <NSCacheDelegate>

@property (nonatomic, strong) NSCache *imageCache;

@end

@implementation WFWebImageCacheManager

+ (instancetype)sharedInstance
{
    static WFWebImageCacheManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

#pragma mark - lazy load

- (NSCache *)imageCache
{
    if (_imageCache == nil) {
        _imageCache = [[NSCache alloc] init];
        _imageCache.delegate = self;
        _imageCache.name = WFWebImageCacheName;
    }
    return _imageCache;
}

#pragma mark - help method

- (NSString *)filePathOfImageName:(NSString *)imageName
{
    NSString *tempPath = NSTemporaryDirectory();
    NSString *imageFolder = [tempPath stringByAppendingPathComponent:@"WFImageCache"];
    NSString *imagePath = [imageFolder stringByAppendingPathComponent:imageName];
    return imagePath;
}

#pragma mark - NSCacheDelegate

- (void)cache:(NSCache *)cache willEvictObject:(UIImage *)image
{
    NSString *imageUrl = objc_getAssociatedObject(image, &WFWebImageKey);
    NSString *imageName = [imageUrl sha1String];
    NSString *imagePath = [self filePathOfImageName:imageName];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:imagePath atomically:YES];
}

#pragma mark - public method

- (UIImage *)imageForKey:(NSString *)imageUrl
{
    // get  from memory
    UIImage *image = [self.imageCache objectForKey:imageUrl];
    if (image) {
        return image;
    };
    
    // get from disk
    image = [UIImage imageWithContentsOfFile:[self filePathOfImageName:[imageUrl sha1String]]];
    if (image) {
        [self.imageCache setObject:image forKey:imageUrl];
        return image;
    }
    
    return nil;
}

- (void)saveImage:(UIImage *)image forKey:(NSString *)imageUrl
{
    [self.imageCache setObject:image forKey:imageUrl];
}

@end
